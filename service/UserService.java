package service;

import java.sql.*;
import java.util.*;
import model.*;


public class UserService {
    private Connection conn;

    public UserService() {
        conn = DatabaseConnection.getConnection();
    }

    // === LOGIN PAKAI nama_user ===
    public User login(String namaUser, String password) {
        String sql = "SELECT * FROM user WHERE nama_user = ? AND password = ?";
        try (PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, namaUser);
            ps.setString(2, password);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                User u = new User() {
                    @Override
                    public int getId_user() {
                        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
                    }
                };
                u.setIdUser(rs.getInt("id_user"));
                u.setNamaUser(rs.getString("nama_user"));
                u.setPassword(rs.getString("password"));
                u.setPeran(rs.getString("peran"));
                u.setNoHp(rs.getString("no_hp"));
                return u;
            }
        } catch (SQLException e) {
            System.out.println("❌ Login error: " + e.getMessage());
        }
        return null;
    }

    // === REGISTRASI MASYARAKAT (otomatis tambah ke tabel masyarakat juga) ===
    public boolean registerMasyarakat(Masyarakat m) {
        String sqlUser = "INSERT INTO user (nama_user, password, peran, no_hp) VALUES (?, ?, 'Masyarakat', ?)";
        String sqlMas = "INSERT INTO masyarakat (nik, id_user, email) VALUES (?, ?, ?)";
        try {
            conn.setAutoCommit(false);

            // Tambah user
            PreparedStatement psUser = conn.prepareStatement(sqlUser, Statement.RETURN_GENERATED_KEYS);
            psUser.setString(1, m.getNamaUser());
            psUser.setString(2, m.getPassword());
            psUser.setString(3, m.getNoHp());
            psUser.executeUpdate();

            ResultSet rs = psUser.getGeneratedKeys();
            int idUser = 0;
            if (rs.next()) {
                idUser = rs.getInt(1);
            }

            // Tambah masyarakat
            PreparedStatement psMas = conn.prepareStatement(sqlMas);
            psMas.setString(1, m.getNik());
            psMas.setInt(2, idUser);
            psMas.setString(3, m.getEmail());
            psMas.executeUpdate();

            conn.commit();
            System.out.println("✓ Registrasi masyarakat berhasil!");
            return true;
        } catch (SQLException e) {
            try {
                conn.rollback();
            } catch (SQLException ex) {
                System.out.println("Rollback error: " + ex.getMessage());
            }
            System.out.println("❌ Registrasi gagal: " + e.getMessage());
        } finally {
            try {
                conn.setAutoCommit(true);
            } catch (SQLException ignored) {}
        }
        return false;
    }

    // === LIHAT SEMUA USER ===
    public void lihatSemuaUser() {
        String sql = "SELECT * FROM user";
        try (Statement st = conn.createStatement();
             ResultSet rs = st.executeQuery(sql)) {
            System.out.println("\n=== DAFTAR USER ===");
            while (rs.next()) {
                System.out.println("ID: " + rs.getInt("id_user"));
                System.out.println("Nama: " + rs.getString("nama_user"));
                System.out.println("Peran: " + rs.getString("peran"));
                System.out.println("No HP: " + rs.getString("no_hp"));
                System.out.println("--------------------------------");
            }
        } catch (SQLException e) {
            System.out.println("Lihat user error: " + e.getMessage());
        }
    }

    // === PERBARUI USER ===
    public void perbaruiUser(int id) {
        Scanner sc = new Scanner(System.in);
        System.out.print("Nama Baru: ");
        String nama = sc.nextLine();
        System.out.print("Password Baru: ");
        String pass = sc.nextLine();
        System.out.print("No HP Baru: ");
        String nohp = sc.nextLine();

        String sql = "UPDATE user SET nama_user=?, password=?, no_hp=? WHERE id_user=?";
        try (PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, nama);
            ps.setString(2, pass);
            ps.setString(3, nohp);
            ps.setInt(4, id);
            ps.executeUpdate();
            System.out.println("✓ Data user berhasil diperbarui!");
        } catch (SQLException e) {
            System.out.println("Perbarui user error: " + e.getMessage());
        }
    }

    // === HAPUS USER ===
    public void hapusUser(int id) {
        String sql = "DELETE FROM user WHERE id_user=?";
        try (PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, id);
            ps.executeUpdate();
            System.out.println("✓ User berhasil dihapus!");
        } catch (SQLException e) {
            System.out.println("Hapus user error: " + e.getMessage());
        }
    }

    // === CARI USER BERDASARKAN NAMA ===
    public void cariUser(String keyword) {
        String sql = "SELECT * FROM user WHERE nama_user LIKE ?";
        try (PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, "%" + keyword + "%");
            ResultSet rs = ps.executeQuery();
            System.out.println("\n=== HASIL PENCARIAN USER ===");
            while (rs.next()) {
                System.out.println("ID: " + rs.getInt("id_user"));
                System.out.println("Nama: " + rs.getString("nama_user"));
                System.out.println("Peran: " + rs.getString("peran"));
                System.out.println("No HP: " + rs.getString("no_hp"));
                System.out.println("--------------------------------");
            }
        } catch (SQLException e) {
            System.out.println("Cari user error: " + e.getMessage());
        }
    }
}
