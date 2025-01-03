Function buatPembagian(int pembagi) {
  return (int i) => i / pembagi;
}

void main() {
  var pembagi5 = buatPembagian(5);
  var pembagi2 = buatPembagian(2);

  print(pembagi2(8));
  print(pembagi5);
}
