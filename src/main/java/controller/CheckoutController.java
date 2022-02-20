package controller;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import connection.ConnectionManager;

/**
 * Servlet implementation class CheckoutController
 */
@WebServlet("/CheckoutController")
public class CheckoutController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CheckoutController() {
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
		int userid = Integer.parseInt(request.getParameter("userid"));
		System.out.println(userid);
		String address = request.getParameter("address");
		String payment = request.getParameter("payment");
		int orderid = Integer.parseInt(request.getParameter("orderId"));
		Double paytotal = Double.parseDouble(request.getParameter("tot"));
		Connection conn = null; 
		try {

			Connection con = ConnectionManager.getConnection();

            Statement st = con.createStatement();
            Statement st2 = con.createStatement();
            Statement st1 = con.createStatement();
            String sql = "update customer set USERADDRESS='"+address+"' where USERID='"+userid+"'";
            String sql1 = "insert into Payment(ORDERID, PAYTOTAL, PAYMETHOD) values ('"+orderid+"', '"+paytotal+"', '"+payment+"')";
            String sql2 = "drop table prodcart";
            st.executeUpdate(sql);
            System.out.println("Data is Successfully Updated into Customer Order Table");
          
            //3. create statement 
			
			//4. execute query
			st2.executeUpdate(sql1);
			st1.executeUpdate(sql2);
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

         }response.sendRedirect("listProduct.jsp");
    }

}
