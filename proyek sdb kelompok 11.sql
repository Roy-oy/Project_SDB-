DROP TABLE IF EXISTS Nilai, Matakuliah, Mahasiswa, Admin, Dosen CASCADE;

CREATE TABLE Dosen (
    id_dosen SERIAL PRIMARY KEY,
    nama VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL,
    no_hp VARCHAR(15)
);

CREATE TABLE Admin (
    id_admin SERIAL PRIMARY KEY,
    nama VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL,
    no_hp VARCHAR(15)
);

CREATE TABLE Mahasiswa (
    id_mahasiswa SERIAL PRIMARY KEY,
    nama VARCHAR(100) NOT NULL,
    alamat TEXT NOT NULL,
    tgl_lahir DATE NOT NULL,
    kelas VARCHAR(10) NOT NULL,
    id_dosen INT,
    id_admin INT,
    FOREIGN KEY (id_dosen) REFERENCES Dosen(id_dosen),
    FOREIGN KEY (id_admin) REFERENCES Admin(id_admin)
);


CREATE TABLE Matakuliah (
    id_matakuliah SERIAL PRIMARY KEY,
    nama_mk VARCHAR(100) NOT NULL,
    sks INT NOT NULL,
    id_dosen INT NOT NULL,
    id_admin INT,
    FOREIGN KEY (id_dosen) REFERENCES Dosen(id_dosen),
    FOREIGN KEY (id_admin) REFERENCES Admin(id_admin)
);

CREATE TABLE Nilai (
    id_nilai SERIAL PRIMARY KEY,
    id_mahasiswa INT NOT NULL,
    id_matakuliah INT NOT NULL,
    id_dosen INT NOT NULL,
    nilai_akhir FLOAT NOT NULL CHECK (nilai_akhir BETWEEN 0 AND 100),
    grade VARCHAR(2),
    sks INT,
    FOREIGN KEY (id_mahasiswa) REFERENCES Mahasiswa(id_mahasiswa),
    FOREIGN KEY (id_matakuliah) REFERENCES Matakuliah(id_matakuliah),
    FOREIGN KEY (id_dosen) REFERENCES Dosen(id_dosen)
);


-- data dummy untuk dosen 
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

-- data dummy untuk admin
INSERT INTO Admin (nama, email, no_hp) 
VALUES
('Admin 1', 'admin1@univ.ac.id', '081234567890'),
('Admin 2', 'admin2@univ.ac.id', '081298765432');

-- data dummy untuk mahasiswa 
INSERT INTO Mahasiswa (nama, alamat, tgl_lahir, kelas, id_dosen, id_admin) 
VALUES
('John Doe', 'Jl. Merdeka No. 1', '2000-01-01', 'TI-2024', 1, 1),
('Jane Smith', 'Jl. Sudirman No. 5', '2001-03-15', 'TI-2025', 2, 1),
('Alice Johnson', 'Jl. Diponegoro No. 10', '2002-06-10', 'TI-2023', 3, 2),
('Bob Brown', 'Jl. Imam Bonjol No. 7', '2001-11-23', 'TI-2024', 4, 2),
('Charlie White', 'Jl. Ahmad Yani No. 12', '2000-09-18', 'TI-2025', 5, 1),
('Daniel Green', 'Jl. Panglima Polim No. 3', '2000-05-25', 'TI-2024', 6, 1),
('Eve Black', 'Jl. HOS Cokroaminoto No. 4', '2001-07-16', 'TI-2025', 7, 2),
('Frank Gray', 'Jl. Wahid Hasyim No. 8', '1999-12-30', 'TI-2023', 8, 1),
('Grace Pink', 'Jl. Kartini No. 6', '2000-03-11', 'TI-2024', 9, 2),
('Hannah Gold', 'Jl. Teuku Umar No. 9', '2001-10-20', 'TI-2025', 10, 1),
('Ian Violet', 'Jl. RA Kartini No. 15', '1998-09-14', 'TI-2023', 1, 2),
('Jack Indigo', 'Jl. Cut Nyak Dien No. 11', '1999-02-05', 'TI-2024', 2, 1),
('Karen Purple', 'Jl. Slamet Riyadi No. 18', '2000-08-25', 'TI-2025', 3, 2),
('Leo Silver', 'Jl. Gatot Subroto No. 17', '1999-11-19', 'TI-2023', 4, 1),
('Mona Ruby', 'Jl. KH Ahmad Dahlan No. 22', '2001-04-30', 'TI-2024', 5, 2),
('Nina Bronze', 'Jl. Pattimura No. 24', '2000-06-18', 'TI-2025', 6, 1),
('Oscar Pearl', 'Jl. Sudirman No. 27', '1998-01-22', 'TI-2023', 7, 2),
('Paul Emerald', 'Jl. Yos Sudarso No. 35', '1999-07-15', 'TI-2024', 8, 1),
('Quincy Amber', 'Jl. Thamrin No. 33', '2000-03-29', 'TI-2025', 9, 2),
('Rachel Sapphire', 'Jl. Jend. Soedirman No. 42', '2001-10-05', 'TI-2024', 10, 1),
('Sam Diamond', 'Jl. MH Thamrin No. 49', '2002-02-14', 'TI-2025', 1, 2),
('Tom Quartz', 'Jl. Jend. Gatot Subroto No. 50', '1999-08-09', 'TI-2024', 2, 1),
('Uma Topaz', 'Jl. Dr. Sutomo No. 54', '2000-01-18', 'TI-2025', 3, 2),
('Victor Jade', 'Jl. Letjen Suprapto No. 61', '2001-12-03', 'TI-2024', 4, 1),
('Wanda Onyx', 'Jl. Jend. Ahmad Yani No. 65', '1999-05-08', 'TI-2023', 5, 2),
('Xander Obsidian', 'Jl. Diponegoro No. 70', '2000-04-21', 'TI-2025', 6, 1),
('Yasmine Zircon', 'Jl. Imam Bonjol No. 75', '2001-11-22', 'TI-2024', 7, 2),
('Zack Amethyst', 'Jl. RA Kartini No. 80', '1998-06-13', 'TI-2023', 8, 1),
('Anna Agate', 'Jl. Teuku Umar No. 85', '1999-07-07', 'TI-2024', 9, 2);

-- data dummy untuk matakuliah 
INSERT INTO Matakuliah (nama_mk, sks, id_dosen, id_admin) 
VALUES
('Algoritma dan Pemrograman', 3, 1, 1),
('Struktur Data', 3, 2, 1),
('Basis Data', 3, 3, 2),
('Sistem Operasi', 3, 4, 2),
('Jaringan Komputer', 3, 5, 1),
('Pemrograman Web', 3, 6, 1),
('Manajemen Proyek IT', 2, 7, 2),
('Kecerdasan Buatan', 3, 8, 1),
('Pengolahan Citra Digital', 3, 9, 2),
('Sistem Informasi Geografis', 3, 10, 1);

-- data dummy untuk nilai
INSERT INTO Nilai (id_mahasiswa, id_matakuliah, id_dosen, nilai_akhir, grade, sks) 
VALUES
(1, 1, 1, 85, 'A', 3),
(2, 2, 2, 78, 'B', 3),
(3, 3, 3, 90, 'A', 3),
(4, 4, 4, 72, 'B', 3),
(5, 5, 5, 88, 'A', 3),
(6, 6, 6, 80, 'B', 3),
(7, 7, 7, 95, 'A', 2),
(8, 8, 8, 84, 'A', 3),
(9, 9, 9, 68, 'C', 3),
(10, 10, 10, 75, 'B', 3),
(11, 1, 1, 88, 'A', 3),
(12, 2, 2, 79, 'B', 3),
(13, 3, 3, 86, 'A', 3),
(14, 4, 4, 74, 'B', 3),
(15, 5, 5, 92, 'A', 3),
(16, 6, 6, 69, 'C', 3),
(17, 7, 7, 88, 'A', 2),
(18, 8, 8, 83, 'A', 3),
(19, 9, 9, 65, 'C', 3),
(20, 10, 10, 77, 'B', 3);

-- memastikan data telah berhasil 
SELECT * FROM mahasiswa;
SELECT * FROM matakuliah;
SELECT * FROM dosen;
select * from nilai ;

-- Menghitung IPK Mahasiswa
SELECT 
    M.id_mahasiswa,
    M.nama,
    ROUND(
        SUM(
            CASE
                WHEN N.nilai_akhir >= 85 THEN 4.0
                WHEN N.nilai_akhir >= 75 THEN 3.0
                WHEN N.nilai_akhir >= 65 THEN 2.0
                ELSE 1.0
            END * N.sks
        ) / SUM(N.sks),
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
        SUM(
            CASE
                WHEN N.nilai_akhir >= 85 THEN 4.0
                WHEN N.nilai_akhir >= 75 THEN 3.0
                WHEN N.nilai_akhir >= 65 THEN 2.0
                ELSE 1.0
            END * N.sks
        ) / SUM(N.sks), 1
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


-- Menambahkan Nilai Mahasiswa (Validasi Otomatis dengan Stored Procedure)

CALL add_nilai(1, 1, 1, 88.5);

-- Menggunakan Cursor untuk Memproses Data
DO $$
DECLARE
    mahasiswa RECORD;
    ipk FLOAT;
BEGIN
    FOR mahasiswa IN SELECT * FROM Mahasiswa LOOP
        SELECT SUM(nilai_akhir * sks) / SUM(sks) INTO ipk
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
    -- Hitung grade berdasarkan nilai akhir
    IF p_nilai_akhir >= 85 THEN
        grade := 'A';
    ELSIF p_nilai_akhir >= 70 THEN
        grade := 'B';
    ELSIF p_nilai_akhir >= 55 THEN
        grade := 'C';
    ELSE
        grade := 'D';
    END IF;

    -- Insert ke tabel Nilai
    INSERT INTO Nilai (id_mahasiswa, id_matakuliah, id_dosen, nilai_akhir, grade, sks)
    VALUES (p_id_mahasiswa, p_id_matakuliah, p_id_dosen, p_nilai_akhir, grade, 
            (SELECT sks FROM Matakuliah WHERE id_matakuliah = p_id_matakuliah));

    RAISE NOTICE 'Nilai berhasil ditambahkan dengan grade: %', grade;
END;
$$;

--Transaction untuk Menambahkan Mahasiswa dan Nilainya
BEGIN;

-- Tambahkan data mahasiswa
INSERT INTO Mahasiswa (nama, alamat, tgl_lahir, kelas, id_dosen, id_admin)
VALUES ('Alice Doe', 'Jl. Mawar No. 12', '2002-05-12', 'TI-2026', 1, 1)
RETURNING id_mahasiswa INTO NEW_ID;

-- Tambahkan nilai untuk mahasiswa yang baru
INSERT INTO Nilai (id_mahasiswa, id_matakuliah, id_dosen, nilai_akhir, grade, sks)
VALUES (NEW_ID, 1, 1, 87, 'A', 3);

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
