# Panduan Belajar API flutter_staggered_grid_view (v0.7.x)

Dokumentasi ini dirancang untuk menjelaskan berbagai jenis grid yang disediakan oleh library `flutter_staggered_grid_view` versi terbaru.

---

## 1. Konsep Utama
Library ini membagi grid menjadi beberapa jenis utama berdasarkan cara item disusun:

- **Masonry**: Item memiliki lebar tetap (dalam kolom) tetapi tinggi bervariasi. Item akan mengisi ruang kosong secara otomatis (seperti Pinterest).
- **Aligned**: Seperti `GridView` standar, tetapi menjamin semua item dalam satu baris memiliki tinggi yang sama dengan item tertinggi di baris tersebut.
- **Staggered**: Memberikan kontrol penuh atas berapa banyak kolom/baris yang akan ditempati oleh satu tile.
- **Quilted**: Digunakan untuk membuat tata letak bergaya "puzzle" atau "mozaik" yang berulang.

---

## 2. Masonry Grid
Paling populer untuk aplikasi galeri.

### MasonryGridView.count
Digunakan ketika jumlah kolom sudah pasti.
```dart
MasonryGridView.count(
  crossAxisCount: 2,          // Jumlah kolom
  mainAxisSpacing: 4,         // Jarak vertikal antar item
  crossAxisSpacing: 4,        // Jarak horizontal antar item
  itemBuilder: (context, index) => MyWidget(),
)
```

---

## 3. Staggered Grid (Modern API)
Versi terbaru menggunakan `StaggeredGrid` sebagai widget tata letak yang mengandung `children` berupa `StaggeredGridTile`.

### StaggeredGrid.count (API #8)
Ini adalah widget utama (pengganti `StaggeredGridView.countBuilder`). Digunakan untuk membuat grid di mana setiap item bisa memiliki ukuran kolom dan baris yang berbeda-beda. Parameter `crossAxisCount` menentukan "resolusi" grid.

### Jenis-Jenis Tile (API #10, #11, #12):

| Nama API | Kontrol Tinggi | Kegunaan Utama |
|---|---|---|
| **`StaggeredGridTile.fit`** | Otomatis (ikut konten) | Untuk gambar dengan tinggi random (Pinterest style). |
| **`StaggeredGridTile.count`** | Relatif (perbandingan aspek) | Layout mozaik/grid yang rapi dan proporsional. |
| **`StaggeredGridTile.extent`** | Fix (Pixel pasti) | Banner atau item yang tingginya tidak boleh berubah. |

#### Detail Teknis Tile:
1.  **StaggeredGridTile.fit (API #10)**:
    - Mengambil lebar sesuai jumlah kolom, tetapi tingginya menyesuaikan otomatis dengan konten di dalamnya.
2.  **StaggeredGridTile.count (API #11)**:
    - Menentukan ukuran berdasarkan jumlah kolom (`crossAxisCellCount`) dan tinggi relatif (`mainAxisCellCount`).
    - *Contoh*: `count(2, 2)` akan menghasilkan kotak sempurna jika resolusi grid-nya sesuai.
3.  **StaggeredGridTile.extent (API #12)**:
    - Menentukan ukuran berdasarkan jumlah kolom dan tinggi tetap dalam pixel (`mainAxisExtent`).

---

## 4. Aligned Grid
Sangat berguna untuk daftar e-commerce di mana Anda ingin semua kartu produk dalam satu baris memiliki tinggi yang seragam.

```dart
AlignedGridView.count(
  crossAxisCount: 2,
  itemBuilder: (context, index) => ProductCard(),
)
```

---

## 5. Quilted Grid
Digunakan untuk pola mozaik yang keren. Anda menentukan "pattern" dasar, dan grid akan mengulanginya.

```dart
GridView.custom(
  gridDelegate: SliverQuiltedGridDelegate(
    crossAxisCount: 4,
    pattern: [
      QuiltedGridTile(2, 2), // Tile 2x2
      QuiltedGridTile(1, 1), // Tile 1x1
    ],
  ),
  childrenDelegate: SliverChildBuilderDelegate(...),
)
```

---

## 6. Sliver Versions
Hampir semua grid di atas memiliki versi **Sliver** untuk digunakan di dalam `CustomScrollView`:
- `SliverMasonryGrid.count` (API #13)
- `SliverAlignedGrid.count`
- `SliverStaggeredGrid`

---

## 7. Parameter Umum yang Penting

| Parameter | Fungsi |
|---|---|
| `mainAxisSpacing` | Jarak antar item searah scroll (biasanya vertikal). |
| `crossAxisSpacing` | Jarak antar item tegak lurus arah scroll. |
| `crossAxisCount` | Menentukan jumlah kolom. |
| `itemCount` | Jumlah total item. |

---

> [!TIP]
> Logika pengganti **`staggeredTileBuilder` (API #9)** di versi 0.7.0 dilakukan dengan melakukan mapping langsung pada list `children` menggunakan jenis-jenis `StaggeredGridTile` di atas.

## 8. Ringkasan Semua API

Berikut adalah daftar lengkap API yang digunakan dalam proyek ini (13 API) serta API lain yang tersedia dalam library ini:

### A. API yang Digunakan dalam Proyek (13 API)

| No | API | Fungsi Dasar/Umum | Fungsi Spesifik dalam Proyek |
|---|---|---|---|
| **1** | `MasonryGridView.count()` | Membuat grid masonry dengan jumlah kolom tetap. | Menampilkan galeri foto utama bergaya Pinterest. |
| **2** | `crossAxisCount` | Menentukan jumlah kolom pada sumbu silang. | Membagi layar menjadi 2 kolom (Masonry) atau 4 unit (Staggered). |
| **3** | `mainAxisSpacing` | Memberi jarak antar item secara vertikal. | Memastikan gambar tidak menempel satu sama lain dari atas ke bawah. |
| **4** | `crossAxisSpacing` | Memberi jarak antar item secara horizontal. | Memastikan gambar tidak menempel satu sama lain dari kiri ke kanan. |
| **5** | `padding` | Memberi ruang kosong di sekitar grid. | Memberikan margin 8px dari tepi layar agar desain lebih elegan. |
| **6** | `itemCount` | Menentukan jumlah item dalam list. | Mengambil jumlah total data dari `dummyImages` (35 item). |
| **7** | `itemBuilder` | Membangun widget untuk setiap index. | Merubah data `ImageItem` menjadi widget `ImageTile`. |
| **8** | `StaggeredGrid.count()` | Membuat layout dengan ukuran tile kustom. | Digunakan pada menu "Staggered Grid" untuk variasi layout. |
| **9** | **Logic Mapping** | Cara memasukkan tile ke grid (Modern). | Menggantikan `staggeredTileBuilder` lama untuk efisiensi mapping. |
| **10** | `StaggeredGridTile.fit()` | Tile yang tingginya otomatis (fit konten). | Digunakan untuk mayoritas gambar agar proporsional. |
| **11** | `StaggeredGridTile.count()` | Tile dengan ukuran kotak/perbandingan pasti. | Membuat banner besar (lebar 4 unit) pada posisi strategis. |
| **12** | `StaggeredGridTile.extent()` | Tile dengan tinggi tetap (pixel). | Memaksa gambar tertentu memiliki tinggi pasti 250px. |
| **13** | `SliverMasonryGrid.count()` | Versi Sliver dari Masonry Grid. | Digunakan bersama `SliverAppBar` agar bisa "collapse" saat scroll. |

### B. API Lain yang Tersedia di Library (v0.7.x)

Selain 13 di atas, library ini juga memiliki:
- **`AlignedGridView`**: Menjamin semua item dalam satu baris memiliki tinggi yang seragam (rata). Cocok untuk kartu produk.
- **`QuiltedGrid`**: Digunakan untuk membuat tata letak mozaik yang berulang (seperti feed Instagram Explore).
- **`SliverAlignedGrid`**: Versi Sliver dari Aligned Grid.
- **`MasonryGridView.extent`**: Membuat grid masonry yang jumlah kolomnya otomatis menyesuaikan lebar layar (responsif).
- **`AlignedGridView.extent`**: Membuat aligned grid responsif.