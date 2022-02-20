package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DatabaseMetaData;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.postgresql.jdbc.PgDatabaseMetaData;

import connection.ConnectionManager;
/**
 * Servlet implementation class CartController
 */
@WebServlet("/CartController")
public class CartController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CartController() {
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
		String prodName = request.getParameter("prodName");
		orderPrice = prodPrice * orderQty;
		Connection conn = null;
		
		try {

			Connection con = ConnectionManager.getConnection();
			PgDatabaseMetaData dbm = (PgDatabaseMetaData) con.getMetaData();
            
            ResultSet tables = dbm.getTables (null, null, "PRODCART",null );
            
            if(tables.next())
            {
            	
            String sql1 = " insert into prodcart(cartId, userId, cartQty, cartName, cartPrice, prodDetails) values "
	            		+ "('"+prodId+"','"+userId+"', '"+orderQty+"', '"+prodName+"', '"+orderPrice+"', '"+size+"')";
         
            PreparedStatement ps1=null;
			Statement st1=null;
			st1 = con.createStatement();
			st1.executeUpdate(sql1);	
			
			
		
            System.out.println("cart inserted");
            	
            }
            	
            	
            else
            {
            String sql = "create table prodcart "
            		+ "("
            		+ "cartId int NOT NULL, userId int NOT NULL, cartQty int, cartName varchar(100),"
            		+ "cartPrice float, prodDetails varchar(100)"
            		+ ")";
        
            PreparedStatement ps=null;
			Statement stmt=null;
			stmt = con.createStatement();
			stmt.executeUpdate(sql);	
			
			System.out.println("cart created");
			
			 String sql1 = " insert into prodcart(cartId, userId, cartQty, cartName, cartPrice, prodDetails) values "
	            		+ "('"+prodId+"','"+userId+"', '"+orderQty+"', '"+prodName+"', '"+orderPrice+"', '"+size+"')";
     
			PreparedStatement ps1=null;
			Statement st1=null;
			st1 = con.createStatement();
			st1.executeUpdate(sql1);	
		
		
	
        System.out.println("cart inserted");
			//3. create statement 
            }
			  
			
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
         }response.sendRedirect("Cart.jsp");
    }

}

