package controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import connection.ConnectionManager;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


@WebServlet("/logincontroller")
public class loginController extends HttpServlet {
	HttpSession session;
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		try {
			//get the current session
			HttpSession session = request.getSession(true);
			//set current session to null.
			session.setAttribute("sessionName", null);
			//destroy session
			session.invalidate();
			//redirect to login page
			response.sendRedirect("login.jsp");
		}catch (Throwable ex) {
			System.out.println(ex);
		}
	}

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String email = request.getParameter("email");
        String password = request.getParameter("password");
       

        try {
        	Connection con = ConnectionManager.getConnection();

            PreparedStatement ps = con.prepareStatement("select ADMINEMAIL, ADMINPASS from admin where adminEmail=? and adminPass=?");
      
            ps.setString(1, email);
            ps.setString(2, password);
            
            
            session = request.getSession(true);
		
			session.setAttribute("sessionName", email);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                response.sendRedirect("ViewProductlist.jsp");
                return;
            }
            response.sendRedirect("login.jsp");
            return;
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

}