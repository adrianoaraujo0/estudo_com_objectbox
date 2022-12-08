import 'package:object_box/model/meal.dart';
import 'package:objectbox/objectbox.dart';

@Entity()
class IngredientMeal{

  int? id;
  String? name;

  final meal = ToOne<Meal>();

}