package controller;

import model.bean.Customer;
import model.repository.CRUDRepository;
import model.repository.impl.CustomerRepositoryImpl;
import model.service.CRUDService;
import model.service.impl.CustomerServiceImpl;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

@WebServlet(name = "CustomerServlet", urlPatterns = "/customers")
public class CustomerServlet extends HttpServlet {

    private CRUDService<Customer> customerService = new CustomerServiceImpl();
    private CRUDRepository<Customer> customerRepositoryImpl = new CustomerRepositoryImpl();
    CustomerRepositoryImpl customerRepository = new CustomerRepositoryImpl();

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String actionClient = request.getParameter("actionClient");

        if (actionClient == null) {
            actionClient = "";
        }

        switch (actionClient) {
            case "create":
                try {
                    insertCustomer(request, response);
                } catch (SQLException throwables) {
                    throwables.printStackTrace();
                }
                break;
            case "update":
                String id = request.getParameter("id");
                String name = request.getParameter("name");
                String dateOfBirth = request.getParameter("dateOfBirth");
                boolean gender = Boolean.parseBoolean(request.getParameter("gender"));
                String idCard = request.getParameter("idCard");
                String phone = request.getParameter("phone");
                String email = request.getParameter("email");
                String address = request.getParameter("address");
                Integer typeId = Integer.parseInt(request.getParameter("customerType"));


                Customer customer = new Customer(id,name, dateOfBirth,gender, idCard,phone,email,address,typeId);

                String msg = null;
                if (this.customerService.save(customer)) {
                    msg = "Update successfully!";
                    loadList(request, response);
                } else {
                    msg = "Update failed!";

                    request.setAttribute("msg", msg);
                    request.setAttribute("customerObj", customer);
                    request.getRequestDispatcher("web/update_customer.jsp").forward(request, response);
                }
                break;
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String actionClient = request.getParameter("actionClient");

        if (actionClient == null) {
            actionClient = "";
        }
        switch (actionClient) {
            case "create":
                showNewForm(request, response);
                break;
            case "update":
                String id = request.getParameter("id");
                Customer customerFromService = this.customerRepository.findCustomerById(id);

                request.setAttribute("customerObj", customerFromService);
                request.getRequestDispatcher("web/update_customer.jsp").forward(request, response);
                break;
            case "delete":
                try {
                    deleteEmployee(request, response);
                } catch (SQLException throwables) {
                    throwables.printStackTrace();
                }
                break;
            case "search":
                String keywordName = request.getParameter("keywordName");
                String keywordId = request.getParameter("keywordId");
                String keywordEmail = request.getParameter("keywordEmail");
                List<Customer> nameSearchList = this.customerRepository.searchByMultipleKeyword(keywordName,keywordId,keywordEmail);

                request.setAttribute("customerListServlet", nameSearchList);
                request.setAttribute("customerTypeServlet", this.customerRepository.findAllCustomerType());
                request.setAttribute("keywordName", keywordName);
                request.setAttribute("keywordId", keywordId);
                request.setAttribute("keywordEmail", keywordEmail);
                request.getRequestDispatcher("web/customer_list.jsp").forward(request, response);

                break;
            default:
                loadList(request, response);
        }
    }

    private void loadList(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setAttribute("customerListServlet", this.customerService.findAll());
        request.setAttribute("customerTypeServlet", this.customerRepository.findAllCustomerType());
        request.getRequestDispatcher("web/customer_list.jsp").forward(request, response);
    }

    private void insertCustomer(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException, ServletException {
        String id = request.getParameter("id");
        String name = request.getParameter("name");
        String dateOfBirth = request.getParameter("dateOfBirth");
        boolean gender = Boolean.parseBoolean(request.getParameter("gender"));
        String idCard = request.getParameter("idCard");
        String phone = request.getParameter("phone");
        String email = request.getParameter("email");
        String address = request.getParameter("address");
        Integer typeId = Integer.parseInt(request.getParameter("customerType"));
        Customer newCustomer = new Customer(id, name, dateOfBirth, gender, idCard ,phone, email, address, typeId);
        customerRepositoryImpl.insertNewRecord(newCustomer);
        request.setAttribute("customerListServlet", this.customerService.findAll());
        RequestDispatcher dispatcher = request.getRequestDispatcher("web/customer_list.jsp");
        dispatcher.forward(request, response);
    }

    private void showNewForm(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        RequestDispatcher dispatcher = request.getRequestDispatcher("web/create_customer.jsp");
        dispatcher.forward(request, response);
    }

    private void deleteEmployee(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException, ServletException {
        String id = request.getParameter("id");
        customerRepository.deleteCustomer(id);
        loadList(request,response);
    }
}
