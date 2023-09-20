# Summary of Navigation

## Navigation

- berpindah dari satu halaman ke halaman lain

## Navigation Dasar

- `Navigator.push()` : perpindahan halaman
- `Navigator.pop()` : kembali ke halaman sebelumnya
- mengirim data ke halaman baru
  - parameter constructor
    > `... (_) => Page(parameter: "Text")`  
    > `const Page({Key? key, required this.parameter}) ...`

## Named Routes Navigation

- `Navigator.pushNamed()` : perpindahan halaman dengan route
  > `Navigator.of(context).pushNamed(/nama_route)`
- di MaterialApp
  - `initialRoute`
  - `routes` : fungsi pembentuk halaman
    > `routes: { '/nama_route': (_) => const Page() }`
- arguments
  > `Navigator.of(context).pushNamed('/nama_route', arguments: "Text")`  
  > `final parameter = ModalRoute.of(context)!.settings.arguments as String`
