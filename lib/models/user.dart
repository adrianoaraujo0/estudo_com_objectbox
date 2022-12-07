import 'package:objectbox/objectbox.dart';

@Entity()
class User{

  @Id()
  int id = 0;

  String? name;

  int? idade;

  @Property(type: PropertyType.date)
  DateTime? date;

  User([this.name, this.idade]);

}