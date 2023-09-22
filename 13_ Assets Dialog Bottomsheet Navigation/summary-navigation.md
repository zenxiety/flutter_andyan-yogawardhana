# Summary of Navigation

## Navigation

- [flutter navigation full docs](https://medium.com/flutter-community/flutter-push-pop-push-1bb718b13c31)
- berpindah dari satu halaman ke halaman lain

## Navigation Dasar

- `Navigator.push()` : perpindahan halaman
  - parameter #1 : context
  - parameter #2 :
    > `MaterialPageRoute / CupertinoPageRoute ( builder: (context) => const Page() )`
- `Navigator.pop()` : kembali ke halaman sebelumnya
- mengirim data ke halaman baru
  - parameter constructor
    > `... (_) => Page(parameter: "Text")`  
    > `const Page({Key? key, required this.parameter}) ...`
- di halaman kedua otomatis muncul back button di appbar
  - override dengan implement `leading`

## Named Routes Navigation

- `Navigator.pushNamed()` : perpindahan halaman dengan route
  > `Navigator.of(context).pushNamed(/nama_route)`
- di MaterialApp
  - `initialRoute`
  - `routes` : fungsi pembentuk halaman
    > `routes: { '/nama_route': (_) => const Page() }`
  - routes best practice
    > `static const String route = '/route'`  
    > akses : `Page.route`
    - atau bikin class sendiri untuk routes
- arguments
  > `Navigator.of(context).pushNamed('/nama_route', arguments: "Text")`  
  > `final parameter = ModalRoute.of(context)!.settings.arguments as String`
  - lebih dari 1 argumen : pakai class object argument
  - [arguments best practice](https://docs.flutter.dev/cookbook/navigation/navigate-with-arguments)
- menambah property
  > `final String? property = ''`
  - pemanggilan property untuk stateful ditambahin prefix `widget.property`

## Advanced Navigation

- `Navigator.pushReplacement()` : pindah ke halaman baru; halaman lama dihapus dari stack; tidak ingin kembali ke page sebelumnya; contoh: login page
- `Navigator.pushAndRemoveUntil()` : pindah ke halaman yang diinginkan, semua halaman sebelumnya dihapus
  - `ModalRoute.withName('page')` : batas page yang dihapus di stack
