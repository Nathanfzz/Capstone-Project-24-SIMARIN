package service;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DatabaseConnection {
    private static final String URL = "jdbc:mysql://localhost:3306/pelaporan";
    private static final String USER = "root";
    private static final String PASS = "";

    // Tidak menyimpan connection statis yang bisa tertutup
    public static Connection getConnection() {
        try {
            Connection conn = DriverManager.getConnection(URL, USER, PASS);
            if (conn != null && !conn.isClosed()) {
                System.out.println("✓ Koneksi ke database berhasil!");
            }
            return conn;
        } catch (SQLException e) {
            System.out.println("❌ Koneksi gagal: " + e.getMessage());
            return null;
        }
    }
}
