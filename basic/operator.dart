// Ketika Anda menggunakan operator, Anda menciptakan ekspresi

void main() {
  // ARITMATIKA
  print('2 + 3 = ${2 + 3}');
  print('2 - 3 = ${2 - 3}');
  print('2 * 3 = ${2 * 3}');
  print('5 / 2 = ${5 / 2}'); // dibagi, menghasilkan double
  print('5 ~/ 2 = ${5 ~/ 2}'); // dibagi, menghasilkan int
  print('5 % 2 = ${5 % 2}');

  // PREFIX INCREMENT & DECREMENT
  int a;
  int b;

  a = 0;
  b = ++a; // a ditambahkan sebelum b mendapatkan nilainya
  print(b); // -> 1

  a = 0;
  b = a++; // a ditambahkan setelah b mendapatkan nilainya
  print(b); // -> 0
  print(b); // -> 0
  b = a++;
  print(b); // -> 1

  // PERBANDINGAN
  print(2 == 2);
  print(2 != 2);
  print(2 > 2);
  print(2 > 2);
  print(2 >= 2);
  print(2 <= 2);

  // LOGICAL OPERATOR
  bool done = false;

  if (!done && (b == 1 || a < 1)) {
    print('Yap! Pekerjaan belum selesai dan nilai a b tepat.');
  }

  bool berbatang;
  if (b > 2) {
    berbatang = true;
  } else {
    berbatang = false;
  }

  // CONDITIONAL OPRATOR
  var gender = berbatang ? 'pria' : 'wanita';
  var panggilan = gender == 'pria' ? 'bang' : null;
  print('Dia adalah seorang $gender. Kita panggil dia ${panggilan ?? 'mba'}.');

  // (selesaikan materi object untuk memahami oprator berikutnya)
  // CASCADE NOTATION

  // SPREAD OPERATOR

  // OTHER OPERATOR
}

/*
  Penjelasan tentang operator `==` di Dart:

  1. Operator `==` di Dart adalah metode (bukan operator murni).
     - Saat menulis `x == y`, Dart sebenarnya memanggil metode `x.==(y)`.

  2. Penanganan kasus null:
     - Jika salah satu atau kedua operand adalah null:
       - Hasilnya `true` hanya jika keduanya null.
       - Hasilnya `false` jika salah satu null dan lainnya tidak.
     - Contoh:
       var a = null, b = null, c = 5;
       print(a == b); // true
       print(a == c); // false

  3. Jika operand pertama (`x`) tidak null:
     - Dart memanggil metode `==` pada objek `x` dengan `y` sebagai argumen.
     - Kamu bisa mengubah logika kesetaraan dengan meng-*override* metode `==`.

  4. Penting:
     - Gunakan operator `==` dengan hati-hati, terutama untuk objek kompleks.
     - Untuk perbandingan referensi, gunakan `identical(x, y)`.
*/
