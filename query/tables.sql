-- 1. Pastikan menggunakan database dan schema Anda
CREATE DATABASE PERUSAHAAN_DB;

-- 2. Gunakan database baru tersebut dan schema PUBLIC
USE DATABASE PERUSAHAAN_DB;
USE SCHEMA PUBLIC;

-- ==========================================
-- 2. MEMBUAT TABEL-TABEL MASTER
-- ==========================================

-- Tabel Departemen (Divisi tempat karyawan bekerja)
CREATE OR REPLACE TABLE departemen (
    id_departemen INT PRIMARY KEY,
    nama_departemen VARCHAR(100),
    lokasi VARCHAR(100)
);

-- Tabel Jabatan (Posisi pekerjaan dan standar gaji)
CREATE OR REPLACE TABLE jabatan (
    id_jabatan INT PRIMARY KEY,
    nama_jabatan VARCHAR(100),
    gaji_pokok DECIMAL(15, 2)
);

-- ==========================================
-- 3. MEMBUAT TABEL UTAMA
-- ==========================================

-- Tabel Karyawan (Data inti karyawan)
CREATE OR REPLACE TABLE karyawan (
    id_karyawan INT PRIMARY KEY,
    nama_lengkap VARCHAR(150),
    email VARCHAR(100),
    jenis_kelamin VARCHAR(15),
    tanggal_lahir DATE,
    tanggal_bergabung DATE,
    id_departemen INT,      -- Menghubungkan ke tabel departemen
    id_jabatan INT,         -- Menghubungkan ke tabel jabatan
    status_karyawan VARCHAR(20) -- Contoh: 'Tetap', 'Kontrak', 'Magang'
);

-- ==========================================
-- 4. MEMBUAT TABEL TRANSAKSIONAL (Aktivitas Harian/Bulanan)
-- ==========================================

-- Tabel Absensi (Pencatatan kehadiran harian)
CREATE OR REPLACE TABLE absensi (
    id_absensi INT PRIMARY KEY,
    id_karyawan INT,        -- Menghubungkan absensi dengan karyawan
    tanggal DATE,
    jam_masuk TIMESTAMP,
    jam_keluar TIMESTAMP,
    status_kehadiran VARCHAR(20) -- Contoh: 'Hadir', 'Sakit', 'Izin', 'Cuti'
);

-- Tabel Penggajian (Pencatatan gaji bulanan)
CREATE OR REPLACE TABLE penggajian (
    id_penggajian INT PRIMARY KEY,
    id_karyawan INT,        -- Menghubungkan gaji dengan karyawan
    periode_bulan VARCHAR(10), -- Contoh: '2026-10' untuk Oktober 2026
    gaji_pokok DECIMAL(15, 2),
    tunjangan DECIMAL(15, 2),
    potongan DECIMAL(15, 2),
    total_gaji_bersih DECIMAL(15, 2),
    tanggal_pembayaran DATE
);