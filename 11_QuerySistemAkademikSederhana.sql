DROP TABLE IF EXISTS Nilai, Matakuliah, Mahasiswa, Admin, Dosen, JadwalKuliah CASCADE;

-- Tabel Dosen
CREATE TABLE Dosen (
    id_dosen SERIAL PRIMARY KEY,
    nama VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    no_hp VARCHAR(15) UNIQUE
);

-- Tabel Admin
CREATE TABLE Admin (
    id_admin SERIAL PRIMARY KEY,
    nama VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    no_hp VARCHAR(15) UNIQUE
);

-- Tabel Mahasiswa
CREATE TABLE Mahasiswa (
    id_mahasiswa SERIAL PRIMARY KEY,
    nama VARCHAR(100) NOT NULL,
    alamat TEXT NOT NULL,
    tgl_lahir DATE NOT NULL,
    id_dosen INT REFERENCES Dosen(id_dosen) ON DELETE SET NULL,
    id_admin INT REFERENCES Admin(id_admin) ON DELETE SET NULL
);

-- Tabel Matakuliah
CREATE TABLE Matakuliah (
    id_matakuliah SERIAL PRIMARY KEY,
    nama_mk VARCHAR(100) NOT NULL,
    sks INT NOT NULL CHECK (sks > 0),
    id_dosen INT NOT NULL REFERENCES Dosen(id_dosen) ON DELETE CASCADE,
    id_admin INT REFERENCES Admin(id_admin) ON DELETE SET NULL
);

-- Tabel Nilai
CREATE TABLE Nilai (
    id_nilai SERIAL PRIMARY KEY,
    id_mahasiswa INT NOT NULL REFERENCES Mahasiswa(id_mahasiswa) ON DELETE CASCADE,
    id_matakuliah INT NOT NULL REFERENCES Matakuliah(id_matakuliah) ON DELETE CASCADE,
    id_dosen INT NOT NULL REFERENCES Dosen(id_dosen) ON DELETE CASCADE,
    nilai_akhir FLOAT NOT NULL CHECK (nilai_akhir BETWEEN 0 AND 100),
    grade VARCHAR(2),
    sks INT
);

-- Tabel JadwalKuliah (Tanpa Ruangan)
CREATE TABLE JadwalKuliah (
    id_jadwal SERIAL PRIMARY KEY,
    hari VARCHAR(50),
    tanggal DATE,
    waktu_mulai TIME,	
    waktu_selesai TIME,
	matakuliah VARCHAR(100),
	ruangan VARCHAR(100),
    id_admin INT REFERENCES Admin(id_admin) ON DELETE SET NULL
);



SELECT * FROM jadwalkuliah;

-- Data Dummy Dosen
INSERT INTO Dosen (nama, email, no_hp) 
VALUES
('Dr. Ahmad Fauzi', 'ahmad.fauzi@univ.ac.id', '081234561001'),
('Dr. Siti Nurhaliza', 'siti.nurhaliza@univ.ac.id', '081234561002'),
('Dr. Budi Santoso', 'budi.santoso@univ.ac.id', '081234561003'),
('Dr. Ratna Dewi', 'ratna.dewi@univ.ac.id', '081234561004'),
('Dr. Rizky Kurniawan', 'rizky.kurniawan@univ.ac.id', '081234561005'),
('Dr. Eka Cahyani', 'eka.cahyani@univ.ac.id', '081234561006'),
('Dr. Andi Pratama', 'andi.pratama@univ.ac.id', '081234561007'),
('Dr. Maya Sari', 'maya.sari@univ.ac.id', '081234561008'),
('Dr. Bayu Nugroho', 'bayu.nugroho@univ.ac.id', '081234561009'),
('Dr. Farah Amalia', 'farah.amalia@univ.ac.id', '081234561010');

-- Data Dummy Admin
INSERT INTO Admin (nama, email, no_hp) 
VALUES
('Admin 1', 'admin1@univ.ac.id', '081234567890'),
('Admin 2', 'admin2@univ.ac.id', '081298765432');

-- Data Dummy Mahasiswa
INSERT INTO Mahasiswa (nama, alamat, tgl_lahir, id_dosen, id_admin) 
VALUES
('John Doe', 'Jl. Merdeka No. 1', '2000-01-01', 1, 1),
('Jane Smith', 'Jl. Sudirman No. 5', '2001-03-15', 2, 1),
('Alice Johnson', 'Jl. Diponegoro No. 10', '2002-06-10', 3, 2),
('Robert Brown', 'Jl. Mawar No. 20', '1999-11-05', 1, 2),
('Emily Davis', 'Jl. Melati No. 15', '2000-07-20', 2, 2),
('Michael Wilson', 'Jl. Kenanga No. 8', '2001-04-30', 3, 1),
('Sophia Taylor', 'Jl. Anggrek No. 25', '2002-09-18', 1, 1),
('Daniel Anderson', 'Jl. Flamboyan No. 12', '1998-12-25', 2, 1),
('Olivia Martinez', 'Jl. Dahlia No. 7', '2000-05-14', 3, 2),
('Ethan Harris', 'Jl. Sakura No. 18', '2001-08-22', 1, 2);

-- Data Dummy Matakuliah
INSERT INTO Matakuliah (nama_mk, sks, id_dosen, id_admin) 
VALUES
('PBO', 3, 1, 1),
('SKADA', 3, 2, 1),
('SBD', 3, 3, 2),
('PAM', 3, 4, 2),
('Jaringan Komputer', 3, 5, 1),
('Probstat', 3, 6, 1),
('IoT', 2, 7, 2);



-- Data Dummy JadwalKuliah
INSERT INTO JadwalKuliah (id_jadwal, hari, tanggal, waktu_mulai, waktu_selesai, matakuliah, ruangan, id_admin)
VALUES
(1, 'Senin', '2024-01-01', '08:00:00', '08:50:00', 'PBO (T), SKADA (T), JARKOM (T), SBD (T), PROBSTAT (T)', 'GD525, GD525, GD517, GD527, GD511', 1),
(2, 'Senin', '2024-01-01', '09:00:00', '09:50:00', 'PBO (T), SKADA (T), JARKOM (T), SBD (T), PROBSTAT (T)', 'GD525, GD525, GD517, GD527, GD511', 1),
(3, 'Senin', '2024-01-01', '10:00:00', '10:50:00', 'PBO (T), SKADA (T), JARKOM (T), SBD (T), PROBSTAT (T)', 'GD525, GD525, GD517, GD527, GD511', 1),
(4, 'Senin', '2024-01-01', '13:00:00', '13:50:00', 'PBO (T), SKADA (T), JARKOM (T), SBD (T), PROBSTAT (T)', 'GD525, GD525, GD517, GD527, GD511', 1),
(5, 'Senin', '2024-01-01', '15:00:00', '15:50:00', 'PBO (T), SKADA (T), JARKOM (T), SBD (T), PROBSTAT (T)', 'GD525, GD525, GD517, GD527, GD511', 1),
(6, 'Selasa', '2024-01-02', '08:00:00', '08:50:00', 'PBO (T), IoT (T), SKADA (P), PAM (T), JARKOM (P)', 'GD525, GD525, GD516, GD511, GD527', 1),
(7, 'Selasa', '2024-01-02', '09:00:00', '09:50:00', 'PBO (T), IoT (T), SKADA (P), PAM (T), JARKOM (P)', 'GD525, GD525, GD516, GD511, GD527', 2),
(8, 'Selasa', '2024-01-02', '10:00:00', '10:50:00', 'PBO (T), IoT (T), SKADA (P), PAM (T), JARKOM (P)', 'GD525, GD525, GD516, GD511, GD527', 2),
(9, 'Selasa', '2024-01-02', '14:00:00', '14:50:00', 'PBO (T), IoT (T), SKADA (P), PAM (T), JARKOM (P)', 'GD525, GD525, GD516, GD511, GD527', 2),
(10, 'Selasa', '2024-01-02', '15:00:00', '15:50:00', 'PBO (T), IoT (T), SKADA (P), PAM (T), JARKOM (P)', 'GD525, GD525, GD516, GD511, GD527', 2),
(11, 'Rabu', '2024-01-03', '08:00:00', '08:50:00', 'PBO (T), SBD (P), IoT (T), PAM (P), PROBSTAT (T)', 'GD525, GD511, GD525, GD511, GD511', 1),
(12, 'Rabu', '2024-01-03', '09:00:00', '09:50:00', 'PBO (T), SBD (P), IoT (T), PAM (P), PROBSTAT (T)', 'GD525, GD511, GD525, GD511, GD511', 1),
(13, 'Rabu', '2024-01-03', '10:00:00', '10:50:00', 'PBO (T), SBD (P), IoT (T), PAM (P), PROBSTAT (T)', 'GD525, GD511, GD525, GD511, GD511', 1),
(14, 'Rabu', '2024-01-03', '13:00:00', '13:50:00', 'PBO (T), SBD (P), IoT (T), PAM (P), PROBSTAT (T)', 'GD525, GD511, GD525, GD511, GD511', 1),
(15, 'Rabu', '2024-01-03', '15:00:00', '15:50:00', 'PBO (T), SBD (P), IoT (T), PAM (P), PROBSTAT (T)', 'GD525, GD511, GD525, GD511, GD511', 1),
(16, 'Kamis', '2024-01-04', '08:00:00', '08:50:00', 'SBD (P), SKADA (P), PAM (P), PBO (P), PAM (P)', 'GD511, GD516, GD511, GD526, GD511', 2),
(17, 'Kamis', '2024-01-04', '09:00:00', '09:50:00', 'SBD (P), SKADA (P), PAM (P), PBO (P), PAM (P)', 'GD511, GD516, GD511, GD526, GD511', 2),
(18, 'Kamis', '2024-01-04', '10:00:00', '10:50:00', 'SBD (P), SKADA (P), PAM (P), PBO (P), PAM (P)', 'GD511, GD516, GD511, GD526, GD511', 2),
(19, 'Kamis', '2024-01-04', '13:00:00', '13:50:00', 'SBD (P), SKADA (P), PAM (P), PBO (P), PAM (P)', 'GD511, GD516, GD511, GD526, GD511', 2),
(20, 'Kamis', '2024-01-04', '15:00:00', '15:50:00', 'SBD (P), SKADA (P), PAM (P), PBO (P), PAM (P)', 'GD511, GD516, GD511, GD526, GD511', 2),
(21, 'Jumat', '2024-01-05', '08:00:00', '08:50:00', 'PBO (T), PBO (P), PBO (P), PAM (P), PAM (P)', 'GD525, GD526, GD526, GD511, GD511', 1),
(22, 'Jumat', '2024-01-05', '09:00:00', '09:50:00', 'PBO (T), PBO (P), PBO (P), PAM (P), PAM (P)', 'GD525, GD526, GD526, GD511, GD511', 1),
(23, 'Jumat', '2024-01-05', '10:00:00', '10:50:00', 'PBO (T), PBO (P), PBO (P), PAM (P), PAM (P)', 'GD525, GD526, GD526, GD511, GD511', 1),
(24, 'Jumat', '2024-01-05', '13:00:00', '13:50:00', 'PBO (T), PBO (P), PBO (P), PAM (P), PAM (P)', 'GD525, GD526, GD526, GD511, GD511', 1),
(25, 'Jumat', '2024-01-05', '15:00:00', '15:50:00', 'PBO (T), PBO (P), PBO (P), PAM (P), PAM (P)', 'GD525, GD526, GD526, GD511, GD511', 1);

INSERT INTO Nilai (id_mahasiswa, id_matakuliah, id_dosen, nilai_akhir, grade, sks)
VALUES
(1, 1, 1, 92.5, 'A', 3),  -- Mahasiswa 1, Mata Kuliah 1, Dosen 1, Nilai 92.5, Grade A, SKS 3
(1, 2, 2, 88.0, 'A', 3),  -- Mahasiswa 1, Mata Kuliah 2, Dosen 2, Nilai 88.0, Grade A, SKS 3
(2, 1, 1, 75.0, 'B', 3),  -- Mahasiswa 2, Mata Kuliah 1, Dosen 1, Nilai 75.0, Grade B, SKS 3
(2, 3, 3, 82.0, 'B', 4),  -- Mahasiswa 2, Mata Kuliah 3, Dosen 3, Nilai 82.0, Grade B, SKS 4
(3, 2, 2, 65.0, 'C', 3),  -- Mahasiswa 3, Mata Kuliah 2, Dosen 2, Nilai 65.0, Grade C, SKS 3
(3, 3, 3, 55.5, 'C', 4),  -- Mahasiswa 3, Mata Kuliah 3, Dosen 3, Nilai 55.5, Grade C, SKS 4
(4, 1, 1, 48.0, 'D', 3),  -- Mahasiswa 4, Mata Kuliah 1, Dosen 1, Nilai 48.0, Grade D, SKS 3
(4, 2, 2, 42.0, 'D', 3),  -- Mahasiswa 4, Mata Kuliah 2, Dosen 2, Nilai 42.0, Grade D, SKS 3
(5, 3, 3, 35.5, 'E', 4),  -- Mahasiswa 5, Mata Kuliah 3, Dosen 3, Nilai 35.5, Grade E, SKS 4
(5, 2, 2, 28.0, 'E', 3);  -- Mahasiswa 5, Mata Kuliah 2, Dosen 2, Nilai 28.0, Grade E, SKS 3

select * from Nilai;
select * from Mahasiswa;
select * from JadwalKuliah;
select * from Matakuliah;
select * from Dosen;
select * from Admin;

UPDATE Nilai
SET nilai_akhir = 
    CASE 
        WHEN id_mahasiswa % 3 = 0 THEN ROUND((RANDOM() * (100 - 75) + 75)::numeric, 0)  -- Nilai tinggi, antara 75-100
        WHEN id_mahasiswa % 3 = 1 THEN ROUND((RANDOM() * (75 - 50) + 50)::numeric, 0)   -- Nilai sedang, antara 50-75
        ELSE ROUND((RANDOM() * (50 - 30) + 30)::numeric, 0)                           -- Nilai rendah, antara 30-50
    END;

SELECT 
    M.id_mahasiswa,
    M.nama,
    ROUND(
        (
            SUM(
                CASE
                    WHEN N.nilai_akhir >= 85 THEN 4.0
                    WHEN N.nilai_akhir >= 75 THEN 3.0
                    WHEN N.nilai_akhir >= 65 THEN 2.0
                    ELSE 1.0
                END * N.sks
            ) / SUM(N.sks)
        ) + (M.id_mahasiswa % 10) * 0.01, -- Variasi tambahan berdasarkan ID mahasiswa
        2
    ) AS IPK
FROM 
    Mahasiswa M
JOIN 
    Nilai N ON M.id_mahasiswa = N.id_mahasiswa
GROUP BY 
    M.id_mahasiswa, M.nama
ORDER BY 
    IPK DESC;


-- Menampilkan Mahasiswa dengan IPK tertinggi
SELECT 
    M.id_mahasiswa,
    M.nama,
    ROUND(
        (
            SUM(
                CASE
                    WHEN N.nilai_akhir >= 85 THEN 4.0
                    WHEN N.nilai_akhir >= 75 THEN 3.0
                    WHEN N.nilai_akhir >= 65 THEN 2.0
                    ELSE 1.0
                END * N.sks
            ) / SUM(N.sks)
        ) + (M.id_mahasiswa % 10) * 0.01,  -- Variasi tambahan berdasarkan ID mahasiswa
        2  -- Pembulatan hingga 2 tempat desimal
    ) AS IPK
FROM 
    Mahasiswa M
JOIN 
    Nilai N ON M.id_mahasiswa = N.id_mahasiswa
GROUP BY 
    M.id_mahasiswa, M.nama
ORDER BY 
    IPK DESC
LIMIT 1;

CREATE OR REPLACE PROCEDURE add_nilai(
    p_mahasiswa_id INTEGER,
    p_mata_kuliah_id INTEGER,
    p_dosen_id INTEGER,
    p_nilai NUMERIC
)
AS $$
BEGIN
    -- Logika untuk menambahkan nilai mahasiswa ke database
END;
$$ LANGUAGE plpgsql;

CALL add_nilai(1, 1, 1, CAST(88.5 AS NUMERIC));

SELECT * FROM pg_proc WHERE proname = 'add_nilai';


-- Menggunakan Cursor untuk Memproses Data
DO $$
DECLARE
    mahasiswa RECORD;
    ipk FLOAT;
BEGIN
    FOR mahasiswa IN SELECT * FROM Mahasiswa LOOP
        SELECT LEAST(GREATEST(SUM(nilai_akhir * sks) / SUM(sks), 1.0), 4.0) INTO ipk
        FROM Nilai 
        WHERE id_mahasiswa = mahasiswa.id_mahasiswa;

        RAISE NOTICE 'Mahasiswa: %, IPK: %', mahasiswa.nama, ipk;
    END LOOP;
END;
$$;

-- Mengupdate alamat Mahasiswa
UPDATE Mahasiswa
SET alamat = 'Jl. Baru No. 2'
WHERE id_mahasiswa = 1;


-- view untuk ipk 
CREATE VIEW ViewIPK AS
SELECT M.id_mahasiswa, M.nama, SUM(N.nilai_akhir * N.sks) / SUM(N.sks) AS IPK
FROM Mahasiswa M
JOIN Nilai N ON M.id_mahasiswa = N.id_mahasiswa
GROUP BY M.id_mahasiswa, M.nama;

-- trigger validasi nilai 
CREATE OR REPLACE FUNCTION validate_grade()
RETURNS TRIGGER AS $$
BEGIN
    IF NEW.nilai_akhir < 0 OR NEW.nilai_akhir > 100 THEN
        RAISE EXCEPTION 'Nilai harus antara 0 dan 100';
    END IF;
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER TriggerValidateGrade
BEFORE INSERT OR UPDATE ON Nilai
FOR EACH ROW
EXECUTE FUNCTION validate_grade();


-- function untuk grade 
CREATE OR REPLACE FUNCTION calculate_grade(nilai FLOAT)
RETURNS VARCHAR AS $$
BEGIN
    IF nilai >= 85 THEN
        RETURN 'A';
    ELSIF nilai >= 70 THEN
        RETURN 'B';
    ELSIF nilai >= 55 THEN
        RETURN 'C';
    ELSE
        RETURN 'D';
    END IF;
END;
$$ LANGUAGE plpgsql;

-- stored procedure untuk menambahkan nilai mahasiswa 
--Stored procedure ini secara otomatis menghitung grade
-- berdasarkan nilai akhir yang diinput.
CREATE OR REPLACE PROCEDURE add_nilai(
    p_id_mahasiswa INT,
    p_id_matakuliah INT,
    p_id_dosen INT,
    p_nilai_akhir FLOAT
)
LANGUAGE plpgsql
AS $$
DECLARE
    grade CHAR(2);
BEGIN
    -- Validasi jika data sudah ada
    IF EXISTS (
        SELECT 1 FROM Nilai
        WHERE id_mahasiswa = p_id_mahasiswa 
          AND id_matakuliah = p_id_matakuliah
    ) THEN
        RAISE EXCEPTION 'Nilai untuk mahasiswa dan matakuliah ini sudah ada.';
    END IF;

    -- Hitung grade
    IF p_nilai_akhir >= 85 THEN
        grade := 'A';
    ELSIF p_nilai_akhir >= 70 THEN
        grade := 'B';
    ELSIF p_nilai_akhir >= 55 THEN
        grade := 'C';
    ELSE
        grade := 'D';
    END IF;

    -- Tambahkan data
    INSERT INTO Nilai (id_mahasiswa, id_matakuliah, id_dosen, nilai_akhir, grade, sks)
    VALUES (p_id_mahasiswa, p_id_matakuliah, p_id_dosen, p_nilai_akhir, grade, 
            (SELECT sks FROM Matakuliah WHERE id_matakuliah = p_id_matakuliah));
    RAISE NOTICE 'Nilai berhasil ditambahkan dengan grade: %', grade;
END;
$$;

BEGIN;
-- Perintah transaksi 
INSERT INTO Mahasiswa (nama, alamat, tgl_lahir, id_dosen) VALUES ('John Doe', 'Jl. Merdeka', '2000-01-01', 5);
COMMIT;

--Jika ada kesalahan, gunakan ROLLBACK:
ROLLBACK;

-- Authorization 
-- Role untuk Admin
CREATE ROLE role_admin LOGIN PASSWORD 'admin123';
-- Role untuk Dosen
CREATE ROLE role_dosen LOGIN PASSWORD 'dosen123';
-- Role untuk Mahasiswa
CREATE ROLE role_mahasiswa LOGIN PASSWORD 'mahasiswa123';

-- Admin: Hak akses penuh
GRANT ALL PRIVILEGES ON TABLE Mahasiswa, Matakuliah, Dosen, Nilai TO role_admin;

-- Dosen: Hak akses hanya untuk membaca dan mengelola nilai
GRANT SELECT, INSERT, UPDATE ON TABLE Nilai TO role_dosen;

-- Mahasiswa: Hak akses hanya untuk membaca data diri dan nilai
GRANT SELECT ON TABLE Mahasiswa, Nilai TO role_mahasiswa;

-- Menggunakan role
-- Login sebagai Admin
SET ROLE role_admin;

-- Login sebagai Mahasiswa
SET ROLE role_mahasiswa;

-- Backup File
pg_dump -U postgres -d proyek_sbd_kel11 -f 11_BackupSistemAkademikSederhana.sql

-- Restore File
psql -U postgres -d proyek_sbd_kel11 -f 11_BackupSistemAkademikSederhana.sql