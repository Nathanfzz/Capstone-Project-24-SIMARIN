package model;

import java.util.Date;

public class TindakLanjut {
    private int idTindak;
    private int idLaporan;
    private Date tanggalTindak;
    private String hasilTindak;
    private double nominalDenda;
    private String statusTindakan; // ENUM('Selesai','Diproses','Dibatalkan')

    public int getIdTindak() { return idTindak; }
    public void setIdTindak(int idTindak) { this.idTindak = idTindak; }

    public int getIdLaporan() { return idLaporan; }
    public void setIdLaporan(int idLaporan) { this.idLaporan = idLaporan; }

    public Date getTanggalTindak() { return tanggalTindak; }
    public void setTanggalTindak(Date tanggalTindak) { this.tanggalTindak = tanggalTindak; }

    public String getHasilTindak() { return hasilTindak; }
    public void setHasilTindak(String hasilTindak) { this.hasilTindak = hasilTindak; }

    public double getNominalDenda() { return nominalDenda; }
    public void setNominalDenda(double nominalDenda) { this.nominalDenda = nominalDenda; }

    public String getStatusTindakan() { return statusTindakan; }
    public void setStatusTindakan(String statusTindakan) { this.statusTindakan = statusTindakan; }
}
