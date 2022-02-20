package controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import connection.ConnectionManager;

/**
 * Servlet implementation class orderController
 */
@WebServlet("/orderController")
public class orderController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public orderController() {
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
		
		int prodId = Integer.parseInt(request.getParameter("prodId"));
		int userId = Integer.parseInt(request.getParameter("userId"));
		double prodPrice = Double.parseDouble(request.getParameter("prodPrice"));
		double orderPrice = 0.0;
		int orderQty = Integer.parseInt(request.getParameter("qty"));
		String size = request.getParameter("size");
		
		orderPrice = prodPrice * orderQty;
		
		try {
			
			String searchQuery = "insert into cust_order( prodId, userId, orderPrice, orderQty, orderDetails, orderStatus) values ( '"+prodId+"', '"+userId+"','"+orderPrice+"','"+orderQty+"', '"+size+"', 'pending')";
			Connection con = ConnectionManager.getConnection();
			 ResultSet rs = null; 
			PreparedStatement ps=null;
			Statement stmt=null;
				
			//3. create statement 
			stmt = con.createStatement();

			//4. execute query
			stmt.executeUpdate(searchQuery);

			
			
			con.close();
		}catch(Exception e) {
			e.printStackTrace();
			
			
		}
			
	response.sendRedirect("checkout.jsp?");
	}
}

