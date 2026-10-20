import streamlit as st
from snowflake.snowpark.context import get_active_session

# 1. PENGATURAN HALAMAN
st.set_page_config(layout="wide")
st.title("📊 Dashboard Laporan HR & Penggajian")
st.write("*(Data otomatis diperbarui dari snapshot harian)*")

# 2. KONEKSI & PENGAMBILAN DATA
session = get_active_session()
session.sql("USE DATABASE PERUSAHAAN_DB").collect()
session.sql("USE SCHEMA PUBLIC").collect()

# 3. AMBIL DATA DARI TABEL SNAPSHOT
sql_query = "SELECT * FROM laporan_dashboard_snapshot ORDER BY ID_KARYAWAN ASC"
df = session.sql(sql_query).to_pandas()

# ==========================================
# DI BAWAH INI ADALAH KODE VISUALISASI
# ==========================================
# 5. MEMBUAT METRIK UTAMA (KPI) DI BAGIAN ATAS
col1, col2, col3, col4 = st.columns(4)

with col1:
    st.metric(label="Total Karyawan", value=f"{len(df)} Orang")
with col2:
    # Menjumlahkan total gaji (mengubah NaN menjadi 0 jika ada data kosong)
    total_gaji = int(df['GAJI_BERSIH'].fillna(0).sum())
    st.metric(label="Total Beban Gaji (Sep)", value=f"Rp {total_gaji:,}")
with col3:
    hadir = len(df[df['KEHADIRAN'] == 'Hadir'])
    st.metric(label="Hadir (1 Okt)", value=f"{hadir} Orang")
with col4:
    absen = len(df[df['KEHADIRAN'].isin(['Sakit', 'Izin', 'Cuti'])])
    st.metric(label="Tidak Hadir (1 Okt)", value=f"{absen} Orang")

st.markdown("---")

# 6. MEMBUAT VISUALISASI GRAFIK
col_chart1, col_chart2 = st.columns(2)

with col_chart1:
    st.subheader("👥 Karyawan per Departemen")
    df_dept = df['DEPARTEMEN'].value_counts().reset_index()
    df_dept.columns = ['Nama Departemen', 'Jumlah']
    st.bar_chart(data=df_dept, x='Nama Departemen', y='Jumlah')

with col_chart2:
    st.subheader("💰 Beban Gaji per Departemen")
    df_gaji = df.groupby('DEPARTEMEN')['GAJI_BERSIH'].sum().reset_index()
    df_gaji.columns = ['Nama Departemen', 'Total Gaji']
    st.bar_chart(data=df_gaji, x='Nama Departemen', y='Total Gaji')

st.markdown("---")


# 7. MENAMPILKAN TABEL DATA LENGKAP
st.subheader("📋 Rincian Lengkap Data Karyawan")
# Menampilkan DataFrame ke layar
st.dataframe(df, width='stretch')