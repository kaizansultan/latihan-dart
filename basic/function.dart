/*
Dart adalah bahasa yang benar-benar object-oriented. Jadi fungsi merupakan
objek dan memiliki `type`.

Fungsi bisa:
- dinayatakan ke dalam variabel
- dikirim sebagai argumen ke fungsi lain
*/

// SINTAKSIS DASAR

bool isEven(int angka) {
  return angka.isEven;
}

/// Anotasi tipe tidak diwajibkan, tapi disarankan untuk API publik.
isOdd(int angka) {
  return angka.isOdd;
}

bool angka1 = isEven(23);

/// Jika hanya mengandung satu ekspresi, sintaks bisa dipersingkat.
bool isNegative(int angka) => angka.isNegative;
// `=> expr` adalah singkatan dari `{ return expr; }`.
// `=>` disebut juga sebagai _arrow syntax_.
// CATATAN: Antara `=>` dan `;`, hanya boleh ada ekspresi (no statement).

// PARAMETER

// --- named parameter
/// [nama] adalah wajib sedangkan [isisBerbatang] boleh null.
void sapaOrang({required String nama, bool? isBerbatang}) {
  print('Halo ${isBerbatang == true ? 'mas' : 'mba'} $nama!');
}

// --- optional posistional parameters
/// Nilai default untuk [gelar] adalah `null`.
String halo(String nama, String pesan, [String? gelar]) {
  return '$pesan ${gelar ?? ''} $nama';
}

/// Nilai default untuk [pesan] adalah `Selamat pagi`.
void sapaPagi(String nama, [String pesan = 'Selamat pagi']) {
  print('$pesan $nama');
}

kosong() {}

void main() {
  sapaOrang(nama: 'Mauza', isBerbatang: true);
  sapaOrang(nama: 'Eveline');

  print(halo('Majid', 'Selamat malam', 'tuan'));
  print(halo('Ivan', 'Selamat pagi'));

  sapaPagi('Kaizan');
  sapaPagi('Kaizan', 'Good morning');

  // --- anonymous function
  /// Anonymous function sebagai argumen. Dalam contoh dibawah, anonymous func
  /// berperan sebaagi argumen dan `map()`.
  var numbers = [1, 2, 3, 4, 5];
  var kuadrat = numbers.map((number) => number * number).toList();

  /// Bisa juga tidak menggunakan arrow.
  var kaliDua = numbers.map((number) {
    return number * 2;
  }).toList();
  print(kuadrat);
  print(kaliDua);

  /// Bisa juga disimpan ke dalam variabel.
  // ignore: prefer_function_declarations_over_variables
  var salam = ([String nama = 'Fulan']) {
    return 'Assalamu\'alaikum $nama';
  };
  print(salam('Mauza'));
  /*
    Kapan Menggunakan Anonymous Function?
    - Callback: Ketika fungsi hanya digunakan sebagai argumen untuk operasi
      sekali pakai.
    - Inline Operation: Untuk menyederhanakan kode dengan mendeklarasikan
      logika langsung di tempatnya.
    - Dynamic Behavior: Ketika fungsi diperlukan untuk digunakan secara dinamis
      tanpa memerlukan deklarasi nama.
  */

  // Semua function mengembalikan nilai, jika tidak ada return, kembalikan null
  print(kosong());
}
