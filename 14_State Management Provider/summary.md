# Summary of Flutter State Management (Provider)

## State

- data yang berubah dan dapat dibaca di widget; hanya **Stateful Widget**
- sebagai property class; digunakan saat build
- mengubah state dengan method `setState`
  > `setState(() { prevState = nextState })`

## Global State

- state untuk seluruh widget
- **Provider** : package untuk state management
- membuat state provider
  > `class Class with ChangeNotifier { ... void function(...) { ... notifyListeners(); } ... }`
- mendaftarkan state provider : **main.dart**
  > `import package:app/stores/class.dart as class_store`  
  > `void main() { ... runApp ( MultiProvider ( providers: [ ChangeNotifierProvider(create: (_) => class_store.Class() ... ], child: ... ) ) ...}`
- menggunakan state dari provider
  - simpan provider di variabel; ambil data dari provider melalui getter
    > `final classProvider = Provider.of<class_store.Class>(context)`  
    > `...classProvider.class[index]['key']...`
