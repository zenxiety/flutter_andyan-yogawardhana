import 'Course.dart'; // import class Course dari file terpisah

// struktur class Student
class Student {
  // atribut nama, kelas, dan daftar course yang dimiliki Student
  final String _nama;
  final String _kelas;
  final List<Course> _courses = [];

  // constructor class Course untuk property nama dan kelas
  Student(this._nama, this._kelas);

  // method untuk menghapus Course dari Student
  List<Course> removeCourse(Course name) {
    _courses.removeWhere((el) => el == name);
    return _courses;
  }

  // method untuk menambahkan Course dari Student
  List<Course> addCourse(Course c) {
    _courses.add(c);
    return _courses;
  }

  // method untuk menampilkan daftar Course yang dimiliki dan telah ditambahkan Student
  void showCourses() {
    print("Course yang diambil ${_nama} di kelas ${_kelas}:");
    for (Course c in _courses) {
      print("${c.judul} : ${c.deskripsi}");
    }
  }
}
