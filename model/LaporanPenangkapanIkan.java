package model;

import java.sql.Date;

public class LaporanPenangkapanIkan extends Laporan implements LaporanInterface {

    private String jenisKapal;
    private String alatTangkap;
    private String zonaPenangkapan;
    private String pelanggaran;

    // Konstruktor untuk LaporanPenangkapanIkan
    public LaporanPenangkapanIkan(int idLaporan, int idPelapor, int idLokasi, Date tanggalLapor, String deskripsi, String fotoBukti, String statusLaporan, String jenisLaporan, String jenisKapal, String alatTangkap, String zonaPenangkapan, String pelanggaran) {
        super(idLaporan, idPelapor, idLokasi, tanggalLapor, deskripsi, fotoBukti, statusLaporan, jenisLaporan);
        this.jenisKapal = jenisKapal;
        this.alatTangkap = alatTangkap;
        this.zonaPenangkapan = zonaPenangkapan;
        this.pelanggaran = pelanggaran;
    }

    // Implementasi metode dari LaporanInterface
    @Override
    public void cetakLaporan() {
        System.out.println("Mencetak laporan penangkapan ikan dengan ID: " + this.getIdLaporan());
    }

    @Override
    public void simpanLaporan() {
        System.out.println("Laporan Penangkapan Ikan dengan ID " + this.getIdLaporan() + " berhasil disimpan.");
    }

    // Getter dan Setter untuk atribut LaporanPenangkapanIkan
    public String getJenisKapal() { return jenisKapal; }
    public void setJenisKapal(String jenisKapal) { this.jenisKapal = jenisKapal; }

    public String getAlatTangkap() { return alatTangkap; }
    public void setAlatTangkap(String alatTangkap) { this.alatTangkap = alatTangkap; }

    public String getZonaPenangkapan() { return zonaPenangkapan; }
    public void setZonaPenangkapan(String zonaPenangkapan) { this.zonaPenangkapan = zonaPenangkapan; }

    public String getPelanggaran() { return pelanggaran; }
    public void setPelanggaran(String pelanggaran) { this.pelanggaran = pelanggaran; }
}
