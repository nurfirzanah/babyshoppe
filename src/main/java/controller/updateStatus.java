package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import connection.ConnectionManager;

/**
 * Servlet implementation class editProductController
 */
@WebServlet("/updateStatus")
public class updateStatus extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public updateStatus() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
		PrintWriter out = response.getWriter();
		
        int orderId = Integer.parseInt(request.getParameter("id"));
        String status = request.getParameter("status");
        
        Connection conn = null;
        
		 try {

			 Connection con = ConnectionManager.getConnection();

	            Statement st = con.createStatement();

	            String sql = "update cust_order set orderStatus = '"+status+"' where orderId='"+orderId+"'";
	            
	            st.executeUpdate(sql);
	     
	            System.out.println("Data is Successfully Updated into Product Table");
	               }catch (SQLException ex) {
	                   
	                   ex.printStackTrace();
	               } finally {
	                   if (conn != null) {
	                       // closes the database connection
	                       try {
	                           conn.close();
	                       } catch (SQLException ex) {
	                           ex.printStackTrace();
	                       }
	                   }
	         }response.sendRedirect("viewOrder.jsp");
	    }

	}
