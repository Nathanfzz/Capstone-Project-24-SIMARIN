package service;

import java.sql.*;
import java.util.*;
import model.*;


public class TindakLanjutService {
    private Connection conn;

    public TindakLanjutService() {
        conn = DatabaseConnection.getConnection();
    }

    // === TAMBAH TINDAK LANJUT ===
    public boolean tambahTindakLanjut(TindakLanjut t) {
        String sql = "INSERT INTO tindak_lanjut (id_laporan, tanggal_tindak, hasil_tindak, nominal_denda, status_tindakan) VALUES (?, ?, ?, ?, ?)";
        try (PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, t.getIdLaporan());
            ps.setDate(2, new java.sql.Date(t.getTanggalTindak().getTime()));
            ps.setString(3, t.getHasilTindak());
            ps.setDouble(4, t.getNominalDenda());
            ps.setString(5, t.getStatusTindakan());
            ps.executeUpdate();
            System.out.println("✅ Tindak lanjut berhasil ditambahkan!");
            return true;
        } catch (SQLException e) {
            System.out.println("❌ Tambah tindak lanjut error: " + e.getMessage());
        }
        return false;
    }

    // === AMBIL SEMUA DATA TINDAK LANJUT ===
    public List<TindakLanjut> getAllTindakLanjut() {
        List<TindakLanjut> list = new ArrayList<>();
        String sql = "SELECT * FROM tindak_lanjut";
        try (Statement st = conn.createStatement(); ResultSet rs = st.executeQuery(sql)) {
            while (rs.next()) {
                TindakLanjut t = new TindakLanjut();
                t.setIdTindak(rs.getInt("id_tindak"));
                t.setIdLaporan(rs.getInt("id_laporan"));
                t.setTanggalTindak(rs.getDate("tanggal_tindak"));
                t.setHasilTindak(rs.getString("hasil_tindak"));
                t.setNominalDenda(rs.getDouble("nominal_denda"));
                t.setStatusTindakan(rs.getString("status_tindakan"));
                list.add(t);
            }
        } catch (SQLException e) {
            System.out.println("❌ Get tindak lanjut error: " + e.getMessage());
        }
        return list;
    }

    // === AMBIL BERDASARKAN ID LAPORAN ===
    public List<TindakLanjut> getByLaporan(int idLaporan) {
        List<TindakLanjut> list = new ArrayList<>();
        String sql = "SELECT * FROM tindak_lanjut WHERE id_laporan=?";
        try (PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, idLaporan);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                TindakLanjut t = new TindakLanjut();
                t.setIdTindak(rs.getInt("id_tindak"));
                t.setIdLaporan(rs.getInt("id_laporan"));
                t.setTanggalTindak(rs.getDate("tanggal_tindak"));
                t.setHasilTindak(rs.getString("hasil_tindak"));
                t.setNominalDenda(rs.getDouble("nominal_denda"));
                t.setStatusTindakan(rs.getString("status_tindakan"));
                list.add(t);
            }
        } catch (SQLException e) {
            System.out.println("❌ Get tindak lanjut by laporan error: " + e.getMessage());
        }
        return list;
    }

    // === UPDATE TINDAK LANJUT ===
    public boolean updateTindakLanjut(TindakLanjut t) {
        String sql = "UPDATE tindak_lanjut SET tanggal_tindak=?, hasil_tindak=?, nominal_denda=?, status_tindakan=? WHERE id_tindak=?";
        try (PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setDate(1, new java.sql.Date(t.getTanggalTindak().getTime()));
            ps.setString(2, t.getHasilTindak());
            ps.setDouble(3, t.getNominalDenda());
            ps.setString(4, t.getStatusTindakan());
            ps.setInt(5, t.getIdTindak());
            ps.executeUpdate();
            System.out.println("✅ Tindak lanjut berhasil diperbarui!");
            return true;
        } catch (SQLException e) {
            System.out.println("❌ Update tindak lanjut error: " + e.getMessage());
        }
        return false;
    }

    // === HAPUS TINDAK LANJUT ===
    public boolean deleteTindakLanjut(int idTindak) {
        String sql = "DELETE FROM tindak_lanjut WHERE id_tindak=?";
        try (PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, idTindak);
            ps.executeUpdate();
            System.out.println("✅ Tindak lanjut berhasil dihapus!");
            return true;
        } catch (SQLException e) {
            System.out.println("❌ Hapus tindak lanjut error: " + e.getMessage());
        }
        return false;
    }

    // === CARI TINDAK LANJUT BERDASARKAN STATUS ===
    public List<TindakLanjut> cariTindakLanjutByStatus(String status) {
        List<TindakLanjut> list = new ArrayList<>();
        String sql = "SELECT * FROM tindak_lanjut WHERE status_tindakan LIKE ?";
        try (PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, "%" + status + "%");
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                TindakLanjut t = new TindakLanjut();
                t.setIdTindak(rs.getInt("id_tindak"));
                t.setIdLaporan(rs.getInt("id_laporan"));
                t.setTanggalTindak(rs.getDate("tanggal_tindak"));
                t.setHasilTindak(rs.getString("hasil_tindak"));
                t.setNominalDenda(rs.getDouble("nominal_denda"));
                t.setStatusTindakan(rs.getString("status_tindakan"));
                list.add(t);
            }
        } catch (SQLException e) {
            System.out.println("❌ Cari tindak lanjut error: " + e.getMessage());
        }
        return list;
    }

    // === CETAK SEMUA DATA DENGAN FORMAT RAPI ===
    public void tampilkanSemuaTindakLanjut() {
        List<TindakLanjut> list = getAllTindakLanjut();
        System.out.println("\n=== DATA TINDAK LANJUT ===");
        for (TindakLanjut t : list) {
            System.out.println("ID Tindak: " + t.getIdTindak());
            System.out.println("ID Laporan: " + t.getIdLaporan());
            System.out.println("Tanggal Tindak: " + t.getTanggalTindak());
            System.out.println("Hasil Tindak: " + t.getHasilTindak());
            System.out.println("Nominal Denda: " + t.getNominalDenda());
            System.out.println("Status Tindakan: " + t.getStatusTindakan());
            System.out.println("----------------------------------------");
        }
    }
}
