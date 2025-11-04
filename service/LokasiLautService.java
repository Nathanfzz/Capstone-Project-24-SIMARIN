package service;

import java.sql.*;
import java.util.*;
import java.math.BigDecimal;
import model.*;

public class LokasiLautService {
    private Connection conn;

    public LokasiLautService() {
        conn = DatabaseConnection.getConnection();
    }

    // === TAMBAH DATA LOKASI LAUT ===
    public int tambahLokasiLaut(LokasiLaut lokasi) {
        String sql = "INSERT INTO lokasi_laut (nama_lokasi, koordinat, wilayah, kondisi_terakhir) VALUES (?, ?, ?, ?)";
        try (PreparedStatement ps = conn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS)) {
            ps.setString(1, lokasi.getNamaLokasi());
            ps.setBigDecimal(2, lokasi.getKoordinat()); // ✅ gunakan BigDecimal untuk kolom DECIMAL
            ps.setString(3, lokasi.getWilayah());
            ps.setString(4, lokasi.getKondisiTerakhir());
            ps.executeUpdate();

            ResultSet rs = ps.getGeneratedKeys();
            if (rs.next()) {
                int idLokasi = rs.getInt(1);
                System.out.println("✓ Lokasi Laut berhasil ditambahkan dengan ID: " + idLokasi);
                return idLokasi;
            }
        } catch (SQLException e) {
            System.out.println("❌ Tambah lokasi laut error: " + e.getMessage());
        }
        return -1;
    }

    // === LIHAT SEMUA DATA LOKASI LAUT ===
    public void lihatSemuaLokasi() {
        String sql = "SELECT * FROM lokasi_laut ORDER BY id_lokasi DESC";
        try (Statement st = conn.createStatement(); ResultSet rs = st.executeQuery(sql)) {
            System.out.println("\n=== DATA LOKASI LAUT ===");
            while (rs.next()) {
                System.out.println("ID Lokasi: " + rs.getInt("id_lokasi"));
                System.out.println("Nama Lokasi: " + rs.getString("nama_lokasi"));
                System.out.println("Koordinat: " + rs.getBigDecimal("koordinat"));
                System.out.println("Wilayah: " + rs.getString("wilayah"));
                System.out.println("Kondisi Terakhir: " + rs.getString("kondisi_terakhir"));
                System.out.println("-------------------------------------");
            }
        } catch (SQLException e) {
            System.out.println("❌ Lihat semua lokasi error: " + e.getMessage());
        }
    }

    // === CARI LOKASI BERDASARKAN WILAYAH ===
    public void cariLokasiByWilayah(String wilayah) {
        String sql = "SELECT * FROM lokasi_laut WHERE wilayah LIKE ?";
        try (PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, "%" + wilayah + "%");
            ResultSet rs = ps.executeQuery();

            System.out.println("\n=== HASIL PENCARIAN LOKASI ===");
            while (rs.next()) {
                System.out.println("ID Lokasi: " + rs.getInt("id_lokasi"));
                System.out.println("Nama Lokasi: " + rs.getString("nama_lokasi"));
                System.out.println("Koordinat: " + rs.getBigDecimal("koordinat"));
                System.out.println("Wilayah: " + rs.getString("wilayah"));
                System.out.println("Kondisi Terakhir: " + rs.getString("kondisi_terakhir"));
                System.out.println("-------------------------------------");
            }
        } catch (SQLException e) {
            System.out.println("❌ Cari lokasi error: " + e.getMessage());
        }
    }

    // === PERBARUI DATA LOKASI ===
    public void perbaruiLokasi(int idLokasi) {
        Scanner sc = new Scanner(System.in);
        System.out.println("\n=== PERBARUI DATA LOKASI LAUT ===");
        System.out.print("Nama Lokasi Baru: ");
        String nama = sc.nextLine();
        System.out.print("Koordinat Baru (contoh: 117.123456): ");
        BigDecimal koordinat;
        try {
            koordinat = new BigDecimal(sc.nextLine());
        } catch (NumberFormatException e) {
            System.out.println("❌ Format koordinat salah!");
            return;
        }
        System.out.print("Wilayah Baru: ");
        String wilayah = sc.nextLine();
        System.out.print("Kondisi Terakhir Baru: ");
        String kondisi = sc.nextLine();

        String sql = "UPDATE lokasi_laut SET nama_lokasi=?, koordinat=?, wilayah=?, kondisi_terakhir=? WHERE id_lokasi=?";
        try (PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, nama);
            ps.setBigDecimal(2, koordinat);
            ps.setString(3, wilayah);
            ps.setString(4, kondisi);
            ps.setInt(5, idLokasi);
            ps.executeUpdate();
            System.out.println("✓ Data lokasi berhasil diperbarui!");
        } catch (SQLException e) {
            System.out.println("❌ Perbarui lokasi error: " + e.getMessage());
        }
    }

    // === HAPUS DATA LOKASI ===
    public void hapusLokasi(int idLokasi) {
        String sql = "DELETE FROM lokasi_laut WHERE id_lokasi=?";
        try (PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, idLokasi);
            ps.executeUpdate();
            System.out.println("✓ Lokasi berhasil dihapus!");
        } catch (SQLException e) {
            System.out.println("❌ Hapus lokasi error: " + e.getMessage());
        }
    }
}
