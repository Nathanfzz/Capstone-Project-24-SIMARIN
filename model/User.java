 package model;

public abstract class User {
    private int idUser;
    private String namaUser;
    private String password;
    private String peran;
    private String noHp;

    // Konstruktor
    public User() {}

    public User(int idUser, String namaUser, String password, String peran, String noHp) {
        this.idUser = idUser;
        this.namaUser = namaUser;
        this.password = password;
        this.peran = peran;
        this.noHp = noHp;
    }

    // Getter and Setter
    public int getIdUser() { return idUser; }
    public void setIdUser(int idUser) { this.idUser = idUser; }

    public String getNamaUser() { return namaUser; }
    public void setNamaUser(String namaUser) { this.namaUser = namaUser; }

    public String getPassword() { return password; }
    public void setPassword(String password) { this.password = password; }

    public String getPeran() { return peran; }
    public void setPeran(String peran) { this.peran = peran; }

    public String getNoHp() { return noHp; }
    public void setNoHp(String noHp) { this.noHp = noHp; }

    // Metode abstrak yang harus diimplementasikan oleh kelas turunan
    public abstract int getId_user();
}