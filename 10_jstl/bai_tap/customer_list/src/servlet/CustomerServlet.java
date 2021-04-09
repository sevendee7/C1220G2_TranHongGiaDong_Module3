package servlet;

import bean.Customer;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "CustomerServlet", urlPatterns = {"", "/list"})
public class CustomerServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Customer> customerList = new ArrayList<>();
        customerList.add(new Customer("Yoona","05/07/2002","Korea",
                "https://i.pinimg.com/originals/52/3a/2f/523a2f0784d58ea1e1fe5ea9e68686b4.gif"));
        customerList.add(new Customer("Rosie","21/07/1993","USA",
                "https://i.pinimg.com/originals/bd/1b/e1/bd1be16adae36f84e66758e68a5d2a5e.gif"));
        customerList.add(new Customer("Jennifer Lawrence","29/03/1990","USA",
                "https://i.pinimg.com/originals/12/83/f5/1283f591ed67b913d9281ef73130b585.gif"));
        request.setAttribute("customerListServlet", customerList);
        request.getRequestDispatcher("list_by_jstl.jsp").forward(request, response);
    }
}
