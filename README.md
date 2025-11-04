*SIMARIN (Sistem Informasi Monitoring Pencemaran Laut dan Penangkapan Ikan Ilegal*


# *Deskripsi Singkat Program*

SIMARIN adalah aplikasi berbasis Pemrograman Berorientasi Objek (PBO) yang dirancang untuk memfasilitasi proses pelaporan kasus pencemaran laut dan praktik penangkapan ikan ilegal di wilayah perairan Indonesia.

Aplikasi ini dikembangkan sebagai lanjutan dari proyek Sistem Basis Data (SBD) dengan konsep sistem pelaporan yang melibatkan dua aktor utama, yaitu:

  1. Masyarakat (Pelapor)
     Pengguna umum yang melaporkan kejadian pencemaran lingkungan laut atau kegiatan penangkapan      ikan ilegal yang ditemukan di daerah pesisir atau area perairan tertentu.

  2. Petugas/Admin (Penindak)
     Petugas berwenang yang menerima laporan, menindaklanjuti, memperbarui status laporan, serta      melakukan pengelolaan data akun, lokasi laut, dan tindak lanjut pelaporan.

Tujuan utama aplikasi ini adalah untuk:

  - Menyediakan media pelaporan digital

  - Meningkatkan transparansi dan efektivitas pengawasan laut

  - Mempermudah masyarakat dalam berpartisipasi menjaga lingkungan maritim

  - Mendukung proses tindak lanjut dan dokumentasi oleh petugas pemerintah

Aplikasi ini dikembangkan menggunakan prinsip Object-Oriented Programming (OOP) dengan tujuan menghasilkan sistem yang modular, mudah dikembangkan, dan terstruktur.


# *Fitur Program*

👤 Fitur untuk User / Masyarakat

1. Buat Laporan

  - Mengisi data lokasi laut

  - Mengisi data laporan

  - Memilih jenis laporan:

    - Laporan pencemaran laut

    - Laporan penangkapan ikan ilegal

2. Lihat

  - Melihat data akun sendiri

  - Melihat semua laporan yang telah dibuat, ditampilkan beserta informasi tindak lanjut dari       petugas

3. Perbarui

  - Memperbarui laporan yang sudah dibuat

  - Memperbarui data akun pribadi

  - Memperbarui data lokasi laut yang pernah ditambahkan

4. Hapus

  - Menghapus laporan yang telah dibuat

5. Cari

  - Mencari laporan berdasarkan status laporan (misal: pending, diproses, selesai)

  - Mencari tindak lanjut berdasarkan status tindakan petugas

6. Logout

  - Keluar dari aplikasi




*🛡️ Fitur untuk Petugas / Admin*

1. Buat Laporan

  - Menginput lokasi laut

  - Membuat laporan (jika petugas melakukan pelaporan langsung di lapangan)

  - Memilih jenis laporan:

    - Laporan pencemaran laut

    - Laporan penangkapan ikan ilegal

2. Lihat

  - Melihat seluruh tabel yang tersedia dalam sistem (akun, laporan, lokasi laut, tindak lanjut)

3. Perbarui

  - Memperbarui semua laporan dalam basis data

  - Memperbarui semua akun pengguna

  - Memperbarui data tindak lanjut laporan

  - Memperbarui semua data lokasi laut

4. Hapus

  - Menghapus laporan dari database

  - Menghapus akun pengguna

5. Cari

  - Mencari laporan berdasarkan status

  - Mencari tindak lanjut berdasarkan status tindakan

  - Mencari akun pengguna berdasarkan username

6. Logout

  - Keluar dari aplikasi

=============================================================================

# *Penerapan OOP*

1. Encapsulation

User.java

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


2. Inhertance

   User.java

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


Petugas.java

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


masyarakat.java

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



3. Abstracttiob

   User.java

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


4. Polymorphism

  Laporan.java

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


5. Interface
























============================================================================

# *Struktur Folder/Package*

<img width="348" height="897" alt="image" src="https://github.com/user-attachments/assets/b0378691-e4d9-4fe5-a07f-18df93504fd4" />

<img width="274" height="315" alt="image" src="https://github.com/user-attachments/assets/d4eee1ab-d08a-4b39-8f1e-1d34e00ea69a" />


<img width="336" height="626" alt="image" src="https://github.com/user-attachments/assets/0560e187-cbc8-45d2-8371-38654893e0c2" />

<img width="357" height="481" alt="image" src="https://github.com/user-attachments/assets/e7acb085-4fdc-4525-86d2-ab3a956b5270" />




--------------------------

##### *Cara Menggunakan Program* 

Cara Menggunakan Program (Menu Masyarakat)

Saat aplikasi dijalankan, pengguna akan diarahkan ke halaman awal yang berisi:

<img width="1488" height="779" alt="image" src="https://github.com/user-attachments/assets/9ed09859-88fe-4c35-b5b8-a6b1775f5a8e" />


Login → digunakan jika pengguna sudah memiliki akun

<img width="1487" height="792" alt="image" src="https://github.com/user-attachments/assets/db3b4a5e-5aca-43fd-a29d-3a2326b8062c" />


Sign In / Registrasi → digunakan untuk membuat akun baru

<img width="1486" height="779" alt="image" src="https://github.com/user-attachments/assets/b0f1a4c0-fcf5-4839-82a3-29160d2bc480" />


Setelah berhasil login, pengguna masuk ke Menu Masyarakat, yang terdiri dari:

<img width="1492" height="780" alt="image" src="https://github.com/user-attachments/assets/dcc0985b-8262-4098-b269-e4efe405b7b6" />


- Buat Laporan

- Lihat Laporan

- Cari Laporan

- Perbarui Laporan

- Hapus Laporan

1. Buat Laporan

<img width="1490" height="779" alt="image" src="https://github.com/user-attachments/assets/1c9879d3-8f9f-4463-8ff4-0f3a5c9e6afd" />


Ketika memilih buat laporan akan ada inputan nama lokasi, koordinat,wilayah,kondisi terakhir

Selanjutnya diarahkan ke jenis laporan :

ada laporan penangkapan ikan dan pencemearan laut

<img width="1488" height="780" alt="image" src="https://github.com/user-attachments/assets/b22301c8-4a8f-43cb-ac64-f195e264614a" />


jika memilih Pencemaran Laut 

<img width="1503" height="793" alt="image" src="https://github.com/user-attachments/assets/ee0badc4-f89d-4a92-9f21-7463ee20f772" />

ada inputan jenis limbah, sumber limbah dan tingkat pencemaran lalu klik send

Jika memilih Penangkapan Ikan

<img width="1476" height="782" alt="image" src="https://github.com/user-attachments/assets/48075f40-3f24-4b0f-b107-77499bea2149" />

Ada Inputan Jenis kapal, Alat tankap, Zona penangkapan, pelanggaran


2. Lihat Laporan

Ketika pengguna memilih Lihat Laporan, sistem akan menampilkan pilihan jenis laporan:

<img width="1488" height="771" alt="image" src="https://github.com/user-attachments/assets/b9f311fd-6e3b-42ae-a25a-0080ff9cd852" />

Ada pilihan : 

Laporan Pencemaran Laut

Laporan Penangkapan Ikan Ilegal

Jika memilih pencemaran laut

<img width="1499" height="772" alt="image" src="https://github.com/user-attachments/assets/21489444-a076-4f29-b777-bf9fc2ab3a8b" />

Akan muncul tabel dan isi dari pencemaran laut

Jika memilih Penangkapan Ikan

<img width="1496" height="780" alt="image" src="https://github.com/user-attachments/assets/03cf8fa2-8104-4f52-8948-42428399883b" />

Akan muncul tabel dan isi dari penangkapan ikan

3. Cari Laporan

Pengguna dapat mencari laporan berdasarkan jenisnya:

<img width="1491" height="775" alt="image" src="https://github.com/user-attachments/assets/ed46a944-25c7-45e4-8aa7-98790836a4c6" />


Cari laporan pencemaran laut

Cari laporan penangkapan ikan ilegal

- Jika memilih pencemaran laut 

<img width="1494" height="780" alt="image" src="https://github.com/user-attachments/assets/e8750741-89b2-4469-b51d-08b09b68b7c1" />

Masukkan ID laporan untuk mencari laporan tersebut lalu klik Serrch

<img width="523" height="313" alt="image" src="https://github.com/user-attachments/assets/f6c6453a-75de-4b7d-8cdb-a40a3e9e26a5" />

Lalu akan menampilkan laporan yang dicari


- Jika memilih penangkapan ikan

<img width="1494" height="779" alt="image" src="https://github.com/user-attachments/assets/ca05e4bc-6964-4080-839c-09ff4fe01e6e" />


Masukkan ID laporan untuk mencari laporan tersebut lalu klik Serrch

<img width="370" height="334" alt="image" src="https://github.com/user-attachments/assets/8d2b8907-2cf2-40e5-b6e6-563247aa50a8" />


Lalu akan menampilkan laporan yang dicari


4. Perbarui Laporan

Pengguna dapat memperbarui data sesuai jenis laporan:

<img width="1491" height="778" alt="image" src="https://github.com/user-attachments/assets/bb7ebb2e-4fe0-4f1a-bff8-9d2851318305" />

Jika memilih Pencemaran Laut

5. Hapus Laporan

Untuk menghapus laporan:

<img width="1491" height="778" alt="image" src="https://github.com/user-attachments/assets/7589b047-d4cf-4769-b29f-1b258c300bbe" />

Ada pilihan laporan pencemaran laut atau penangkapan ikan

jika pilih hapuas laporan pencemaran laut

<img width="1488" height="774" alt="image" src="https://github.com/user-attachments/assets/32d0d427-d344-4c4b-b2f6-b0196a681c2b" />

Akan menampilkan tabel, jika ingin menghapus maka pilih colom dan baris yang mau dikirim lalu klik hapus

jika pilih hapuas laporan penangkapan ikan

<img width="1491" height="785" alt="image" src="https://github.com/user-attachments/assets/b3e035f5-1e69-4964-b5a2-1902ef10d4dd" />

Akan menampilkan tabel, jika ingin menghapus maka pilih colom dan baris yang mau dikirim lalu klik hapus

Sistem menghapus data laporan tersebut


==========================================================================================


Cara Menggunakan Program (Menu Admin)

Saat aplikasi dijalankan, pengguna akan diarahkan ke halaman awal yang berisi:


Login dengan akun admin :

<img width="1495" height="800" alt="image" src="https://github.com/user-attachments/assets/c7650a72-a08c-4922-ac3b-23d2e449c702" />


Setelah berhasil login, pengguna masuk ke Menu Masyarakat, yang terdiri dari:

<img width="1476" height="775" alt="image" src="https://github.com/user-attachments/assets/dbe442c5-f3c3-4c17-9404-f058f5976f7a" />

- Buat Laporan

- Lihat Laporan

- Cari Laporan

- Perbarui Laporan

- Hapus Laporan

- Tindak Lanjut

  
1. Buat Laporan

<img width="1484" height="781" alt="image" src="https://github.com/user-attachments/assets/ce2779c1-45c8-4f44-b35c-6ba6dec6ab70" />

Mengisi Lokasi laut dengan inputan nama lokasi, koordinat, wilayah, kondisi terakhir lalu klik next

lokasi telah disimpan dan id terbuat otomatis

Selanjutnya diarahkan ke jenis laporan :

Laporan pencemaran laut dan juga laporan penangkapan ikan

jika memilih laporan pencemaran laut

<img width="1482" height="772" alt="image" src="https://github.com/user-attachments/assets/a0c52180-17eb-4b84-a091-88dceead577c" />

Mengisi Jenis limbah, Sumber limbah, upload foto bukti, tingkat pencemaran lalu klik send

Jika memilih laporan penangkapan ikan

<img width="1482" height="772" alt="image" src="https://github.com/user-attachments/assets/ad2be7c4-76e2-4ec6-9cf2-0ecff5e6bb9f" />

Mengisi Jenis kapal, alat penangkapan, oelanggaran, wilayah lalu klik send

2. Lihat Laporan

Jika kita memilih lihat laporan maka aka akan menampilkan lihat laporan, akun, lokasi laut, tindak lanjut

<img width="1489" height="779" alt="image" src="https://github.com/user-attachments/assets/49a7b626-f3bc-4a87-9920-b33a0ac245ec" />

Jika kita memilih laporan

<img width="1498" height="786" alt="image" src="https://github.com/user-attachments/assets/7f297bff-33bd-40a4-9f9f-01a19847b668" />

Akan muncul tabel dan data dari seluruh laporan yang ada

dan jika kita bisa melihat foto bukti yang telah dikirim

<img width="1627" height="1013" alt="image" src="https://github.com/user-attachments/assets/b007dd9d-03ba-403b-b523-0ee3b6d652cb" />


Jika kita memilih Akun

<img width="1485" height="770" alt="image" src="https://github.com/user-attachments/assets/d34d1578-b2b5-4159-a87c-b0847dba58dd" />

Maka akan menampilkan akun yang ada

Jika kita memilih lokasi laut

<img width="1484" height="769" alt="image" src="https://github.com/user-attachments/assets/ff6b1382-81f0-499d-98fd-64d4178e99c3" />

Akan menampilkan tabel dari lokasi laut 

Jika kita memilih Tindak lanjut

<img width="1478" height="780" alt="image" src="https://github.com/user-attachments/assets/9fa23f9c-e673-41ca-ab05-8b79b0a23e86" />

Akan menampilkan tabel dari tindak lanjut

3. Tindak Lanjut

<img width="1476" height="773" alt="image" src="https://github.com/user-attachments/assets/4f4ec20a-f5bf-4b02-904a-d95a88d1d026" />

Menampilkan tabel dari denda dan juga mengisi hasil denda, nominal denda dan juga status tindakan 

4. Perbarui

Di menu perbarui ada 2 jenis yang diperbarui ada akun dan laporan

<img width="1475" height="778" alt="image" src="https://github.com/user-attachments/assets/52b1be6f-278b-4e90-94a1-4b9ba747d987" />

Ditampilan perbarui laporan

<img width="1494" height="781" alt="image" src="https://github.com/user-attachments/assets/e922211b-cea8-42f9-8a02-a3114b99dc98" />

Perbarui status laporan apakah laporan tersebut menunggu, sedang ditindak atau selesai

Ditampilan Perbarui Akun

<img width="1491" height="774" alt="image" src="https://github.com/user-attachments/assets/513ff399-a8c7-43a7-91c7-d01e46390481" />

Perbarui peran akun akun tersebut admin atau user

5. Hapus

Di menu hapus ada 2 jenis akun dan laporan

Menu Laporan

<img width="1500" height="778" alt="image" src="https://github.com/user-attachments/assets/36bf3b13-cdeb-492f-9da8-710f465a9734" />

Pilih baris yang mau di hapus lalu klik tombol hapus

Menu Akun

<img width="1492" height="783" alt="image" src="https://github.com/user-attachments/assets/c2dada6f-7c5f-4abb-8cc4-77ee3f4f6a08" />

Pilih baris akun yang mau dihapus lalu klik tombol hapus

