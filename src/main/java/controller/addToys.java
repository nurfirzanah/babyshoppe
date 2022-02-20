package controller;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import connection.ConnectionManager;
 
@WebServlet("/addToys")
@MultipartConfig(maxFileSize = 16177215)    // upload file's size up to 16MB
public class addToys extends HttpServlet {
     
    // database connection settings
     
    protected void doPost(HttpServletRequest request,
            HttpServletResponse response) throws ServletException, IOException {
        // gets values of text fields
        String prodName = request.getParameter("prodname");
        String prodDesc = request.getParameter("prodDesc");
        String prodSize = request.getParameter("prodsize");
        int prodQty = Integer.parseInt(request.getParameter("prodQty"));
        Double prodPrice = Double.parseDouble(request.getParameter("prodprice"));
        int adminId = Integer.parseInt(request.getParameter("adminId"));
        Part part = request.getPart("img");
        
        String applicationPath = getServletContext().getRealPath("");
        // obtains the upload file part in this multipart request
        String host = request.getHeader("X-Forwarded-Proto") + "://" + "mombabystore.herokuapp.com" + "/";
        String fileName = part.getSubmittedFileName();
        String urlPathForDB = host + "images/" + fileName;
        String savePath = applicationPath + "images" + File.separator + fileName;

        new File(applicationPath + "images").mkdir();
        part.write(savePath);

      
        // obtains the upload file part in this multipart request
     
         
        Connection conn = null; // connection to the database
        String message = null;  // message will be sent back to client
         
        try {
            // connects to the database
        	Connection con = ConnectionManager.getConnection();
        	InputStream is = part.getInputStream();
        	
        	String sql = "insert into product( prodName, prodQty, prodDesc, prodPrice, prodType, adminId, filename, savepath) "
            		+ "values('"+prodName+"', '"+prodQty+"', '"+prodDesc+"', '"+prodPrice+"','clothes', '"+adminId+"', '"+fileName+"', '"+urlPathForDB+"')";
          
             PreparedStatement ps=null;
 			Statement stmt=null;
 			stmt = con.createStatement();
 			stmt.executeUpdate(sql);	
 			//3. create statement 
 			String sql2 = "insert into toys (prodId, colour) values((selext max(prodid) from product), '"+prodSize+"')";
          
      
 			Statement stmt2=null;
 			stmt2 = con.createStatement();
 			stmt2.executeUpdate(sql2);
 			
			
			PreparedStatement ps2 = con.prepareStatement("update product set product_img = ? where prodid = (select max(prodId) from product)");
			ps2.setBlob(1, is);
			ps2.executeUpdate();
           

        } catch (SQLException ex) {
            
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
            // sets the message in request scope
   // forwards to the message page
            
        }response.sendRedirect("viewToys.jsp");
    }
}
