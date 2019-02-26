package app;

import com.mysql.jdbc.Connection;
import com.mysql.jdbc.Statement;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import com.mysql.jdbc.Driver;

public class Conexion {

	public static Conexion instace;
    private final String connectionString = "jdbc:mysql://localhost/daw";
    private final String user = "root";
    private final String password = "";
    
	private Conexion() {}
	
	public static Conexion getInstance() {
		if(instace == null) instace = new Conexion();
		return instace;
	}
	
    public Connection connect() {
    	try {
			Class.forName("com.mysql.jdbc.Driver");
		} catch (ClassNotFoundException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
        Connection conn = null;
        try {
            conn = (Connection) DriverManager.getConnection(connectionString, user, password);
            if(!conn.isClosed()) System.out.println("Conexion establecida");
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        return conn;
    }
  
    public ArrayList<String> emps() {
        ArrayList<String> lineas = new ArrayList<String>();  
        Connection conn = null;
        try {
            conn = this.connect();
            Statement stmt = (Statement) conn.createStatement();
            String query = "SELECT NOM FROM emp";
            ResultSet rs = ((java.sql.Statement) stmt).executeQuery((java.lang.String) query);
            while(rs.next()){
                lineas.add(rs.getString("IdLinea"));
            }
        } catch(SQLException e){
            e.printStackTrace();
        } finally{
            
            try {
                if(conn != null && !conn.isClosed()) conn.close();
            } catch (SQLException ex) {
                Logger.getLogger(Conexion.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        return lineas;
    }
    
}
