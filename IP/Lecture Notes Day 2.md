Fungsi-fungsi `dplyr`:

- fungsi `select()` -> untuk memilih kolom
  * parameter `.data =` -> memberi tahu fungsi data/objek yang akan kita gunakan
  * syntax = `select(.data = ..., nama_kolom1, nama_kolom2)`
  
- fungsi `filter()` -> untuk melakukan conditional subseting
  * syntax = `filter(.data = ..., contional_subseting)`
  
- konsep piping `%>%` -> konsep ini memungkinkan kita untuk menggabungkan satu fungsi dengan fungsi lainya
  * shortcut: `CTRL/CMD + SHIFT + M`

- fungsi `mutate()` -> untuk mengubah tipe data
  * syntax : `mutate(nama_kolom = as.factor(nama_kolom))`
  
- fungsi `mutate()` -> untuk memodifikasi kolom
  * syntax: `mutate(nama_kolom_baru = perhitungan yang ingin dilakukan)`
  
- fungsi `mutate_at` -> untuk megubah tipe data dari beberapa kolom secara sekaligus
  * paramter `.vars =` -> untuk mengdefine kolom-kolom
  * parameter `.funs = ` -> untuk mengdefine nama fungsi yang akan mengubah tipe data

- fungsi `group_by()` -> mengkategorikan berdasarkan kelompok
- fungsi `summarise()` -> untuk menghitung statistik
- fungsi `ungroup()` -> untuk melepaskan sifat dari grouping

- fungsi `arrange()` -> untuk mengurutkan data kita dari nomimal paling tinggi ke paling renda atau sebaliknya
  * secara default akan diurutkan dari yg paling rendah ke paling tinggi
  * kalo kita ingin mengurutkannya dari plg tinggi `desc()`

Fungsi-fungsi `ggplotly()`

- fungsi `ggplotly()` -> untuk mengubah plot statis menjadi interaktif
  * syntax `ggplotly(p = ...)`
  * parameter `p` -> digunakan untuk mengdefine nama objek visual statis

Flex Dashboard

- Pengaturan pada bagian flexdashboard
  * orientation: `rows/columns`
  * vertical_layout: `fill/scroll`
  
- Terdapat beberapa bagian yang dapat diatur pada isi flexdashboard
  * Pengaturan judul flexdashboard dapat diatur di bagian paling atas `title: ...`
  * Bagian Header (`### Chart A`) ataupun bagian yang mewakili sebuah tempat yang diperuntuhkan untuk menambahkan sebuah plot.
  * Setiap bagian bisa diatur ukuran lebar dan tingginya dengan menggunakan 2 parameter
    + `{data-width=350}` -> mengatur lebar
    + `{data-heigh=350}` -> mengatur tinggi

Additional:

- `1e6` -> 1 exponent 6 / 1 x 10 pangkat 6
- `%in%` -> kita bisa melakukan conditional subseting lebih dari 1 kondisi
- `\n` -> untuk menurunkan sebuah informasi pada fungsi `glue()`
- `top_n()` -> untuk mengambil hasil aggregasi dengan nilai paling tinggi
