# HR & Payroll Analytics Dashboard

Dashboard analitik SDM dan penggajian interaktif yang terintegrasi langsung di dalam ekosistem **Snowflake** dan **Streamlit in Snowflake**. Repositori ini mencakup pipeline otomatisasi data snapshot harian menggunakan Snowflake Scheduled Tasks serta visualisasi metrik.
---

## 📌 Gambaran Proyek

Proyek ini bertujuan untuk mengotomasi proses agregasi data karyawan, status absensi, dan data penggajian bulanan ke dalam satu tabel snapshot harian (`laporan_dashboard_snapshot`). Data tersebut kemudian dikonsumsi secara real-time oleh aplikasi Streamlit untuk memberikan visibilitas operasional bagi tim manajemen/HR.

### Fitur Utama:
- **Automated Snapshot Pipeline:** Eksekusi otomatis setiap malam (23:30 WIB) menggunakan Snowflake Task berbasis Cron (`USING CRON 30 23 * * * Asia/Jakarta`).
- **Seamless Snowpark Integration:** Pengambilan data langsung dari Snowflake tanpa dependensi koneksi eksternal yang rumit via `snowflake.snowpark.context`.
- **High-Level KPIs:** Ringkasan total karyawan, total beban gaji, dan jumlah kehadiran vs ketidakhadiran per tanggal tertentu.
- **Departmental Visualizations:** Visualisasi distribusi headcount karyawan dan total beban pengeluaran gaji per departemen.
- **Detailed Data Exploration:** Penampil tabel detail karyawan interaktif berbasis DataFrame.

---
## 🏗️ Struktur Repositori

```text
hr-payroll-analytics-dashboard/
│
├── dashboard/
│   ├── snowflake.yml               
│   └── streamlit_app.py            # Kode visualisasi dashboard utama
│
├── report_schedule.sql             # Skrip pembuatan Snowflake Task & query tabel snapshot
│
├── query/
│   └── tables.sql                  # Pembuatan database dan tables
│   └── sample_data.sql             
│   └── sample_data2.sql
│   └── cek_riwayat_eksekusi.sql            
│
└── README.md                       # Dokumentasi repositori
```

## 🖼️ Tampilan Dashboard
<img width="1787" height="896" alt="image" src="https://github.com/user-attachments/assets/8e550816-5530-4cd6-8cfe-15b84f0e2148" />

---

## 🚀 Panduan
1. Jalankan semua file query yang ada pada folder `query`
2. Pada My Workspace, create `Streamlit App` seperti tampilan dibawah ini:
   
<img width="242" height="162" alt="image" src="https://github.com/user-attachments/assets/a984ee2d-9ad3-499a-b7c3-18f504b2920a" />

4. Pada folder report_harian, create sql file `report_schedule.sql`
   
<img width="209" height="186" alt="image" src="https://github.com/user-attachments/assets/5ee05c29-460e-401c-82c6-41de6e08c5c3" />

6. Setelah data masuk ke tabel `laporan_dashboard_snapshot`, maka run `streamlit_app.py`
7. Jalankan `cek_riwayat_eksekusi.sql` untuk mengecek `report_schedule.sql` berjalan dengan lancar atau tidak 
