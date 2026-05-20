# Gunakan image Python resmi yang stabil
FROM python:3.10-slim

# Atur folder kerja di dalam container Docker
WORKDIR /code

# Salin file requirements terlebih dahulu agar proses caching cepat
COPY ./requirements.txt /code/requirements.txt

# Instal semua library yang dibutuhkan (FastAPI, Pandas, Uvicorn)
RUN pip install --no-cache-dir --upgrade -r /code/requirements.txt

# Salin seluruh file project (termasuk folder analytics dan data CSV) ke container
COPY . .

# Jalankan server Uvicorn pada port 7860 (Port wajib untuk Hugging Face Spaces)
CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "7860"]