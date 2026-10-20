USE DATABASE PERUSAHAAN_DB;
USE SCHEMA PUBLIC;

-- ==========================================
-- 1. TAMBAH 3 KARYAWAN BARU (ID: 121 - 123)
-- ==========================================
INSERT INTO karyawan (id_karyawan, nama_lengkap, email, jenis_kelamin, tanggal_lahir, tanggal_bergabung, id_departemen, id_jabatan, status_karyawan) VALUES
(121, 'Bambang Pamungkas', 'bambang.pamungkas@company.com', 'Laki-laki', '1995-06-10', '2026-10-01', 2, 3, 'Tetap'),
(122, 'Siti Nurhaliza', 'siti.nurhaliza@company.com', 'Perempuan', '1998-09-12', '2026-10-01', 1, 4, 'Kontrak'),
(123, 'Ahmad Fauzi', 'ahmad.fauzi@company.com', 'Laki-laki', '2001-03-25', '2026-10-01', 5, 5, 'Magang');

-- ==========================================
-- 2. TAMBAH CATATAN ABSENSI BARU (ID: 21 - 23)
-- ==========================================
INSERT INTO absensi (id_absensi, id_karyawan, tanggal, jam_masuk, jam_keluar, status_kehadiran) VALUES
(21, 121, '2026-10-02', '2026-10-02 08:00:00', '2026-10-02 17:00:00', 'Hadir'),
(22, 122, '2026-10-02', NULL, NULL, 'Sakit'),
(23, 123, '2026-10-02', '2026-10-02 07:50:00', '2026-10-02 16:50:00', 'Hadir');

-- ==========================================
-- 3. TAMBAH CATATAN PENGGAJIAN BARU (ID: 21 - 23)
-- ==========================================
INSERT INTO penggajian (id_penggajian, id_karyawan, periode_bulan, gaji_pokok, tunjangan, potongan, total_gaji_bersih, tanggal_pembayaran) VALUES
(21, 121, '2026-10', 8000000, 1000000, 200000, 8800000, '2026-10-28'),
(22, 122, '2026-10', 6000000, 500000, 150000, 6350000, '2026-10-28'),
(23, 123, '2026-10', 2500000, 250000, 50000, 2700000, '2026-10-28');