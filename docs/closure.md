# Closure

**Lexical closures** adalah konsep di mana fungsi dapat "menutup" (close over) variabel-variabel dari lingkup (scope) tempat fungsi itu didefinisikan, meskipun fungsi tersebut dieksekusi di luar lingkup aslinya. Fungsi ini tetap mengingat variabel-variabel tersebut.

Mari kita bedah contoh yang kamu tuliskan:

## Kode Penjelasan

```dart
/// Returns a function that adds [addBy] to the
/// function's argument.
Function makeAdder(int addBy) {
  // Fungsi ini mengakses addBy, yang ada di lingkup makeAdder
  return (int i) => addBy + i; // Fungsi anonim yang "menutup" addBy
}

void main() {
  // Create a function that adds 2.
  var add2 = makeAdder(2);

  // Create a function that adds 4.
  var add4 = makeAdder(4);

  assert(add2(3) == 5); // 2 + 3
  assert(add4(3) == 7); // 4 + 3
}
```

## Cara Kerja

1. **Fungsi `makeAdder`**:

    - Menerima parameter `addBy`.
    - Mengembalikan sebuah fungsi anonim `(int i) => addBy + i`.
    - Fungsi anonim ini menggunakan variabel `addBy`, yang dideklarasikan di luar fungsi anonim itu sendiri.

2. **Closure di `makeAdder`**:

    - Ketika `makeAdder` dipanggil, seperti `makeAdder(2)`, fungsi anonim yang dikembalikan "menutup" nilai `addBy` (dalam hal ini, 2).
    - Fungsi anonim yang dikembalikan tetap mengingat nilai `addBy`, meskipun `makeAdder` sudah selesai dieksekusi.

3. **`add2` dan `add4`**:

    - `add2` adalah fungsi yang dikembalikan oleh `makeAdder(2)`, dan "menyimpan" nilai `addBy = 2`.
    - `add4` adalah fungsi yang dikembalikan oleh `makeAdder(4)`, dan "menyimpan" nilai `addBy = 4`.

4. **Eksekusi**:
    - Ketika `add2(3)` dipanggil, fungsi anonim `(int i) => addBy + i` menggunakan `addBy = 2` dan `i = 3`, sehingga menghasilkan `2 + 3 = 5`.
    - Ketika `add4(3)` dipanggil, fungsi anonim `(int i) => addBy + i` menggunakan `addBy = 4` dan `i = 3`, sehingga menghasilkan `4 + 3 = 7`.

## Poin Penting

-   **Closure**: Fungsi anonim dalam contoh ini adalah _closure_ karena tetap "mengingat" nilai `addBy` meskipun lingkup `makeAdder` telah selesai.
-   **Lexical Scope**: Closure dapat mengakses variabel-variabel di lingkup tempat ia didefinisikan, bahkan jika lingkup tersebut tidak lagi aktif.

## Contoh Sederhana

```dart
void main() {
  var greeting = 'Hello';

  // Fungsi closure, mengingat 'greeting'
  var sayHello = () => print(greeting);

  sayHello(); // Output: Hello

  greeting = 'Hi'; // Mengubah nilai 'greeting'
  sayHello(); // Output: Hi
}
```

Di sini, fungsi `sayHello` tetap "mengingat" variabel `greeting`, meskipun nilai `greeting` berubah.

Closure memang bisa terlihat rumit awalnya, tapi kegunaannya sangat luas, terutama dalam _functional programming_ dan desain kode yang fleksibel. Mari kita jelaskan lebih mendalam:

## Apa Gunanya Closure?

Closure digunakan ketika kamu ingin:

1. **Membuat fungsi yang memiliki "memori" internal**:
   Closure memungkinkan fungsi untuk mengingat data tertentu tanpa harus menggunakan variabel global.
2. **Menyimpan keadaan (state)**:
   Kamu bisa menyimpan data di dalam fungsi tanpa memengaruhi variabel luar.

3. **Membuat fungsi yang bisa disesuaikan (customizable)**:
   Closure memungkinkanmu membuat fungsi dengan perilaku khusus, seperti _factory function_.

## Kegunaan Nyata Closure

### 1. Callback atau Event Handling

Closure sering digunakan dalam kasus _event handling_, seperti di _web development_.

**Contoh:**

```dart
Function createButtonClickHandler(String buttonName) {
  return () {
    print('Button $buttonName clicked!');
  };
}

void main() {
  var handler = createButtonClickHandler("Submit");
  handler(); // Output: Button Submit clicked!
}
```

-   Fungsi anonim yang dikembalikan tetap "mengingat" `buttonName`.

### 2. State Management

Closure berguna untuk membuat fungsi yang bisa menyimpan atau mengelola _state_ tanpa menggunakan variabel global.

**Contoh: Counter**

```dart
Function createCounter() {
  int count = 0; // State internal yang diingat closure
  return () {
    count++;
    return count;
  };
}

void main() {
  var counter = createCounter();
  print(counter()); // Output: 1
  print(counter()); // Output: 2
  print(counter()); // Output: 3
}
```

-   `createCounter` menghasilkan fungsi yang memiliki "memori" berupa `count`.
-   `count` hanya bisa diakses oleh fungsi anonim tersebut.

---

### 3. Partial Application

Closure memungkinkan pembuatan fungsi yang "mengunci" sebagian parameter.

**Contoh:**

```dart
Function multiplyBy(int multiplier) {
  return (int value) => value * multiplier;
}

void main() {
  var multiplyBy2 = multiplyBy(2);
  var multiplyBy3 = multiplyBy(3);

  print(multiplyBy2(10)); // Output: 20
  print(multiplyBy3(10)); // Output: 30
}
```

-   `multiplyBy2` adalah fungsi yang "mengunci" `multiplier = 2`.
-   Ini memungkinkanmu membuat fungsi yang lebih spesifik dari fungsi umum.

### 4. Data Privacy

Closure membantu menjaga data tetap privat, bahkan jika kodemu berkembang.

**Contoh:**

```dart
Function secretKeyGenerator(String key) {
  return () => print('Access granted with key: $key');
}

void main() {
  var generator = secretKeyGenerator("abc123");
  generator(); // Output: Access granted with key: abc123
}
```

-   `key` tidak bisa diakses langsung dari luar, hanya melalui closure.

## Kenapa Closure Itu Penting?

1. **Meminimalkan Penggunaan Global State**: Mengurangi risiko konflik antar variabel dalam program besar.
2. **Meningkatkan Encapsulation**: Data hanya bisa diakses oleh fungsi yang relevan, meningkatkan keamanan dan modularitas.
3. **Mempermudah Reusability**: Membuat fungsi yang bisa disesuaikan ulang tanpa menduplikasi kode.

Kalau bingung gunanya dalam skenario praktis, coba bayangkan:

-   Kamu ingin membuat tombol di aplikasi yang menunjukkan berapa kali ditekan tanpa memengaruhi data lain.
-   Atau kamu ingin membuat fungsi matematika yang bisa dikonfigurasi (seperti `add2`, `multiplyBy3`).

Itulah tempat closure jadi solusi ideal! ✨
