var nama = 'Kaizan Sultan';
String planet = 'Jupiter';
Object panggilan = 'Kaz';

// Sebaiknya gunakan `var` jika konteksnya sudah jelas.

/// Gunakan `late` bila Anda yakin nilainya DIJAMIN didefiniskan nanti.
/// Jika saat dipakai nilainya masih `null`, maka akan terjadi _runtime error_.
///  Ini berguna ketika Anda ingin menunda inisialisasi suatu variabel karena alasan tertentu, seperti:
/// - Menghindari inisialisasi mahal yang tidak selalu dibutuhkan.
/// - Menghindari ketergantungan pada nilai variabel di tahap awal, tetapi tetap memastikan nilai tersebut akan ada pada saat digunakan.
late String alamat;

void main() {
  // ignore: unused_local_variable
  String? namaToko; // bisa jadi null
  String namaPemilik; // tidak boleh jadi null

  var isOwnwerAlive = true;

  if (isOwnwerAlive) {
    namaPemilik = 'Mamuk Mekar';
  }

  print(namaPemilik);

  alamat = 'Bulanjawa';
  print(alamat);

  /// `const` harus diinisialisasi saat compile
  const double phi = 3.14;
  print(21 / phi);

  /// `final` bisa diinisialisasi saat runtime
  final int jumlahOrang;
  jumlahOrang = 12;
  print('Di ruangan itu ada $jumlahOrang orang');

  // `const` dan `final` keduanya immutable
}
