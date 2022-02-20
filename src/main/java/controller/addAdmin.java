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
 * Servlet implementation class AddCustomerController
 */
@WebServlet("/AddAdmin")
public class addAdmin extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public addAdmin() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
		PrintWriter out = response.getWriter();
		
		String name = request.getParameter("name");
		String email = request.getParameter("email");
		String pass = request.getParameter("password");
		int num = Integer.parseInt(request.getParameter("number"));
		String address = request.getParameter("address");
		int id = Integer.parseInt(request.getParameter("adminID"));
		
		Connection con = null;
		
		try {

			 // connects to the database
        	Connection conn = ConnectionManager.getConnection();

			Statement st = conn.createStatement();

			String sql = "insert into admin(adminid,adminName,adminemail,adminpass,adminnum,adminaddress,managerid) values(admin_seq.NextVal,'"+ name + "','" + email + "','" + pass + "','" + num + "','" + address + "', '"+id+"' )";

			st.executeUpdate(sql);
			out.println("Data is Successfully inserted into Customer Table");
		} catch (SQLException ex) {
            
            ex.printStackTrace();
        } finally {
            if (con != null) {
                // closes the database connection
                try {
                    con.close();
                } catch (SQLException ex) {
                    ex.printStackTrace();
                }
            }
		response.sendRedirect("ViewProductlist.jsp");
	}

}}