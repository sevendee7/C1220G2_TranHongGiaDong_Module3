import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "CalculatorDiscountServlet", urlPatterns = "/discount")
public class CalculatorDiscountServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        double a = Double.parseDouble(request.getParameter("Price"));
        double b = Double.parseDouble(request.getParameter("Discount"));
        double result = a * (b / 100);
        request.setAttribute("resultFinal", result);
        request.getRequestDispatcher("result.jsp").forward(request, response);
        response.sendRedirect("result.jsp");
    }
}
