package model;

public abstract class Petugas extends User {
    private int idPetugas;
    private String jabatan;

    public Petugas() {}

    public int getIdPetugas() { return idPetugas; }
    public void setIdPetugas(int idPetugas) { this.idPetugas = idPetugas; }

    public String getJabatan() { return jabatan; }
    public void setJabatan(String jabatan) { this.jabatan = jabatan; }
}