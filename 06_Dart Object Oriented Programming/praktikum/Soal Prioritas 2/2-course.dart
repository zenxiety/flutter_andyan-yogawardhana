import 'Course.dart'; // import class Course dari file terpisah
import 'Student.dart'; // import class Student dari file terpisah

void main() {
  // inisiasi objects dari class Course
  Course c1 = Course('C1');
  c1.deskripsi = "Kelas C1 adalah kelas pertama"; // set deskripsi course
  Course c2 = Course('C2');
  Course c3 = Course('C3');
  Course c4 = Course('C4');
  c4.deskripsi = "Kelas C1 adalah kelas terakhir"; // set deskripsi course

  // inisiasi object pertama dari Student dengan nama dan kelasnya
  Student s1 = Student('Alex', 'Alpha');

  // menambahkan course ke student pertama
  s1.addCourse(c1);
  s1.addCourse(c2);
  s1.addCourse(c3);

  // menghapus course dari student pertama
  s1.removeCourse(c2);
  s1.removeCourse(c4);

  // melihat course student pertama yang telah ditambahkan
  s1.showCourses();

  // inisiasi object kedua dari Student dengan nama dan kelasnya
  Student s2 = Student('Ben', 'Bravo');

  // menambahkan course ke student kedua
  s2.addCourse(c2);
  s2.addCourse(c4);

  // menghapus course dari student pertama
  s2.removeCourse(c2);

  // melihat course student kedua yang telah ditambahkan
  s2.showCourses();
}
