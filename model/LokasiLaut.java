package model;

import java.math.BigDecimal;

public class LokasiLaut {
    private int idLokasi;
    private String namaLokasi;
    private BigDecimal koordinat; // ✅ pakai BigDecimal agar sesuai dengan DECIMAL(10,6)
    private String wilayah;
    private String kondisiTerakhir;

    public int getIdLokasi() {
        return idLokasi;
    }

    public void setIdLokasi(int idLokasi) {
        this.idLokasi = idLokasi;
    }

    public String getNamaLokasi() {
        return namaLokasi;
    }

    public void setNamaLokasi(String namaLokasi) {
        this.namaLokasi = namaLokasi;
    }

    public BigDecimal getKoordinat() {
        return koordinat;
    }

    public void setKoordinat(BigDecimal koordinat) {
        this.koordinat = koordinat;
    }

    public String getWilayah() {
        return wilayah;
    }

    public void setWilayah(String wilayah) {
        this.wilayah = wilayah;
    }

    public String getKondisiTerakhir() {
        return kondisiTerakhir;
    }

    public void setKondisiTerakhir(String kondisiTerakhir) {
        this.kondisiTerakhir = kondisiTerakhir;
    }
}
