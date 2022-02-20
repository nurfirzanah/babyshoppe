<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="java.sql.Blob"%>
<%@page import="java.io.OutputStream"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ page import = "connection.ConnectionManager" %>

<% String id = request.getParameter("prodID");
  		Connection connection = ConnectionManager.getConnection();
  		PreparedStatement ps = connection.prepareStatement("select * from product where prodID=?");
  	    ps.setString(1, id);
  	    ResultSet rs = ps.executeQuery();
  	 try{
  	    if(rs.next()){
  	        Blob blob = rs.getBlob("product_img");
  	        byte byteArray[] = blob.getBytes(1, (int)blob.length());
  	        response.setContentType("image/gif");
  	        OutputStream os = response.getOutputStream();
  	        os.write(byteArray);
  	        os.flush();
  	        os.close();}
  	}
  	catch(Exception e){
  	    e.printStackTrace();
  	}  
  	finally{
  	    if(connection != null){
  	        try{
  	            connection.close();
  	        }
  	        catch(Exception e){
  	            e.printStackTrace();
  	        }
  	    }
  	}
%>
