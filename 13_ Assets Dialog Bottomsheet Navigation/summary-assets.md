# Summary of Assets

## Assets

- file yang bundled & deployed bersama aplikasi
- tipe: static data (JSON), icons, images, font (ttf)
- uncomment **pubspec.yaml** root di bagian assets
  - `assets/` - semua assets di dalam folder assets
- language translating : manual pakai mapping (json) di `.arb` file; [LOCALIZATION](https://docs.flutter.dev/ui/accessibility-and-localization/internationalization)

## Image

- format: JPEG, WebP, GIF, Animated Web/GIF, PNG, BMP, WBMP
- image sources: project asset dan internet
- semaksimal mungkin pakai image network untuk optimasi
- biasanya max 2mb; lebih dari itu di-compress dulu
- loading images
  > `Image(image: AssetImage/NetworkImage('nama file / url'))`  
  > `Image.asset('nama file')`  
  > `Image.network('url')`  
  > `NetworkImage() dan AssetImage()` hanya jika diminta
- `errorBuilder` : widget callback jika gagal fetch image
- `loadingBuilder` : widget callback saat proses fetch image (skeleton)
- **SVG** : [flutter_svg](https://pub.dev/packages/flutter_svg)

## Font

- custom font
  - import .ttf ke folder fonts -> daftarkan di pubspec.yaml
    > `MaterialApp(theme: ThemeData(fontFamily: 'nama font'))`  
    > `Text('text', style: TextStyle(fontFamily: 'nama font'))`
- package font
  - tambahkan `google_fonts` di dependencies pubspec.yaml
    > `Text('text', style: GoogleFonts.namafont(fontSize: 16))`
- `copyWith()` : hanya implement suatu rule tanpa mengubah rules yang lain
  > `style: Theme.of(context).textTheme.headlineLarge?.copyWith(color: Colors.black)`
  - [TextTheme](https://api.flutter.dev/flutter/material/TextTheme-class.html)
