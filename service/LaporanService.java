package service;

import java.sql.*;
import java.util.*;
import model.*;

public class LaporanService {
    private Connection conn;

    public LaporanService() {
        conn = DatabaseConnection.getConnection();
    }

    // === TAMBAH LAPORAN UTAMA ===
    public int tambahLaporan(Laporan laporan) {
        String sql = "INSERT INTO laporan (id_pelapor, id_lokasi, tanggal_lapor, deskripsi, foto_bukti, status_laporan, jenis_laporan) VALUES (?, ?, ?, ?, ?, ?, ?)";
        try (PreparedStatement ps = conn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS)) {
            ps.setInt(1, laporan.getIdPelapor());
            ps.setInt(2, laporan.getIdLokasi());
            ps.setDate(3, new java.sql.Date(laporan.getTanggalLapor().getTime()));
            ps.setString(4, laporan.getDeskripsi());
            ps.setString(5, laporan.getFotoBukti());
            ps.setString(6, laporan.getStatusLaporan());
            ps.setString(7, laporan.getJenisLaporan());
            ps.executeUpdate();

            ResultSet rs = ps.getGeneratedKeys();
            if (rs.next()) {
                int idLaporan = rs.getInt(1);
                System.out.println("✓ Laporan berhasil dibuat dengan ID: " + idLaporan);
                return idLaporan;
            }
        } catch (SQLException e) {
            System.out.println("❌ Tambah laporan error: " + e.getMessage());
        }
        return -1;
    }

    // === TAMBAH DETAIL LAPORAN PENCEMARAN ===
    public boolean tambahLaporanPencemaran(LaporanPencemaran l) {
        String sql = "INSERT INTO laporan_pencemaran (id_laporan, sumber_limbah, jenis_limbah, tingkat_pencemaran) VALUES (?, ?, ?, ?)";
        try (PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, l.getIdLaporan());
            ps.setString(2, l.getSumberLimbah());
            ps.setString(3, l.getJenisLimbah());
            ps.setString(4, l.getTingkatPencemaran());
            ps.executeUpdate();
            System.out.println("✓ Detail laporan pencemaran berhasil ditambahkan!");
            return true;
        } catch (SQLException e) {
            System.out.println("❌ Tambah laporan pencemaran error: " + e.getMessage());
            return false;
        }
    }

    // === TAMBAH DETAIL LAPORAN PENANGKAPAN IKAN ===
    public boolean tambahLaporanPenangkapan(LaporanPenangkapanIkan l) {
        String sql = "INSERT INTO laporan_penangkapan_ikan (id_laporan, jenis_kapal, alat_tangkap, zona_penangkapan, pelanggaran) VALUES (?, ?, ?, ?, ?)";
        try (PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, l.getIdLaporan());
            ps.setString(2, l.getJenisKapal());
            ps.setString(3, l.getAlatTangkap());
            ps.setString(4, l.getZonaPenangkapan());
            ps.setString(5, l.getPelanggaran());
            ps.executeUpdate();
            System.out.println("✓ Detail laporan penangkapan ikan berhasil ditambahkan!");
            return true;
        } catch (SQLException e) {
            System.out.println("❌ Tambah laporan penangkapan error: " + e.getMessage());
            return false;
        }
    }

    // === LIHAT SEMUA LAPORAN (Gabung Lokasi + Pelapor) ===
    public void lihatSemuaLaporan() {
        String sql = """
                SELECT l.id_laporan, u.nama_user, l.jenis_laporan, l.deskripsi, l.status_laporan, 
                       l.tanggal_lapor, loc.nama_lokasi, loc.wilayah, loc.kondisi_terakhir
                FROM laporan l
                JOIN user u ON l.id_pelapor = u.id_user
                JOIN lokasi_laut loc ON l.id_lokasi = loc.id_lokasi
                ORDER BY l.id_laporan DESC
                """;
        try (Statement st = conn.createStatement(); ResultSet rs = st.executeQuery(sql)) {
            System.out.println("\n=== DAFTAR SEMUA LAPORAN ===");
            while (rs.next()) {
                System.out.println("ID Laporan: " + rs.getInt("id_laporan"));
                System.out.println("Pelapor: " + rs.getString("nama_user"));
                System.out.println("Jenis Laporan: " + rs.getString("jenis_laporan"));
                System.out.println("Deskripsi: " + rs.getString("deskripsi"));
                System.out.println("Status: " + rs.getString("status_laporan"));
                System.out.println("Tanggal: " + rs.getDate("tanggal_lapor"));
                System.out.println("Lokasi: " + rs.getString("nama_lokasi") + " (" + rs.getString("wilayah") + ")");
                System.out.println("Kondisi Terakhir: " + rs.getString("kondisi_terakhir"));
                System.out.println("--------------------------------------");
            }
        } catch (SQLException e) {
            System.out.println("❌ Lihat semua laporan error: " + e.getMessage());
        }
    }

    // === LIHAT LAPORAN BY USER ===
    public void lihatLaporanByUser(int idUser) {
        String sql = """
                SELECT l.id_laporan, l.jenis_laporan, l.deskripsi, l.status_laporan, l.tanggal_lapor,
                       loc.nama_lokasi, loc.kondisi_terakhir
                FROM laporan l
                JOIN lokasi_laut loc ON l.id_lokasi = loc.id_lokasi
                WHERE l.id_pelapor = ?
                """;
        try (PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, idUser);
            ResultSet rs = ps.executeQuery();
            System.out.println("\n=== LAPORAN ANDA ===");
            while (rs.next()) {
                System.out.println("ID Laporan: " + rs.getInt("id_laporan"));
                System.out.println("Jenis: " + rs.getString("jenis_laporan"));
                System.out.println("Deskripsi: " + rs.getString("deskripsi"));
                System.out.println("Status: " + rs.getString("status_laporan"));
                System.out.println("Tanggal: " + rs.getDate("tanggal_lapor"));
                System.out.println("Lokasi: " + rs.getString("nama_lokasi"));
                System.out.println("Kondisi Terakhir: " + rs.getString("kondisi_terakhir"));
                System.out.println("--------------------------------------");
            }
        } catch (SQLException e) {
            System.out.println("❌ Lihat laporan by user error: " + e.getMessage());
        }
    }

    // === PERBARUI LAPORAN OLEH ADMIN/PETUGAS ===
    public void perbaruiLaporan(int idLaporan) {
        Scanner sc = new Scanner(System.in);
        System.out.print("Deskripsi Baru: ");
        String deskripsi = sc.nextLine();
        System.out.print("Status Laporan (Menunggu/Ditindak/Selesai): ");
        String status = sc.nextLine();
        System.out.print("Foto Bukti Baru (boleh kosong): ");
        String foto = sc.nextLine();

        // Pilihan jenis laporan
        System.out.println("Pilih Jenis Laporan:");
        System.out.println("1. Pencemaran Laut");
        System.out.println("2. Penangkapan Ikan");
        System.out.print("Pilih: ");
        int pilihJenis = sc.nextInt();
        sc.nextLine();

        String jenis = "";
        switch (pilihJenis) {
            case 1:
                jenis = "Pencemaran Laut";
                break;
            case 2:
                jenis = "Penangkapan Ikan";
                break;
            default:
                System.out.println("❌ Jenis laporan tidak valid!");
                return;
        }

        String sql = "UPDATE laporan SET deskripsi=?, foto_bukti=?, status_laporan=?, jenis_laporan=? WHERE id_laporan=?";
        try (PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, deskripsi);
            ps.setString(2, foto);
            ps.setString(3, status);
            ps.setString(4, jenis);
            ps.setInt(5, idLaporan);
            ps.executeUpdate();
            System.out.println("✓ Laporan berhasil diperbarui!");
        } catch (SQLException e) {
            System.out.println("❌ Perbarui laporan error: " + e.getMessage());
        }
    }

    // === PERBARUI LAPORAN OLEH MASYARAKAT ===
    public void perbaruiLaporanOlehMasyarakat(int idLaporan, int idUser) {
        Scanner sc = new Scanner(System.in);
        System.out.print("Deskripsi Baru: ");
        String deskripsi = sc.nextLine();
        System.out.print("Foto Bukti Baru (boleh kosong): ");
        String foto = sc.nextLine();

        // Pilih jenis laporan baru
        System.out.println("Pilih Jenis Laporan:");
        System.out.println("1. Pencemaran Laut");
        System.out.println("2. Penangkapan Ikan");
        System.out.print("Pilih: ");
        int pilihJenis = sc.nextInt();
        sc.nextLine();

        String jenis = "";
        switch (pilihJenis) {
            case 1:
                jenis = "Pencemaran Laut";
                break;
            case 2:
                jenis = "Penangkapan Ikan";
                break;
            default:
                System.out.println("❌ Jenis laporan tidak valid!");
                return;
        }

        // Status tidak bisa diubah masyarakat
        String sql = "UPDATE laporan SET deskripsi=?, foto_bukti=?, jenis_laporan=? WHERE id_laporan=? AND id_pelapor=?";
        try (PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, deskripsi);
            ps.setString(2, foto);
            ps.setString(3, jenis);
            ps.setInt(4, idLaporan);
            ps.setInt(5, idUser);
            int row = ps.executeUpdate();
            if (row > 0) System.out.println("✓ Laporan berhasil diperbarui!");
            else System.out.println("❌ Gagal memperbarui laporan (ID tidak cocok).");
        } catch (SQLException e) {
            System.out.println("❌ Perbarui laporan masyarakat error: " + e.getMessage());
        }
    }

    // === HAPUS LAPORAN ===
    public void hapusLaporan(int idLaporan) {
        String sql = "DELETE FROM laporan WHERE id_laporan=?";
        try (PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, idLaporan);
            ps.executeUpdate();
            System.out.println("✓ Laporan berhasil dihapus!");
        } catch (SQLException e) {
            System.out.println("❌ Hapus laporan error: " + e.getMessage());
        }
    }

    // === CARI LAPORAN BERDASARKAN STATUS ===
    public void cariLaporanByStatus(String status) {
        String sql = "SELECT * FROM laporan WHERE status_laporan LIKE ?";
        try (PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, "%" + status + "%");
            ResultSet rs = ps.executeQuery();
            System.out.println("\n=== HASIL PENCARIAN LAPORAN ===");
            while (rs.next()) {
                System.out.println("ID: " + rs.getInt("id_laporan"));
                System.out.println("Jenis: " + rs.getString("jenis_laporan"));
                System.out.println("Deskripsi: " + rs.getString("deskripsi"));
                System.out.println("Status: " + rs.getString("status_laporan"));
                System.out.println("--------------------------------------");
            }
        } catch (SQLException e) {
            System.out.println("❌ Cari laporan error: " + e.getMessage());
        }
    }
}
