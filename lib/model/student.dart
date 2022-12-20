import 'package:object_box/model/course.dart';
import 'package:object_box/model/teacher.dart';
import 'package:objectbox/objectbox.dart';

@Entity()
class Student{

 @Id()
 int id = 0;
 String? name;
 int? age;
 List<Teacher> teachers;
 List<Course> courses;

 Student({this.name, this.age, this.teachers = const [], this.courses = const []});
}
