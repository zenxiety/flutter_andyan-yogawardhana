void main() {
  //* 1. Percabangan (Branching)
  int nilai = 70;
  switch (nilai) {
    case > 70:
      print("Nilai A");
      break;
    case > 40:
      print("Nilai B");
      break;
    case > 0:
      print("Nilai C");
      break;
    default:
      print('');
  }

  //* 2. Perulangan (Looping)
  int n = 10;
  for (int i = 1; i <= n; i++) {
    print(i);
  }
}
