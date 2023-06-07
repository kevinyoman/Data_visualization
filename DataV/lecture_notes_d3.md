**Summary Day 1**

* **Workflow data visualisasi**: 
  + 1. business question
  + 2. prepare data (cleaning data, feature engineering)
  + 3. visualisasi data
* **Lubridate**: package yg memudahkan pengolahan data tanggal
* **Feature engineering**: membuat kolom baru berdasarkan informasi yg ada pada data
* **Base Plot**:
  - `hist()`: histogram -> cek distribusi data
  - `boxplot()`: boxplot -> cek distribusi data + cek outlier
  - `plot()`: utk buat macam2 plot berdasarkan tipe data
* Tipe plot dan kegunaan: masing-masing plot memiliki kegunaan untuk menceritakan hal tertentu. **Plot harus dicocokan dengan cerita yang ingin disampaikan.**


**Summary Day 2:**

* **ggplot2** bekerja *layer-by-layer*, layer pertama akan ditimpa oleh layer berikutnya.
* `geom_*`: untuk menambahkan elemen geometrik pada plot (tipe plot):
  + `geom_boxplot()` -> boxplot
  + `geom_point()` -> scatterplot
  + `geom_jitter()` -> scatterplot (dengan titik yang randomly scattered ke kiri/kanan)
  + `labs()`-> label seperti title, subtitle, y-axis & x-axis label, dll
* Beberapa parameter *aesthetic* (elemen visual) untuk plot:
  + `x`: sumbu x -> berdasarkan data
  + `y`: sumbu y -> berdasarkan data
  + `size`: ukuran
  + `col/color`: mewarnai garis/titik
  + `fill`: mewarnai area
  + `alpha`: transparansi
* untuk mengatur aesthetic:
  + berdasarkan data, masukan di dalam `aes()`
  + tidak berdasarkan data, maka di luar `aes()`
  + untuk semua geom, masukan di dalam `ggplot()`
  + untuk geom spesifik, masukan di dalam `geom_*()` spesifik
  
**Summary day 3**

* Barplot pada ggplot akan mengurutkan bar secara default sesuai dengan alfabetikal pada level kita, untuk mengubah urutannya kita gunakan fungsi `reorder()` yang dimasukkan ke dalam `aes()`
* Pemisahan bar sesuai kategori dapat kita lakukan dengan mengubah bentuk dataframe yang kita masukkan ke ggplot ke bentuk longer, gunakan fungsi `pivot_longer()`:
  - `data`: object dataframe
  - `cols`: memilih kolom apa saja yang ingin diubah menjadi long format
  - `names_to`: mengubah nama kolom yang akan mewakili data categorical yang diubah menjadi format long
  - `values_to`: mengubah nama kolom yang mewakili data numeric
* Jika sudah berbentuk long data, tambahkan parameter `position` di dalam geom_col, yang isinya:
  - `stack` -> menumpuk secara langsung kedua kategori
  - `dodge` -> kategori akan dipisahkan ke dalam 2 bar
  - `fill` -> diubah ke bentuk proporsi dalam 1 bar yang dipisahkan dengan warna berbeda dan skala 0-1