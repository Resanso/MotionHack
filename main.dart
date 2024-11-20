import "dart:io";

void main() {
  while (true) {
    print("Pilih menu: ");
    print("1. Cek saldo");
    print("2. Deposit");
    print("3. Tarik tunai");
    print("4. Keluar");

    // fitur mengambil input dari user
    stdout.write("Masukkan pilihan: ");
    String? input = stdin.readLineSync();

    // fitur percabangan untuk menjalankan fungsi sesuai input user
    if (input == "1") {
      cekSaldo();
    } else if (input == "2") {
      deposit();
    } else if (input == "3") {
      tarikTunai();
    } else if (input == "4") {
      print("Terima kasih telah menggunakan layanan kami.");
      break;
    } else {
      print("Pilihan tidak valid");
    }
  }
}

// fungsi saldo awal
dynamic saldo = 25000;

// fungsi cek saldo
void cekSaldo() {
  print("Saldo Anda saat ini: $saldo");
}

// fungsi deposit
void deposit() {
  stdout.write("Masukkan nominal deposit: ");
  int? nominal;
  try {
    nominal = int.parse(stdin.readLineSync()!);
  } catch (e) {
    print("Input tidak valid");
    return;
  }
  saldo += nominal;
  print("Deposit berhasil. Saldo Anda saat ini: $saldo");
}

// fungsi tarik tunai
void tarikTunai() {
  stdout.write("Ciee ada yang mau ngedate nih, mau bawa duit berapa? ");
  int? nominal;
  try {
    nominal = int.parse(stdin.readLineSync()!);
  } catch (e) {
    print("Input tidak valid");
    return;
  }
  if (nominal > saldo) {
    print("Lanjut nguli masehh");
  } else {
    saldo -= nominal;
    print(
        "Tarik tunai berhasil. Lagi gacor ya bang, btw sisa duit lu segini $saldo");
  }
}
