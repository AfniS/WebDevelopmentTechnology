<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import="javax.servlet.ServletException" %>
<%@ page import="javax.servlet.http.HttpSession" %>
<%@ page import="java.io.IOException" %>

<%
    // Invalidate the session
    HttpSession currentSession = request.getSession(false);
    if (currentSession != null) {
        currentSession.invalidate();
    }

    // Redirect to the login page
    response.sendRedirect("welcome.jsp");
%>
