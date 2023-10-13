import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/EligibilityServlet")
public class EligibilityServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String name = request.getParameter("name");
        String id = request.getParameter("id");
        int age = Integer.parseInt(request.getParameter("age"));
        String disease = request.getParameter("disease");

        // Check for the presence of "Accept-Language" header
        String acceptLanguage = request.getHeader("Accept-Language");
        if (acceptLanguage != null && acceptLanguage.contains("ms")) {
            response.setContentType("text/html;charset=UTF-8");

            // Add CSS styles and logo inline
            response.getWriter().write("<html>");
            response.getWriter().write("<head>");
            response.getWriter().write("<style>");
            response.getWriter().write("body { background-color: #f0f8ff; font-family: Arial, sans-serif; text-align: center; }");
            response.getWriter().write(".container { margin: 0 auto; max-width: 400px; padding: 20px; background-color: #F44D39; border-radius: 10px; box-shadow: 0 0 10px rgba(0, 0, 0, 0.2); }");
            response.getWriter().write("h1 { color: #FFC72C; }");
            response.getWriter().write(".logo { margin-bottom: 20px; }");
            response.getWriter().write(".logo img { width: 150px; }");
            response.getWriter().write("</style>");
            response.getWriter().write("</head>");
            response.getWriter().write("<body>");
            response.getWriter().write("<div class='container'>");
            response.getWriter().write("<div class='logo'>");
            response.getWriter().write("<img src='img/mcd.png' alt='McDonald's Logo'>");
            response.getWriter().write("</div>");
            response.getWriter().write("<h1>Keputusan Kelayakan</h1>");

            if (age >= 18 && age <= 28 && "no".equalsIgnoreCase(disease)) {
                response.getWriter().write("<p>Tahniah, " + name + "! Anda layak menjadi staf baru di McDonald's Merlimau.</p>");
            } else {
                response.getWriter().write("<p>Maaf, " + name + ". Anda tidak layak menjadi staf baru di McDonald's Merlimau.</p>");
            }

            response.getWriter().write("</div>");
            response.getWriter().write("</body>");
            response.getWriter().write("</html>");
        } else {
            response.setContentType("text/html;charset=UTF-8");
            response.getWriter().write("Sila tetapkan tajuk 'Accept-Language' kepada 'ms' untuk Bahasa Malaysia.");
        }
    }
}
