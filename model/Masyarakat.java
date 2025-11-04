package model;

public abstract class Masyarakat extends User {
    private String nik;
    private String email;

    public Masyarakat() {}

    public Masyarakat(String nik, String email) {
        this.nik = nik;
        this.email = email;
    }

    public String getNik() { return nik; }
    public void setNik(String nik) { this.nik = nik; }

    public String getEmail() { return email; }
    public void setEmail(String email) { this.email = email; }
}