package main;

import model.LaporanPenangkapanIkan;
import java.sql.Date;
import java.util.Scanner;

public class Main {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);

        // Input data untuk laporan
        System.out.print("Masukkan ID Laporan: ");
        int idLaporan = sc.nextInt();
        sc.nextLine(); // Kosongkan buffer

        System.out.print("Jenis Kapal: ");
        String jenisKapal = sc.nextLine();

        System.out.print("Alat Tangkap: ");
        String alatTangkap = sc.nextLine();

        System.out.print("Zona Penangkapan: ");
        String zonaPenangkapan = sc.nextLine();

        System.out.print("Pelanggaran: ");
        String pelanggaran = sc.nextLine();

        // Membuat objek LaporanPenangkapanIkan
        LaporanPenangkapanIkan li = new LaporanPenangkapanIkan(
            idLaporan, 123, 456, new Date(System.currentTimeMillis()), "Deskripsi laporan", "fotoBukti.jpg", "Tertunda", "Penangkapan Ikan",
            jenisKapal, alatTangkap, zonaPenangkapan, pelanggaran
        );

        // Simpan laporan
        System.out.println("Laporan Penangkapan Ikan telah disimpan.");
        li.cetakLaporan();  // Memproses laporan

        sc.close();
    }
}
