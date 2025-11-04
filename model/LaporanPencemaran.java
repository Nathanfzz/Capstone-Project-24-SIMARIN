package model;

public class LaporanPencemaran extends Laporan {
    private String sumberLimbah;
    private String jenisLimbah;
    private String tingkatPencemaran; // ENUM('Berat','Sedang','Ringan')

    public LaporanPencemaran(int idLaporan, int i, int i0, Object object, String sumberLimbah, String fotoBukti, String statusLaporan, String pencemaran_Laut) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    public String getSumberLimbah() { return sumberLimbah; }
    public void setSumberLimbah(String sumberLimbah) { this.sumberLimbah = sumberLimbah; }

    public String getJenisLimbah() { return jenisLimbah; }
    public void setJenisLimbah(String jenisLimbah) { this.jenisLimbah = jenisLimbah; }

    public String getTingkatPencemaran() { return tingkatPencemaran; }
    public void setTingkatPencemaran(String tingkatPencemaran) { this.tingkatPencemaran = tingkatPencemaran; }

    public void simpanLaporan() {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }
}