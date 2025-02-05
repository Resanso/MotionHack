# Local Storage di Flutter

Local storage adalah metode penyimpanan data secara lokal di perangkat pengguna tanpa perlu koneksi internet. Dalam Flutter, terdapat beberapa opsi untuk menyimpan data secara lokal, dua di antaranya adalah **Hive** dan **Shared Preferences**.

## 1. Shared Preferences
Shared Preferences digunakan untuk menyimpan data kecil seperti string, boolean, integer, atau double secara permanen menggunakan key-value pairs.

### **Instalasi**
Tambahkan dependency berikut pada `pubspec.yaml`:
```yaml
dependencies:
  shared_preferences: ^2.2.2
```
Lalu jalankan:
```sh
flutter pub get
```

### **Penggunaan**
#### **Menyimpan Data**
```dart
import 'package:shared_preferences/shared_preferences.dart';

Future<void> saveData() async {
  final prefs = await SharedPreferences.getInstance();
  await prefs.setString('username', 'FlutterDev');
}
```

#### **Mengambil Data**
```dart
Future<void> getData() async {
  final prefs = await SharedPreferences.getInstance();
  String? username = prefs.getString('username');
  print('Username: $username');
}
```

#### **Menghapus Data**
```dart
Future<void> removeData() async {
  final prefs = await SharedPreferences.getInstance();
  await prefs.remove('username');
}
```

---

## 2. Hive
Hive adalah database NoSQL yang sangat cepat dan ringan untuk penyimpanan data lokal di Flutter.

### **Instalasi**
Tambahkan dependency berikut pada `pubspec.yaml`:
```yaml
dependencies:
  hive: ^2.2.3
  hive_flutter: ^1.1.0

dev_dependencies:
  hive_generator: ^2.0.1
  build_runner: ^2.4.4
```
Lalu jalankan:
```sh
flutter pub get
```

### **Inisialisasi Hive**
Sebelum menggunakan Hive, inisialisasi terlebih dahulu di `main.dart`:
```dart
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  runApp(MyApp());
}
```

### **Membuka Box (Database)**
```dart
Future<void> openBox() async {
  await Hive.openBox('userBox');
}
```

### **Menyimpan Data**
```dart
var box = Hive.box('userBox');
box.put('username', 'FlutterDev');
```

### **Mengambil Data**
```dart
String? username = box.get('username');
print('Username: $username');
```

### **Menghapus Data**
```dart
box.delete('username');
```

---

## **Perbandingan Hive vs Shared Preferences**
| Fitur | Shared Preferences | Hive |
|--------|-------------------|------|
| Tipe Data | String, int, double, bool, list | Semua tipe data, termasuk objek kompleks |
| Performa | Cepat untuk data kecil | Lebih cepat untuk data besar |
| Ukuran Data | Terbatas | Tidak terbatas |
| Penyimpanan | Key-Value Store | Key-Value Store & Database |

---

## **Kesimpulan**
- Gunakan **Shared Preferences** jika hanya membutuhkan penyimpanan sederhana seperti settings aplikasi.
- Gunakan **Hive** jika membutuhkan penyimpanan yang lebih kompleks dengan performa tinggi.

Semoga bermanfaat! 🚀

