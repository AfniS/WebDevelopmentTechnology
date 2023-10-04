import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/employee-screening")
public class EmployeeScreeningServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String name = request.getParameter("name");
        String id = request.getParameter("id");
        int age = Integer.parseInt(request.getParameter("age"));
        String address = request.getParameter("address");
        String phone = request.getParameter("phone");
        String nationality = request.getParameter("nationality");
        
        String eligibilityMessage;
        String icon;
        String textColor;
        
        if (age >= 15 && age <= 64) {
            eligibilityMessage = "Congratulations, " + name + "! You are eligible to work at Fatma Cafe.";
            icon = "<i class='fas fa-check-circle'></i>"; // Green tick icon
            textColor = "green"; // Green text color
        } else {
            eligibilityMessage = "Sorry, " + name + ". You are not eligible to work at Fatma Cafe.";
            icon = "<i class='fas fa-times-circle'></i>"; // Red X icon
            textColor = "red"; // Red text color
        }
        
        // Set the content type to HTML
        response.setContentType("text/html");

        // Generate the HTML response with embedded CSS, Font Awesome icons, and Google Font
        String htmlResponse = "<html><head>" +
            "<link href='https://fonts.googleapis.com/css2?family=Open+Sans:wght@400;700&display=swap' rel='stylesheet'>" +
            "<link rel='stylesheet' href='https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css'>" +
            "<style>" +
            "body { background-color: #f0f8ff; font-family: 'Open Sans', sans-serif; }" + // Apply Google Font
            ".container { max-width: 400px; margin: 0 auto; text-align: center; padding: 30px; " +
            "border-radius: 10px; box-shadow: 0 0 20px rgba(0, 0, 0, 0.2); background-color: #fff; }" +
            "h1 { color: #007bff; }" +
            ".message { font-weight: bold; font-size: 18px; margin-top: 20px; color: " + textColor + "; }" +
            ".icon { font-size: 40px; margin-top: 10px; color: " + textColor + "; }" +
            "</style></head><body>" +
            "<div class=\"container\">" +
            "<h1>Employee Screening Result</h1>" +
            "<div class=\"icon\">" + icon + "</div>" +
            "<p class=\"message\">" + eligibilityMessage + "</p>" +
            "</div></body></html>";

        // Send the HTML response
        response.getWriter().println(htmlResponse);
    }
}
