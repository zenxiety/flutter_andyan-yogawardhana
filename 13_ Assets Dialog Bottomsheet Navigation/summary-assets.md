# Summary of Assets

## Assets

- file yang bundled & deployed bersama aplikasi
- tipe: static data (JSON), icons, images, font (ttf)
- uncomment **pubspec.yaml** root di bagian assets
  - `assets/` - semua assets di dalam folder assets

## Image

- format: JPEG, WebP, GIF, Animated Web/GIF, PNG, BMP, WBMP
- image sources: project asset dan internet
- loading images
  > `Image(image: AssetImage/NetworkImage('nama file / url'))`  
  > `Image.asset('nama file')`  
  > `Image.network('url')`

## Font

- custom font
  - import .ttf ke folder fonts -> daftarkan di pubspec.yaml
    > `MaterialApp(theme: ThemeData(fontFamily: 'nama font'))`  
    > `Text('text', style: TextStyle(fontFamily: 'nama font'))`
- package font
  - tambahkan `google_fonts` di dependencies pubspec.yaml
    > `Text('text', style: GoogleFonts.namafont(fontSize: 16))`
