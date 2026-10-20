-- Pastikan Anda berada di database yang benar
USE DATABASE PERUSAHAAN_DB;
USE SCHEMA PUBLIC;

-- ==========================================
-- 1. MENGISI DATA MASTER: DEPARTEMEN
-- ==========================================
INSERT INTO departemen (id_departemen, nama_departemen, lokasi) VALUES
(1, 'Human Resources (HR)', 'Gedung A - Lantai 2'),
(2, 'Information Technology (IT)', 'Gedung B - Lantai 3'),
(3, 'Finance & Accounting', 'Gedung A - Lantai 3'),
(4, 'Marketing & Sales', 'Gedung C - Lantai 1'),
(5, 'Operations', 'Gedung B - Lantai 1');

-- ==========================================
-- 2. MENGISI DATA MASTER: JABATAN
-- ==========================================
INSERT INTO jabatan (id_jabatan, nama_jabatan, gaji_pokok) VALUES
(1, 'Manager', 15000000.00),
(2, 'Supervisor', 10000000.00),
(3, 'Staff Senior', 8000000.00),
(4, 'Staff Junior', 6000000.00),
(5, 'Intern / Magang', 2500000.00);

-- ==========================================
-- 3. MENGISI DATA UTAMA: 20 KARYAWAN
-- ==========================================
INSERT INTO karyawan (id_karyawan, nama_lengkap, email, jenis_kelamin, tanggal_lahir, tanggal_bergabung, id_departemen, id_jabatan, status_karyawan) VALUES
(101, 'Budi Santoso', 'budi.santoso@company.com', 'Laki-laki', '1985-04-12', '2015-01-10', 5, 1, 'Tetap'),
(102, 'Siti Aminah', 'siti.aminah@company.com', 'Perempuan', '1990-08-25', '2018-03-15', 1, 1, 'Tetap'),
(103, 'Andi Wijaya', 'andi.wijaya@company.com', 'Laki-laki', '1992-11-03', '2019-06-01', 2, 2, 'Tetap'),
(104, 'Rina Permata', 'rina.permata@company.com', 'Perempuan', '1995-02-14', '2020-09-20', 3, 2, 'Tetap'),
(105, 'Joko Susilo', 'joko.susilo@company.com', 'Laki-laki', '1988-07-30', '2016-11-05', 4, 1, 'Tetap'),
(106, 'Dewi Lestari', 'dewi.lestari@company.com', 'Perempuan', '1996-05-21', '2021-02-10', 4, 3, 'Tetap'),
(107, 'Agus Setiawan', 'agus.setiawan@company.com', 'Laki-laki', '1994-09-09', '2020-01-15', 2, 3, 'Tetap'),
(108, 'Sari Maharani', 'sari.maharani@company.com', 'Perempuan', '1997-12-11', '2022-05-01', 1, 3, 'Tetap'),
(109, 'Wahyu Saputra', 'wahyu.saputra@company.com', 'Laki-laki', '1998-03-18', '2022-08-15', 5, 4, 'Kontrak'),
(110, 'Maya Wulandari', 'maya.wulandari@company.com', 'Perempuan', '1999-01-22', '2023-01-10', 3, 4, 'Kontrak'),
(111, 'Eko Prasetyo', 'eko.prasetyo@company.com', 'Laki-laki', '1993-06-15', '2019-10-01', 2, 3, 'Tetap'),
(112, 'Ayu Wandira', 'ayu.wandira@company.com', 'Perempuan', '2000-10-05', '2023-09-01', 4, 4, 'Kontrak'),
(113, 'Hendra Gunawan', 'hendra.gunawan@company.com', 'Laki-laki', '1995-04-28', '2021-07-15', 5, 3, 'Tetap'),
(114, 'Putri Ananda', 'putri.ananda@company.com', 'Perempuan', '2001-07-19', '2024-02-01', 2, 5, 'Magang'),
(115, 'Iwan Fals', 'iwan.fals@company.com', 'Laki-laki', '1991-09-30', '2018-12-01', 5, 2, 'Tetap'),
(116, 'Dian Sastro', 'dian.sastro@company.com', 'Perempuan', '1996-11-11', '2022-03-15', 1, 4, 'Kontrak'),
(117, 'Rizky Febian', 'rizky.febian@company.com', 'Laki-laki', '1998-08-08', '2023-05-20', 3, 4, 'Kontrak'),
(118, 'Anita Rachman', 'anita.rachman@company.com', 'Perempuan', '1994-12-25', '2020-08-10', 4, 3, 'Tetap'),
(119, 'Arif Rahman', 'arif.rahman@company.com', 'Laki-laki', '2002-02-20', '2024-03-01', 5, 5, 'Magang'),
(120, 'Nina Zatulini', 'nina.zatulini@company.com', 'Perempuan', '1997-06-05', '2021-11-15', 2, 4, 'Kontrak');

-- ==========================================
-- 4. MENGISI DATA TRANSAKSIONAL: ABSENSI (Contoh 1 Hari: 1 Oktober 2026)
-- ==========================================
INSERT INTO absensi (id_absensi, id_karyawan, tanggal, jam_masuk, jam_keluar, status_kehadiran) VALUES
(1, 101, '2026-10-01', '2026-10-01 07:50:00', '2026-10-01 17:10:00', 'Hadir'),
(2, 102, '2026-10-01', '2026-10-01 08:00:00', '2026-10-01 17:15:00', 'Hadir'),
(3, 103, '2026-10-01', '2026-10-01 07:55:00', '2026-10-01 17:00:00', 'Hadir'),
(4, 104, '2026-10-01', NULL, NULL, 'Cuti'),
(5, 105, '2026-10-01', '2026-10-01 08:05:00', '2026-10-01 18:00:00', 'Hadir'),
(6, 106, '2026-10-01', '2026-10-01 08:10:00', '2026-10-01 17:05:00', 'Hadir'),
(7, 107, '2026-10-01', '2026-10-01 07:45:00', '2026-10-01 17:00:00', 'Hadir'),
(8, 108, '2026-10-01', NULL, NULL, 'Sakit'),
(9, 109, '2026-10-01', '2026-10-01 08:00:00', '2026-10-01 17:10:00', 'Hadir'),
(10, 110, '2026-10-01', '2026-10-01 07:58:00', '2026-10-01 17:00:00', 'Hadir'),
(11, 111, '2026-10-01', '2026-10-01 08:15:00', '2026-10-01 17:30:00', 'Hadir'),
(12, 112, '2026-10-01', '2026-10-01 07:50:00', '2026-10-01 17:00:00', 'Hadir'),
(13, 113, '2026-10-01', '2026-10-01 08:00:00', '2026-10-01 17:00:00', 'Hadir'),
(14, 114, '2026-10-01', '2026-10-01 08:20:00', '2026-10-01 17:00:00', 'Hadir'),
(15, 115, '2026-10-01', NULL, NULL, 'Izin'),
(16, 116, '2026-10-01', '2026-10-01 07:55:00', '2026-10-01 17:15:00', 'Hadir'),
(17, 117, '2026-10-01', '2026-10-01 07:50:00', '2026-10-01 17:00:00', 'Hadir'),
(18, 118, '2026-10-01', '2026-10-01 08:05:00', '2026-10-01 17:30:00', 'Hadir'),
(19, 119, '2026-10-01', '2026-10-01 07:45:00', '2026-10-01 16:45:00', 'Hadir'),
(20, 120, '2026-10-01', '2026-10-01 08:00:00', '2026-10-01 17:00:00', 'Hadir');

-- ==========================================
-- 5. MENGISI DATA TRANSAKSIONAL: PENGGAJIAN (Periode September 2026)
--    Gaji Bersih = Gaji Pokok + Tunjangan - Potongan
-- ==========================================
INSERT INTO penggajian (id_penggajian, id_karyawan, periode_bulan, gaji_pokok, tunjangan, potongan, total_gaji_bersih, tanggal_pembayaran) VALUES
-- Manager (Gaji Pokok 15.000.000)
(1, 101, '2026-09', 15000000, 3000000, 500000, 17500000, '2026-09-28'),
(2, 102, '2026-09', 15000000, 3000000, 500000, 17500000, '2026-09-28'),
(3, 105, '2026-09', 15000000, 3000000, 500000, 17500000, '2026-09-28'),
-- Supervisor (Gaji Pokok 10.000.000)
(4, 103, '2026-09', 10000000, 2000000, 300000, 11700000, '2026-09-28'),
(5, 104, '2026-09', 10000000, 2000000, 300000, 11700000, '2026-09-28'),
(6, 115, '2026-09', 10000000, 2000000, 300000, 11700000, '2026-09-28'),
-- Staff Senior (Gaji Pokok 8.000.000)
(7, 106, '2026-09', 8000000, 1000000, 200000, 8800000, '2026-09-28'),
(8, 107, '2026-09', 8000000, 1000000, 200000, 8800000, '2026-09-28'),
(9, 108, '2026-09', 8000000, 1000000, 200000, 8800000, '2026-09-28'),
(10, 111, '2026-09', 8000000, 1000000, 200000, 8800000, '2026-09-28'),
(11, 113, '2026-09', 8000000, 1000000, 200000, 8800000, '2026-09-28'),
(12, 118, '2026-09', 8000000, 1000000, 200000, 8800000, '2026-09-28'),
-- Staff Junior (Gaji Pokok 6.000.000)
(13, 109, '2026-09', 6000000, 500000, 150000, 6350000, '2026-09-28'),
(14, 110, '2026-09', 6000000, 500000, 150000, 6350000, '2026-09-28'),
(15, 112, '2026-09', 6000000, 500000, 150000, 6350000, '2026-09-28'),
(16, 116, '2026-09', 6000000, 500000, 150000, 6350000, '2026-09-28'),
(17, 117, '2026-09', 6000000, 500000, 150000, 6350000, '2026-09-28'),
(18, 120, '2026-09', 6000000, 500000, 150000, 6350000, '2026-09-28'),
-- Intern / Magang (Gaji Pokok 2.500.000)
(19, 114, '2026-09', 2500000, 250000, 50000, 2700000, '2026-09-28'),
(20, 119, '2026-09', 2500000, 250000, 50000, 2700000, '2026-09-28');