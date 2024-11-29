-- kelompok 11 



-- Membuat schema baru
CREATE SCHEMA akademik;

-- Membuat tabel Mahasiswa di dalam schema akademik
CREATE TABLE akademik.Mahasiswa (
    id_mahasiswa SERIAL PRIMARY KEY,
    nama VARCHAR(100) NOT NULL,
    alamat TEXT,
    tanggal_lahir DATE
);

-- Membuat tabel Dosen di dalam schema akademik
CREATE TABLE akademik.Dosen (
    id_dosen SERIAL PRIMARY KEY,
    nama VARCHAR(100) NOT NULL,
    email VARCHAR(100),
    telepon VARCHAR(20)
);

-- Membuat tabel Mata Kuliah di dalam schema akademik
CREATE TABLE akademik.Mata_Kuliah (
    id_mk SERIAL PRIMARY KEY,
    nama VARCHAR(100) NOT NULL,
    sks INT NOT NULL
);

-- Membuat tabel Kelas di dalam schema akademik
CREATE TABLE akademik.Kelas (
    id_kelas SERIAL PRIMARY KEY,
    id_dosen INT NOT NULL,
    id_mk INT NOT NULL,
    semester VARCHAR(50),
    CONSTRAINT fk_dosen FOREIGN KEY (id_dosen) REFERENCES akademik.Dosen(id_dosen),
    CONSTRAINT fk_mk FOREIGN KEY (id_mk) REFERENCES akademik.Mata_Kuliah(id_mk)
);

-- Membuat tabel Nilai di dalam schema akademik
CREATE TABLE akademik.Nilai (
    id_nilai SERIAL PRIMARY KEY,
    id_mahasiswa INT NOT NULL,
    id_kelas INT NOT NULL,
    nilai DECIMAL(5, 2),
    CONSTRAINT fk_mahasiswa FOREIGN KEY (id_mahasiswa) REFERENCES akademik.Mahasiswa(id_mahasiswa),
    CONSTRAINT fk_kelas FOREIGN KEY (id_kelas) REFERENCES akademik.Kelas(id_kelas)
);

-- Menampilkan daftar schema
SELECT schema_name FROM information_schema.schemata;

-- Menampilkan daftar tabel dalam schema akademik
SELECT table_name FROM information_schema.tables WHERE table_schema = 'akademik';

-- Menampilkan Semua Data dari Tabel Mahasiswa:
SELECT * FROM akademik.Mahasiswa;

-- Menampilkan Data Tertentu (Misalnya, Nama dan Alamat Mahasiswa):
SELECT nama, alamat FROM akademik.Mahasiswa;

-- Menampilkan Data Mahasiswa dengan Kondisi:
SELECT * FROM akademik.Mahasiswa WHERE nama = 'Budi';

-- Menambahkan Data Mahasiswa:
INSERT INTO akademik.Mahasiswa (nama, alamat, tanggal_lahir)
VALUES ('Budi', 'Jl. Merdeka No.10', '2000-01-01');

-- Menambahkan Data Dosen:
INSERT INTO akademik.Dosen (nama, email, telepon)
VALUES ('Dr. Siti', 'siti@example.com', '081234567890');

-- Menambahkan Data Mata Kuliah:
INSERT INTO akademik.Mata_Kuliah (nama, sks)
VALUES ('Pemrograman Web', 3);

-- Menambahkan Data Kelas:
INSERT INTO akademik.Kelas (id_dosen, id_mk, semester)
VALUES (1, 1, 'Gasal 2024');

-- Menambahkan Data Nilai:
INSERT INTO akademik.Nilai (id_mahasiswa, id_kelas, nilai)
VALUES (1, 1, 85.5);

-- Mengupdate Nama Mahasiswa:
UPDATE akademik.Mahasiswa
SET nama = 'Dipa Marbun '
WHERE id_mahasiswa = 1;

-- Mengupdate Nilai Mahasiswa:
UPDATE akademik.Nilai
SET nilai = 90.0
WHERE id_nilai = 1;

-- Menghapus Data Mahasiswa:
DELETE FROM akademik.Mahasiswa
WHERE id_mahasiswa = 1;
