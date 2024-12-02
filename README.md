
---

## MaterialApp
`MaterialApp` adalah widget wajib pada Flutter yang menyediakan konfigurasi dasar aplikasi, seperti tema, routing, dan lain-lain.

---

## Scaffold
Setiap halaman (page) pada Flutter pasti memiliki `Scaffold` sebagai widget utama.

---

## Praktik
### 1. `pubspec.yaml`
`pubspec.yaml` adalah file konfigurasi dalam proyek Flutter yang digunakan untuk mendefinisikan dependencies, assets, dan metadata lainnya.

### 2. Widget Essentials
Berikut adalah beberapa widget dasar yang sering digunakan dalam Flutter:
- **SafeArea**: Menghindari konten tertutup oleh bagian tepi layar (misalnya notch atau status bar).
- **Text**: Untuk menampilkan teks.
- **Container**: Widget serbaguna yang digunakan untuk dekorasi dan penataan widget lainnya.
- **Icon**: Untuk menampilkan ikon.
- **Image**: Untuk menampilkan gambar.
- **Button**: Untuk membuat tombol yang dapat ditekan.

---

## Widget Layouting
### 1. **Column & Row**
`Column` dan `Row` adalah widget layout yang memungkinkan kita menyimpan lebih dari satu widget di dalamnya.

#### Contoh Penggunaan:
- `Column`: Menyusun widget secara vertikal.
- `Row`: Menyusun widget secara horizontal.

### 2. Atribut untuk Layouting
- **Main Axis**: Menentukan arah utama layout (horizontal untuk `Row`, vertikal untuk `Column`).
- **Cross Axis**: Menentukan arah sumbu yang tegak lurus dengan main axis.

---

### 3. Alignment dan Spacing
Berikut adalah beberapa opsi untuk mengatur alignment dan spacing pada layout:

- **Main Axis Alignment**:
  - `start`: Menyusun widget di awal main axis.
  - `end`: Menyusun widget di akhir main axis.
  - `center`: Menyusun widget di tengah main axis.
  - `spaceBetween`: Memberi jarak yang sama antara widget.

Contoh penggunaan di `Row` atau `Column`:
```dart
Row(
  mainAxisAlignment: MainAxisAlignment.center, // Menyusun widget di tengah
  children: <Widget>[
    Text('Item 1'),
    Text('Item 2'),
  ],
)
