import 'package:object_box/model/teacher.dart';
import 'package:objectbox/objectbox.dart';

@Entity()
class Course{

  @Id()
  int id = 0;
  String? name;
  Teacher? teacher;

  Course({this.name, this.teacher});

}