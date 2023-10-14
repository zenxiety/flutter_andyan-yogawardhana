# Summary of UI Testing

## UI Testing

- [widget testing documentation](https://docs.flutter.dev/cookbook/testing/widget/introduction)
- pengujian tampilan (widget) aplikasi; memastikan interaksi dan respon aplikasi dengan user
- membuat script yang dijalankan otomatis

## Keuntungan

- memastikan widget memberikan tampilan dan interaksi yang sesuai
- menjadi ketentuan wajib saat perubahan widget

## Implementasi

- package : flutter_test (default)
- directory & file : **test/...\_test.dart**
- **test case** di body `main()`
  > `testWidgets('judul', (WidgetTester tester) async { await tester.pumpWidget(MaterialApp...) ... expect(find.text('About Screen'), findsOneWidget); })`
  - options: `find.[];` `tester.[];`
  - simpan `find.[]` di variabel, baru masukin ke expect
- command `flutter test` : lama waktu, total, pesan testing
  11
- flow : unit testing -> widget testing -> provider testing -> bloc testing
