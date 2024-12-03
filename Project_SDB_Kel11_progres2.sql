-- Membuat schema baru
CREATE SCHEMA akademik;

-- Membuat tabel Mahasiswa
CREATE TABLE akademik.Mahasiswa (
    id_mahasiswa SERIAL PRIMARY KEY,
    nama VARCHAR(100) NOT NULL,
    alamat TEXT,
    tanggal_lahir DATE
);

-- Membuat tabel Dosen
CREATE TABLE akademik.Dosen (
    id_dosen SERIAL PRIMARY KEY,
    nama VARCHAR(100) NOT NULL,
    email VARCHAR(100),
    telepon VARCHAR(20)
);

-- Membuat tabel Mata Kuliah
CREATE TABLE akademik.Mata_Kuliah (
    id_mk SERIAL PRIMARY KEY,
    nama VARCHAR(100) NOT NULL,
    sks INT NOT NULL
);

-- Membuat tabel Nilai dengan hubungan langsung ke tabel Dosen dan Mata Kuliah
CREATE TABLE akademik.Nilai (
    id_nilai SERIAL PRIMARY KEY,
    id_mahasiswa INT NOT NULL,
    id_mk INT NOT NULL,
    id_dosen INT NOT NULL,
    nilai DECIMAL(5, 2),
    semester VARCHAR(50),
    CONSTRAINT fk_mahasiswa FOREIGN KEY (id_mahasiswa) REFERENCES akademik.Mahasiswa(id_mahasiswa) ON DELETE CASCADE,
    CONSTRAINT fk_mk FOREIGN KEY (id_mk) REFERENCES akademik.Mata_Kuliah(id_mk),
    CONSTRAINT fk_dosen FOREIGN KEY (id_dosen) REFERENCES akademik.Dosen(id_dosen)
);

-- Menambahkan banyak data dummy ke tabel Mahasiswa
INSERT INTO akademik.Mahasiswa (nama, alamat, tanggal_lahir)
VALUES 
('Budi', 'Jl. Merdeka No.10', '2000-01-01'),
('Dewi', 'Jl. Kebangsaan No.12', '2001-05-15'),
('Andi', 'Jl. Harmoni No.8', '1999-07-21'),
('Citra', 'Jl. Melati No.5', '2002-03-30'),
('Fajar', 'Jl. Mawar No.20', '1998-12-10'),
('Rina', 'Jl. Anggrek No.15', '2001-11-05'),
('Rizki', 'Jl. Sakura No.7', '1997-09-25'),
('Siti', 'Jl. Flamboyan No.3', '1996-04-12'),
('Tono', 'Jl. Cendana No.18', '2000-06-30'),
('Maria', 'Jl. Kamboja No.9', '1999-08-14'),
('Tono', 'Jl. Ahmad Yani No.13', '2000-11-22'),
('Sri', 'Jl. Jenderal Sudirman No.6', '2001-08-17'),
('Eka', 'Jl. Kusuma Bangsa No.4', '2002-02-11'),
('Wawan', 'Jl. Slamet Riyadi No.12', '1998-03-15'),
('Ratna', 'Jl. Supriyadi No.20', '2000-09-03'),
('Joko', 'Jl. Merdeka Barat No.16', '1999-01-27'),
('Putri', 'Jl. Diponegoro No.11', '2001-05-05'),
('Arief', 'Jl. Proklamasi No.7', '1998-06-15'),
('Nina', 'Jl. Pemuda No.18', '1999-04-20'),
('Widi', 'Jl. Trunojoyo No.9', '2002-08-11'),
('Lukman', 'Jl. Kembang Sepatu No.14', '2000-03-25'),
('Vera', 'Jl. Melati No.2', '1997-07-29'),
('Tina', 'Jl. Cendana No.8', '2001-12-01'),
('Dian', 'Jl. Mangga Dua No.5', '1998-05-30'),
('Yuni', 'Jl. Panglima Sudirman No.19', '1999-11-10'),
('Doni', 'Jl. Teuku Umar No.21', '2000-06-06'),
('Ani', 'Jl. Siliwangi No.4', '1997-04-08'),
('Sari', 'Jl. Raden Saleh No.17', '2001-01-13'),
('Bayu', 'Jl. Basuki Rahmat No.6', '1998-10-19'),
('Rini', 'Jl. Yos Sudarso No.22', '1999-07-17'),
('Bagus', 'Jl. Anggrek No.12', '2002-09-14'),
('Dedi', 'Jl. Mawar No.3', '2000-05-21');


-- Menambahkan banyak data dummy ke tabel Dosen
INSERT INTO akademik.Dosen (nama, email, telepon)
VALUES 
('Dr. Siti', 'siti@example.com', '081234567890'),
('Dr. Budi', 'budi@example.com', '082345678901'),
('Prof. Andini', 'andini@example.com', '083456789012'),
('Dr. Rizal', 'rizal@example.com', '081345678901'),
('Dr. Anita', 'anita@example.com', '081456789012'),
('Dr. Ani', 'ani@example.com', '081234567004'),
('Dr. Teguh', 'teguh@example.com', '081234567005'),
('Prof. Siti', 'siti@example.com', '081234567006'),
('Dr. Rahmat', 'rahmat@example.com', '081234567007'),
('Dr. Lestari', 'lestari@example.com', '081234567008'),
('Dr. Putra', 'putra@example.com', '081234567009'),
('Dr. Widya', 'widya@example.com', '081234567010'),
('Dr. Wati', 'wati@example.com', '081234567011'),
('Dr. Faisal', 'faisal@example.com', '081234567012'),
('Prof. Iman', 'iman@example.com', '081234567013'),
('Dr. Amalia', 'amalia@example.com', '081234567014'),
('Dr. Dewi', 'dewi@example.com', '081234567015'),
('Prof. Arif', 'arif@example.com', '081234567016'),
('Dr. Lia', 'lia@example.com', '081234567017'),
('Dr. Prasetyo', 'prasetyo@example.com', '081234567018'),
('Prof. Agung', 'agung@example.com', '081234567019'),
('Dr. Surya', 'surya@example.com', '081234567020');


-- Menambahkan banyak data dummy ke tabel Mata Kuliah
INSERT INTO akademik.Mata_Kuliah (nama, sks)
VALUES 
('Pemrograman Web', 3),
('Sistem Basis Data', 4),
('Jaringan Komputer', 3),
('Algoritma dan Pemrograman', 4),
('Matematika Diskrit', 3),
('Sistem Operasi', 3),
('Pemrograman Mobile', 3),
('Keamanan Informasi', 2),
('Pemrograman Python', 2),
('Statistika Komputasi', 3),
('Pembelajaran Mesin', 4),
('Data Mining', 3),
('Internet of Things', 3),
('Pemrograman C++', 3),
('Pemrograman Java', 4);



-- Menambahkan banyak data dummy ke tabel Nilai
INSERT INTO akademik.Nilai (id_mahasiswa, id_mk, id_dosen, nilai, semester)
VALUES 
(1, 1, 1, 85.5, 'Gasal 2024'),
(2, 1, 1, 78.0, 'Gasal 2024'),
(3, 2, 2, 88.0, 'Genap 2024'),
(4, 3, 3, 92.5, 'Gasal 2024'),
(5, 3, 3, 70.0, 'Gasal 2024'),
(6, 4, 4, 65.5, 'Genap 2024'),
(7, 5, 5, 80.0, 'Gasal 2024'),
(8, 6, 1, 75.5, 'Genap 2024'),
(9, 7, 2, 89.0, 'Gasal 2024'),
(10, 8, 3, 95.0, 'Genap 2024');



-- Menampilkan semua data untuk verifikasi
SELECT * FROM akademik.Mahasiswa;
SELECT * FROM akademik.Dosen;
SELECT * FROM akademik.Mata_Kuliah;
SELECT * FROM akademik.Nilai;

-- Menghapus Mahasiswa dan data terkait di tabel Nilai
DELETE FROM akademik.Mahasiswa WHERE id_mahasiswa = 1;

-- Menampilkan kembali data untuk memastikan penghapusan
SELECT * FROM akademik.Mahasiswa;
SELECT * FROM akademik.Nilai;

-- bagian junita (11323042)

-- View untuk Rekapitulasi Rata-rata Nilai per Mata Kuliah
--View ini menghitung rata-rata nilai dari setiap mata kuliah.
CREATE OR REPLACE VIEW akademik.View_Rata_Nilai_Mata_Kuliah AS
SELECT 
    mk.nama AS nama_mata_kuliah,
    mk.sks,
    AVG(n.nilai) AS rata_rata_nilai
FROM 
    akademik.Nilai n
JOIN 
    akademik.Mata_Kuliah mk ON n.id_mk = mk.id_mk
GROUP BY 
    mk.id_mk, mk.nama, mk.sks;
	
--Contoh Query:
SELECT * FROM akademik.View_Rata_Nilai_Mata_Kuliah;

--  View untuk Daftar Mahasiswa Per Semester
-- View ini menampilkan mahasiswa beserta mata kuliah 
-- yang mereka ambil per semester.
CREATE OR REPLACE VIEW akademik.View_Mahasiswa_Semester AS
SELECT 
    n.semester,
    m.nama AS nama_mahasiswa,
    mk.nama AS nama_mata_kuliah,
    d.nama AS nama_dosen
FROM 
    akademik.Nilai n
JOIN 
    akademik.Mahasiswa m ON n.id_mahasiswa = m.id_mahasiswa
JOIN 
    akademik.Mata_Kuliah mk ON n.id_mk = mk.id_mk
JOIN 
    akademik.Dosen d ON n.id_dosen = d.id_dosen
ORDER BY 
    n.semester, m.nama;
--Contoh Query:
SELECT * FROM akademik.View_Mahasiswa_Semester;

--Bagian Diva (11323043)
-- Membuat tabel log untuk mencatat perubahan data mahasiswa
CREATE TABLE akademik.Log_Mahasiswa (
    id_log SERIAL PRIMARY KEY,
    id_mahasiswa INT NOT NULL,
    nama_lama VARCHAR(100),
    nama_baru VARCHAR(100),
    alamat_lama TEXT,
    alamat_baru TEXT,
    tanggal_lahir_lama DATE,
    tanggal_lahir_baru DATE,
    waktu_perubahan TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Membuat fungsi trigger untuk mencatat perubahan data mahasiswa
CREATE OR REPLACE FUNCTION LogUpdateMahasiswa()
RETURNS TRIGGER
LANGUAGE plpgsql
AS $$
BEGIN
    -- Menyisipkan log perubahan ke dalam tabel Log_Mahasiswa
    INSERT INTO akademik.Log_Mahasiswa (
        id_mahasiswa,
        nama_lama, nama_baru,
        alamat_lama, alamat_baru,
        tanggal_lahir_lama, tanggal_lahir_baru
    )
    VALUES (
        OLD.id_mahasiswa,
        OLD.nama, NEW.nama,
        OLD.alamat, NEW.alamat,
        OLD.tanggal_lahir, NEW.tanggal_lahir
    );

    RETURN NEW;
END;
$$;

-- Membuat trigger untuk memonitor perubahan data pada tabel Mahasiswa
CREATE TRIGGER TriggerUpdateMahasiswa
AFTER UPDATE ON akademik.Mahasiswa
FOR EACH ROW
EXECUTE FUNCTION LogUpdateMahasiswa();

-- Bagian Estina (11323038)
BEGIN;

-- Menambahkan data mahasiswa baru
INSERT INTO akademik.Mahasiswa (nama, alamat, tanggal_lahir)
VALUES ('Rudi', 'Jl. Merdeka No.22', '2002-07-11');

-- Menambahkan data dosen baru
INSERT INTO akademik.Dosen (nama, email, telepon)
VALUES ('Prof. Ali', 'ali@example.com', '081234567021');

-- Menambahkan data mata kuliah baru
INSERT INTO akademik.Mata_Kuliah (nama, sks)
VALUES ('Teori Graf', 3);

-- Menambahkan nilai untuk mahasiswa dan mata kuliah baru
INSERT INTO akademik.Nilai (id_mahasiswa, id_mk, id_dosen, nilai, semester)
VALUES (LASTVAL(), 16, 21, 85.0, 'Genap 2024'); -- LASTVAL() untuk mengambil ID mahasiswa terakhir yang dimasukkan

-- Jika semua operasi berhasil, commit transaksi
COMMIT;

-- Bagian Roy(11323029)
-- Stored Procedure untuk mengupdate data mahasisa
CREATE OR REPLACE PROCEDURE UpdateMahasiswa(
    p_id_mahasiswa INT,
    p_nama VARCHAR(100),
    p_alamat TEXT,
    p_tanggal_lahir DATE
)
LANGUAGE plpgsql
AS $$
BEGIN
    -- Update data mahasiswa
    UPDATE akademik.Mahasiswa
    SET nama = p_nama,
        alamat = p_alamat,
        tanggal_lahir = p_tanggal_lahir
    WHERE id_mahasiswa = p_id_mahasiswa;

    -- Berikan pesan berhasil
    RAISE NOTICE 'Mahasiswa dengan ID % berhasil diperbarui.', p_id_mahasiswa;
END;
$$;

-- Pemanggilan
CALL UpdateMahasiswa(16, 'Joko Anwar', 'Jl. Pelita Gg Methodist No.16', '1999-01-27');

-- Cek perubahan yang sudah di update
SELECT * FROM akademik.Mahasiswa WHERE id_mahasiswa = 16;