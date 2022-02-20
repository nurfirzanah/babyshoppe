<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import ="java.sql.DriverManager"%>
<%@page import= "java.sql.SQLException"%>
<%@ page import = "connection.ConnectionManager" %>

 <%   int prodId = Integer.parseInt(request.getParameter("prodId"));

Connection connection = ConnectionManager.getConnection();

Statement st2 = connection.createStatement();

Statement st = connection.createStatement();
st2.executeUpdate("delete from clothes where prodId = '"+prodId+"'");
st.executeUpdate("delete from product where prodId = '"+prodId+"'");

    //st.executeUpdate(dlteQuery);
    out.println("Deleted!!");
    response.sendRedirect("ViewProductlist.jsp");
%>