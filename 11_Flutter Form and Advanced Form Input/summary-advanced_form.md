# Summary of Advanced Form

- Interactive widgets : interaksi aplikasi & user melalui input & feedback

### DatePicker :

- async function `showDatePicker`
  > `onPressed: () async { final selectDate = await showDatePicker() }`
- package [intl](https://pub.dev/packages/intl)
- props : context, initialDate, firstDate, lastDate
- variables
  > `DateTime _dueDate`  
  > `final currentDate`
- date formatting : `DateFormat('dd-MM-yyyy).format(_dueDate)`
- setState : `if(selectDate != null) { _dueDate = selectDate }`
- date formatting : [intl DateFormat](https://api.flutter.dev/flutter/intl/DateFormat-class.html)

### ColorPicker

- package [flutter_colorpicker](https://pub.dev/packages/flutter_colorpicker)
- widgets : `BlockPicker`, `ColorPicker`, `SlidePicker`
- props : pickerColor, onColorChanged
- variables
  > `Color _currentColor = Colors.[color]`

### FilePicker

- package [file_picker](https://pub.dev/packages/file_picker) dan [open_file](https://pub.dev/packages/open_file)
- async function `pickFile`; dipanggil di onPressed
  > `void pickFile() async { final result = await FilePicker.platform.pickFiles() }`
- membuka file
  > `void openFile(PlatformFile file) { OpenFile.open(file.path) }`
  - mendapatkan file (dalam function `pickFile`)
    > `final file = result.files.first; openFile(file)`

#### Additional Notes

- loaded page function; selalu aktif selama screen aktif

  > override `initState() { function(); }`

- stop functions yang listening

  > override `dispose()`

- jika ada input keyboard, **pakai stateful** dan **jangan pakai column**
