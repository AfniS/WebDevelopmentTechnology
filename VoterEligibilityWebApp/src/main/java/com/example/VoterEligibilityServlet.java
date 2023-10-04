//this code is owned by Nurafni Hashima Binti Suhib (20DDT21F1010)
//for DFP50173,Sir Azlan

package com.example;

import java.io.*;
import javax.servlet.*;
import javax.servlet.annotation.*;
import javax.servlet.http.*;

@WebServlet("/voter-eligibility")
public class VoterEligibilityServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public VoterEligibilityServlet() {
        super();
    }

    @Override
    public void init() throws ServletException {
        // Requirement III: Display "System is starting ..." during initialization
        System.out.println("System is starting ...");
    }

    @Override
    public void destroy() {
        // Requirement IV: Display "The system is destroyed" during destruction
        System.out.println("The system is destroyed");
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();

        // Requirement V: Display "The system is running ..." for each GET request
        System.out.println("The system is running ...");

        out.println("<html><head><title>Voter Eligibility Check</title>");
        out.println("<style>");
        out.println("body { font-family: Arial, sans-serif; background-color: #f0f0f0; text-align: center; }");
        out.println("h1 { color: #333; }");
        out.println(".container { max-width: 400px; margin: 0 auto; padding: 20px; background-color: #fff; border-radius: 10px; box-shadow: 0 0 10px rgba(0, 0, 0, 0.1); }");
        out.println(".center-button { text-align: center; }"); // CSS for centering the button
        out.println(".btn { background-color: #007BFF; color: white; padding: 10px 20px; border: none; cursor: pointer; border-radius: 20px; font-size: 16px; }"); // Styled button
        out.println("</style></head><body>");
        out.println("<div class='container'>");
        out.println("<h1>Suruhanjaya Pilihan Raya Malaysia (SPR) Voter Eligibility Check</h1>");
        
        // Center the "Check Eligibility" button
        out.println("<div class='center-button'>");
        out.println("<form action='/VoterEligibilityWebApp/voter-eligibility' method='post'>");
        out.println("<input type='radio' name='age' value='under18' id='under18'><label for='under18'>Less than 18 years old</label><br>");
        out.println("<input type='radio' name='age' value='over18' id='over18'><label for='over18'>18 years old or older</label><br>");
        out.println("<br><br>");
        out.println("<input type='submit' class='btn' value='Check Eligibility'>");
        out.println("</form>");
        out.println("</div>");

        out.println("</div>");
        out.println("</body></html>");
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String age = request.getParameter("age");
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();

        out.println("<html><head><title>SPR Voter Eligibility Result</title>");
        out.println("<style>");
        out.println("body { font-family: Arial, sans-serif; background-color: #f0f0f0; text-align: center; }");
        out.println("h1 { color: #333; }");
        out.println(".container { max-width: 400px; margin: 0 auto; padding: 20px; background-color: #fff; border-radius: 10px; box-shadow: 0 0 10px rgba(0, 0, 0, 0.1); }");
        out.println(".center-button { text-align: center; }"); // CSS for centering the button
        out.println(".btn { background-color: #007BFF; color: white; padding: 10px 20px; border: none; cursor: pointer; border-radius: 20px; font-size: 16px; }"); // Styled button
        out.println("</style></head><body>");
        out.println("<div class='container'>");
        out.println("<h1>SPR Voter Eligibility Result</h1>");

        if (age != null) {
            if (age.equals("under18")) {
                out.println("<p>You are not eligible to vote for the general election.</p>");
            } else if (age.equals("over18")) {
                out.println("<p>You are eligible to vote for the general election.</p>");
            }
        } else {
            out.println("<p>Please select your age range.</p>");
        }

        // Add a button to return to the SPR voter eligibility page
        out.println("<div class='center-button'>");
        out.println("<br><br>");
        out.println("<form action='/VoterEligibilityWebApp/voter-eligibility' method='get'>");
        out.println("<input type='submit' class='btn' value='Go Back'>");
        out.println("</form>");
        out.println("</div>");

        out.println("</div>");
        out.println("</body></html>");
    }
}
