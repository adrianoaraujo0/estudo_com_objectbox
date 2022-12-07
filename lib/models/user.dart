import 'package:objectbox/objectbox.dart';

@Entity()
class User{

  @Id()
  final int? id = 0;

  String? name;
  String? category;
  String? imgUrl;
  double? duration;
  String? complexity;
  String? cost;
  // bool ingredientIsExpanded;
  // bool stepIsExpanded;
  // List<IngredientMeal> ingredientMeal;
  // List<StepMeal> stepMeal;
  bool? favorite;

  @Property(type: PropertyType.date)
  DateTime? date;

  User([this.name, this.category, this.imgUrl, this.duration, this.complexity, this.cost, this.favorite]);

}