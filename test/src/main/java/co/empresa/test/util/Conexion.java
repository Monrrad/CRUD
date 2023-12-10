package co.empresa.test.util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;


public class Conexion {
	

	    private Connection con = null;
	    private static Conexion db;
	    private PreparedStatement preparedStatement;

	    private static final String url = "jdbc:mysql://localhost:3306/";
	    private static final String dbName = "sistema";
	    private static final String driver = "com.mysql.jdbc.Driver";
	    private static final String userName = "root";
	    private static final String password = "";

	    private Conexion() {
	        try {
	            Class.forName(driver);
	            con = DriverManager.getConnection(url + dbName, userName, password);
	        } catch (ClassNotFoundException | SQLException e) {
	           
	            e.printStackTrace();
	        }
	    }

	    public void cerrarConexion() {
	        try {
	            if (con != null && !con.isClosed()) {
	                con.close();
	            }
	        } catch (SQLException e) {
	            e.printStackTrace();
	        }
	    }

	    public void cerrarRecursos() {
	        try {
	            if (preparedStatement != null && !preparedStatement.isClosed()) {
	                preparedStatement.close();
	            }
	            cerrarConexion();
	        } catch (SQLException e) {
	            e.printStackTrace();
	        }
	    }

	    public static Conexion getConexion() {
	        if (db == null) {
	            db = new Conexion();
	        }
	        return db;
	    }

	    public ResultSet query() throws SQLException {
	        if (preparedStatement != null) {
	            return preparedStatement.executeQuery();
	        } else {
	            throw new SQLException("La declaración preparada es nula");
	        }
	    }

	    public int execute() throws SQLException {
	        if (preparedStatement != null) {
	            return preparedStatement.executeUpdate();
	        } else {
	            throw new SQLException("La declaración preparada es nula");
	        }
	    }

	    public Connection getCon() {
	        return con;
	    }

	    public PreparedStatement setPreparedStatement(String sql) throws SQLException {
	        if (con != null) {
	            preparedStatement = con.prepareStatement(sql);
	            return preparedStatement;
	        } else {
	            throw new SQLException("La conexión es nula");
	        }
	    }
	}

