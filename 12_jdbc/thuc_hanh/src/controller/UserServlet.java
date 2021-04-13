package controller;

import model.bean.User;
import model.repository.UserRepository;
import model.repository.impl.UserRepositoryImpl;
import model.service.UserService;
import model.service.impl.UserServiceImpl;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;

@WebServlet(name = "UserServlet", urlPatterns = {"","/users"})
public class UserServlet extends HttpServlet {

    private UserService userService = new UserServiceImpl();
    private UserRepository userRepository = new UserRepositoryImpl();

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String actionClient = request.getParameter("actionClient");

        if (actionClient == null) {
            actionClient = "";
        }

        switch (actionClient) {
            case "create":
                try {
                    insertUser(request,response);
                } catch (SQLException throwables) {
                    throwables.printStackTrace();
                }
                break;
            case "update":
                Integer id = Integer.parseInt(request.getParameter("id"));
                String name = request.getParameter("name");
                String email = request.getParameter("email");
                String country = request.getParameter("country");

                User user = new User(id, name, email, country);

                String msg = null;
                if (this.userService.save(user)) {
                    msg = "Update successfully!";
                    loadList(request, response);
                } else {
                    msg = "Update failed!";

                    request.setAttribute("msg", msg);
                    request.setAttribute("userObj", user);
                    request.getRequestDispatcher("update_user.jsp").forward(request, response);
                }
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
                User userFromService = this.userService.findById(id);

                request.setAttribute("userObj", userFromService);
                request.getRequestDispatcher("update_user.jsp").forward(request, response);
                break;
            case "delete":
                // your code
                break;
            default:
                loadList(request, response);
        }
    }

    private void loadList(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setAttribute("userListServlet", this.userService.findAll());
        request.getRequestDispatcher("list_by_jstl.jsp").forward(request, response);
    }

    private void showNewForm(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        RequestDispatcher dispatcher = request.getRequestDispatcher("user/create.jsp");
        dispatcher.forward(request, response);
    }

    private void insertUser(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException, ServletException {
        Integer id = Integer.parseInt(request.getParameter("id"));
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String country = request.getParameter("country");
        User newUser = new User(id, name, email, country);
        //userDAO.insertUser(newUser);
        userRepository.insertUser(newUser);
        RequestDispatcher dispatcher = request.getRequestDispatcher("user/create.jsp");
        dispatcher.forward(request, response);
    }
}
