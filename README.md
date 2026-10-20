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

## 🖼️ Tampilan Dashboard
<img width="1787" height="896" alt="image" src="https://github.com/user-attachments/assets/8e550816-5530-4cd6-8cfe-15b84f0e2148" />


---

## 🏗️ Struktur Repositori

```text
hr-payroll-analytics-dashboard/
│
├── sql/
│   └── report_schedule.sql         # Skrip pembuatan Snowflake Task & query tabel snapshot
│
├── dashboard/
│   ├── .streamlit/
│   │   └── config.toml             # Konfigurasi antarmuka Streamlit
│   ├── pyproject.toml              # Definisi dependensi & metadata proyek
│   ├── snowflake.yml               # Konfigurasi Snowflake CLI / App deployment
│   └── streamlit_app.py            # Kode visualisasi dashboard utama
│
├── assets/
│   └── dashboard_preview.png       # Screenshot tampilan aplikasi dashboard
│
├── .gitignore                      # File ignore Git
└── README.md                       # Dokumentasi repositori
