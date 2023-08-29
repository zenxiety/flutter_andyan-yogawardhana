// struktur class Course
class Course {
  // atribut judul dan deskripsi
  String _judul;
  String _deskripsi = "";

  // constructor class Course untuk property judul dan deskripsi
  Course(this._judul) {
    this._deskripsi = this._judul;
  }

  // getter dan setter untuk property deskripsi
  String get deskripsi => _deskripsi;
  set deskripsi(String desc) => _deskripsi = desc;

  // getter untuk property judul
  String get judul => _judul;
}
