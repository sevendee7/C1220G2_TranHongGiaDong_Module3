package controller;

import model.bean.Employee;
import model.repository.CRUDRepository;
import model.repository.impl.EmployeeRepositoryImpl;
import model.service.CRUDService;
import model.service.impl.EmployeeServiceImpl;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

@WebServlet(name = "EmployeeServlet", urlPatterns = "/employees")
public class EmployeeServlet extends HttpServlet {

    private CRUDService<Employee> employeeService = new EmployeeServiceImpl();
    private CRUDRepository<Employee> employeeRepository = new EmployeeRepositoryImpl();

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String actionClient = request.getParameter("actionClient");

        if (actionClient == null) {
            actionClient = "";
        }

        switch (actionClient) {
            case "create":
                try {
                    insertEmployee(request, response);
                } catch (SQLException throwables) {
                    throwables.printStackTrace();
                }
                break;
            case "update":
                String id = request.getParameter("id");
                String name = request.getParameter("name");
                String dateOfBirth = request.getParameter("birthday");
                String idCard = request.getParameter("idCard");
                Double salary = Double.parseDouble(request.getParameter("salary"));
                String phone = request.getParameter("phone");
                String email = request.getParameter("email");
                String address = request.getParameter("address");
                Integer position = Integer.parseInt(request.getParameter("positionId"));
                Integer education = Integer.parseInt(request.getParameter("educationId"));
                Integer department = Integer.parseInt(request.getParameter("departmentId"));
                String userName = request.getParameter("userName");

                Employee employee = new Employee(id,name, dateOfBirth, idCard,salary,phone,email,address,position,education,department,userName);

                String msg = null;
                if (this.employeeService.save(employee)) {
                    msg = "Update successfully!";

                    request.setAttribute("msg", msg);
                    request.setAttribute("employeeObj", employee);
                    request.getRequestDispatcher("web/update_employee.jsp").forward(request, response);
                } else {
                    msg = "Update failed!";

                    request.setAttribute("msg", msg);
                    request.setAttribute("employeeObj", employee);
                    request.getRequestDispatcher("web/update_employee.jsp").forward(request, response);
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
                Integer id = Integer.parseInt(request.getParameter("id"));
                Employee employeeFromService = this.employeeService.findById(id);

                request.setAttribute("employeeObj", employeeFromService);
                request.getRequestDispatcher("web/update_employee.jsp").forward(request, response);
                break;
            case "delete":
                try {
                    deleteEmployee(request, response);
                } catch (SQLException throwables) {
                    throwables.printStackTrace();
                }
                break;
            case "searchByName":
                String keywordName = request.getParameter("keywordName");
                List<Employee> nameSearchList = this.employeeService.searchByName(keywordName);

                request.setAttribute("employeeListServlet", nameSearchList);
                request.setAttribute("keywordName", keywordName);
                request.getRequestDispatcher("web/employee_list.jsp").forward(request, response);

                break;
            case "searchById":
                String keywordId = request.getParameter("keywordId");
                List<Employee> idSearchList = this.employeeService.searchById(keywordId);

                request.setAttribute("employeeListServlet", idSearchList);
                request.setAttribute("keywordId", keywordId);
                request.getRequestDispatcher("web/employee_list.jsp").forward(request, response);

                break;
            case "searchByEmail":
                String keywordEmail = request.getParameter("keywordEmail");
                List<Employee> emailSearchList = this.employeeService.searchByEmail(keywordEmail);

                request.setAttribute("employeeListServlet", emailSearchList);
                request.setAttribute("keywordEmail", keywordEmail);
                request.getRequestDispatcher("web/employee_list.jsp").forward(request, response);

                break;
            default:
                loadList(request, response);
        }
    }

    private void loadList(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setAttribute("employeeListServlet", this.employeeService.findAll());
        request.getRequestDispatcher("web/employee_list.jsp").forward(request, response);
    }

    private void insertEmployee(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException, ServletException {
        String name = request.getParameter("name");
        String dateOfBirth = request.getParameter("dateOfBirth");
        String idCard = request.getParameter("idCard");
        Double salary = Double.parseDouble(request.getParameter("salary"));
        String phone = request.getParameter("phone");
        String email = request.getParameter("email");
        String address = request.getParameter("address");
        Integer positionId = Integer.parseInt(request.getParameter("positionId"));
        Integer educationId = Integer.parseInt(request.getParameter("educationId"));
        Integer departmentId = Integer.parseInt(request.getParameter("departmentId"));
        String userName = request.getParameter("email");

        Employee newEmployee = new Employee(name, dateOfBirth, idCard, salary, phone, email, address, positionId, educationId,
                departmentId, userName);
        employeeRepository.insertNewRecord(newEmployee);
        request.setAttribute("employeeListServlet", this.employeeService.findAll());
        RequestDispatcher dispatcher = request.getRequestDispatcher("web/employee_list.jsp");
        dispatcher.forward(request, response);

    }

    private void showNewForm(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        RequestDispatcher dispatcher = request.getRequestDispatcher("web/create_employee.jsp");
        dispatcher.forward(request, response);
    }

    private void deleteEmployee(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException, ServletException {
        int id = Integer.parseInt(request.getParameter("id"));
        employeeRepository.delete(id);
        loadList(request,response);
    }
}

