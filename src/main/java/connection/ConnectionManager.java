package connection;

import java.sql.*;

public class ConnectionManager {

    static Connection con;

    private static final String DB_DRIVER = "org.postgresql.Driver";
    private static final String DB_CONNECTION = "jdbc:postgresql://ec2-54-144-165-97.compute-1.amazonaws.com:5432" + "/d3g2s8m8pga0t5";
    private static final String DB_USER = "kochvwklfkakik";
    private static final String DB_PASSWORD = "d62446c6444745f52e4813b08658f26773094f08d31432f622100b6d0fa9d4da";
	
    public static Connection getConnection() {

        try {

            Class.forName(DB_DRIVER);

            try {
                con = DriverManager.getConnection(DB_CONNECTION,DB_USER,DB_PASSWORD);
                System.out.println("connected");

            }

            catch (SQLException ex) {
                ex.printStackTrace();
            }
        }

        catch (ClassNotFoundException e) {
            System.out.println(e);
        }

        return con;
    }
}
