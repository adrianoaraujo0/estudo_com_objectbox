import 'package:object_box/model/course.dart';
import 'package:objectbox/objectbox.dart';

@Entity()
class Teacher{

  @Id()
  int id = 0;
  
  @Unique()
  String? name;

  @Backlink("Teacher")
  final course = ToOne<Teacher>();

}