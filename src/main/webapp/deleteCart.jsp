<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!-- SERVLET FOR RETRIEVE CATEGORY -->
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="connection.ConnectionManager"%>

<!-- END SERVLET FOR RETRIEVE CATEGORY -->

 <%  System.out.println(Integer.parseInt(request.getParameter("orderId"))); 
 int orderID = Integer.parseInt(request.getParameter("orderId"));
 String email = (String)session.getAttribute("sessionName");

Connection connection = ConnectionManager.getConnection();
Statement st = connection.createStatement();
st.executeUpdate("delete from ORDERID where ORDERID = '"+orderID+"' and userId = (select userId from customer where userEmail = '"+email+"')");
    //st.executeUpdate(dlteQuery);
    out.println("Deleted!!");
    response.sendRedirect("Cart.jsp");
%>