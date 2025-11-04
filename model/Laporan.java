
  package model;

import java.util.Date;

public class Laporan {
    private int idLaporan;
    private int idPelapor;
    private int idLokasi;
    private Date tanggalLapor;
    private String deskripsi;
    private String fotoBukti;
    private String statusLaporan;
    private String jenisLaporan;

    public int getIdLaporan() { return idLaporan; }
    public void setIdLaporan(int idLaporan) { this.idLaporan = idLaporan; }

    public int getIdPelapor() { return idPelapor; }
    public void setIdPelapor(int idPelapor) { this.idPelapor = idPelapor; }

    public int getIdLokasi() { return idLokasi; }
    public void setIdLokasi(int idLokasi) { this.idLokasi = idLokasi; }

    public Date getTanggalLapor() { return tanggalLapor; }
    public void setTanggalLapor(Date tanggalLapor) { this.tanggalLapor = tanggalLapor; }

    public String getDeskripsi() { return deskripsi; }
    public void setDeskripsi(String deskripsi) { this.deskripsi = deskripsi; }

    public String getFotoBukti() { return fotoBukti; }
    public void setFotoBukti(String fotoBukti) { this.fotoBukti = fotoBukti; }

    public String getStatusLaporan() { return statusLaporan; }
    public void setStatusLaporan(String statusLaporan) { this.statusLaporan = statusLaporan; }

    public String getJenisLaporan() { return jenisLaporan; }
    public void setJenisLaporan(String jenisLaporan) { this.jenisLaporan = jenisLaporan; }

    // Metode yang akan dioverride di subclass
    public void cetakLaporan() {
        System.out.println("Mencetak laporan umum: " + this.jenisLaporan);
    }
}