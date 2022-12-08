import 'package:object_box/model/ingredient_meal.dart';
import 'package:objectbox/objectbox.dart';

@Entity()
class Meal{

 int? id;
 String? name;
 String? category;
 String? imgUrl;
 double? duration;
 String? complexity;
 String? cost;

 @Transient()
 bool? ingredientIsExpanded;
 @Transient()
 bool? stepIsExpanded;

 @Backlink('meal')
 final ingredientMeal = ToMany<IngredientMeal>();

//  List<StepMeal>? stepMeal;
}