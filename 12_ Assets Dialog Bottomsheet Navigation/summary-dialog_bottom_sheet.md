# Summary of Dialog Bottom Sheet

## AlertDialog

- material design (android)
- informasi & mendapat input user
- helper method `showDialog` di `onPressed`
  > `showDialog(context: context, builder: (context) => AlertDialog())`
  - popup dialog size : fill safearea
  - ngambang & behaviour dismissible kalau klik di luar body
- properti
  - `content` : text, gambar, animasi
  - `actions` : button respon user
- sudah ada layoutnya dengan `title`, `content`, `action`

## Bottom Sheet

- dialog yang muncul dari bawah layar
- fungsi `showModalBottomSheet` di `onpressed`
  > `showModalBottomSheet(context: context, builder: (context) => Container())`
  - bottomsheet size : setengah layar dari bawah
  - ngambang & behaviour dismissible kalau klik di luar body (`isDismissible`) atau drag (`enableDrag`)
- properti : context & builder
- `showDragHandle` : draggable handle icon
- `isScrollControlled` : fullscreen

## Additional Notes

- menutup dialog/bottomsheet : button dengan `Navigator.pop(context)`
- bisa untuk menerima nilai
  > `final bool value = await showDialog(... Navigator.pop(context, true) ...) ?? false`
- Cupertino
  - menambah awareness pilihan di UI
    - warning
      > `actions: [ CupertinoDialogAction( isDestructiveAction: true, onPressed:... ) ]`
    - bold
      > `actions: [ CupertinoDialogAction( isDefaultAction: true, onPressed:... ) ]`
