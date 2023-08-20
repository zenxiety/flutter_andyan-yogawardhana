void main() {
  //* 1. Percabangan (Branching)
  int nilai = 30;
  if (nilai > 70) {
    print("Nilai A");
  } else if (nilai > 40) {
    print("Nilai B");
  } else if (nilai > 0) {
    print("Nilai C");
  } else {
    print('');
  }

  //* 2. Perulangan (Looping)
  int n = 10;
  for (int i = 1; i <= n; i++) {
    print(i);
  }
}
