USE DATABASE PERUSAHAAN_DB;
USE SCHEMA PUBLIC;

-- 1. Buat Task (Jadwal Otomatis) setiap jam 23:30 malam waktu Asia/Jakarta
CREATE OR REPLACE TASK update_data_dashboard_jam_23_30
  WAREHOUSE = COMPUTE_WH
  SCHEDULE = 'USING CRON 30 23 * * * Asia/Jakarta'
AS
  -- Perintah untuk membuat/menimpa tabel snapshot harian
  CREATE OR REPLACE TABLE laporan_dashboard_snapshot AS
  SELECT 
      k.id_karyawan AS ID_KARYAWAN,
      k.nama_lengkap AS NAMA_KARYAWAN,
      k.jenis_kelamin AS GENDER,
      d.nama_departemen AS DEPARTEMEN,
      j.nama_jabatan AS JABATAN,
      k.status_karyawan AS STATUS,
      a.tanggal AS TANGGAL_ABSENSI,
      a.status_kehadiran AS KEHADIRAN,
      p.periode_bulan AS PERIODE_GAJI,
      p.total_gaji_bersih AS GAJI_BERSIH
  FROM karyawan k
  JOIN departemen d ON k.id_departemen = d.id_departemen
  JOIN jabatan j ON k.id_jabatan = j.id_jabatan
  LEFT JOIN absensi a ON k.id_karyawan = a.id_karyawan
  LEFT JOIN penggajian p ON k.id_karyawan = p.id_karyawan;

-- 2. Aktifkan Task tersebut agar mulai berjalan sesuai jadwal
ALTER TASK update_data_dashboard_jam_23_30 RESUME;
-- 3. (Opsional) Jalankan secara manual sekarang untuk pertama kali agar data tersedia hari ini
EXECUTE TASK update_data_dashboard_jam_23_30;
-- 4. Matikan task lama jika ingin ganti waktu schedule
ALTER TASK update_data_dashboard_jam_23_30 SUSPEND;