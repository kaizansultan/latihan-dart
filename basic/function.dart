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

void main() {
  sapaOrang(nama: 'Mauza', isBerbatang: true);
  sapaOrang(nama: 'Eveline');

  print(halo('Majid', 'Selamat malam', 'tuan'));
  print(halo('Ivan', 'Selamat pagi'));

  sapaPagi('Kaizan');
  sapaPagi('Kaizan', 'Good morning');
}
