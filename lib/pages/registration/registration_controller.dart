// import 'dart:async';
// import 'dart:developer';
// import 'package:flutter/cupertino.dart';
// import 'package:object_box/models/meal.dart';
// import 'package:object_box/models/text_field_expansion_list.dart';
// import 'package:object_box/pages/registration/registration_repository.dart';
// import 'package:rxdart/subjects.dart';
// import '../../models/step_meal.dart';

// class RegistrationController{

//   bool validatorWillPopScope = false;
//   final GlobalKey<FormState> formKey = GlobalKey<FormState>();

//   TextEditingController textControllerNameMeal = TextEditingController();
//   TextEditingController textControllerTimeMeal = TextEditingController();

//   BehaviorSubject<Meal> controllerMeal = BehaviorSubject<Meal>();
  
//   RegistrationRepository registrationRepository = RegistrationRepository();
  
//   List<TextFieldExpansionList> textFieldExpansionList = [
//     TextFieldExpansionList(id: "Ingredientes", controller: TextEditingController()),
//     TextFieldExpansionList(id: "Passos", controller: TextEditingController()),
//   ];


//   Future<void> initDb() async{
//     await registrationRepository.initDb();
//   }

//   void updateForm(Meal meal){
//     controllerMeal.sink.add(meal);
//   }

//   void initMeal(int id){
//     controllerMeal.sink.add(Meal(id: id, ingredientMeal: [], stepMeal: []));
//   }

//   void inicializetMealDatabase([Meal? meal]) async{
//     await registrationRepository.insertMeal(
//       name: meal?.name ,
//       category: meal?.category,
//       complexity: meal?.complexity,
//       cost: meal?.cost,
//       duration: meal?.duration,
//       imgUrl: meal?.imgUrl
//     );
//   }

//   void insertMealDatabase([Meal? meal]) async{
//     await registrationRepository.updateMeal(
//       id: meal?.id,
//       name: meal?.name ,
//       category: meal?.category,
//       complexity: meal?.complexity,
//       cost: meal?.cost,
//       duration: meal?.duration,
//       imgUrl: meal?.imgUrl
//     );

//     if(meal != null){
//       await insertIngredientsDatabase(meal);
//       await insertStepDatabase(meal);
//     }
//   }



//   void removeMealDatabase(Meal meal) async{
//     await registrationRepository.removeMeal(meal.id!);
//   }

//   Future insertIngredientsDatabase(Meal meal) async{
//     for(IngredientMeal ingredient in meal.ingredientMeal){
//         await registrationRepository.insertIngredients(ingredient.mealId!,ingredient.name);
//     }
//   }

//   Future insertStepDatabase(Meal meal) async{
//     for(StepMeal step in meal.stepMeal){
//       await registrationRepository.insertStep(step.mealId!, step.name!);
//     }
//   }

//   Future<void> takePhotoFromGallery(Meal meal) async{

//     final ImagePicker picker = ImagePicker();
//     XFile?  image = await picker.pickImage(source: ImageSource.gallery);

//     if(image != null){
//       meal.imgUrl = image.path;
//       controllerMeal.sink.add(meal);
//     }
//   }

//   void insertItemListIngredients(Meal meal){
//     meal.ingredientMeal.add(IngredientMeal(mealId: meal.id, name: textFieldExpansionList[0].controller.text));
//     controllerMeal.sink.add(meal);
//     textFieldExpansionList[0].controller.clear();
//   }

//   void insertItemListStep(Meal meal){
//     meal.stepMeal.add(StepMeal(mealId: meal.id, name: textFieldExpansionList[1].controller.text));
//     controllerMeal.sink.add(meal);
//     textFieldExpansionList[1].controller.clear();
//   }

//   void validatorInsertList(String validator, Meal meal){
//     if(validator == "Ingredientes"){
//       insertItemListIngredients(meal);
//     }else {
//       insertItemListStep(meal);
//     }
//   }

//   void removeItemListIngredients(Meal meal ,int index){
//     meal.ingredientMeal.removeAt(index);
//     controllerMeal.sink.add(meal);
//     print(meal.ingredientMeal.length);
//   }

//    void removeItemListStep(Meal meal, int index){
//     meal.stepMeal.removeAt(index);
//     controllerMeal.sink.add(meal);
//   }


//   void insertCategory(Meal meal, String newTitle){
//     meal.category = newTitle;
//     controllerMeal.sink.add(meal);
//   }

//    void insertComplexity(Meal meal, String complexity){
//     meal.complexity = complexity;
//     controllerMeal.sink.add(meal);
//   }

//   void insertCost(Meal meal, String cost){
//     meal.cost = cost;
//     controllerMeal.sink.add(meal);
//   }

//   void changeExpansionListIngredient(Meal meal, bool isExpanded){
//     meal.ingredientIsExpanded = !isExpanded;
//     controllerMeal.sink.add(meal);
//   }

//   void changeExpansionListStep(Meal meal, bool isExpanded){
//     meal.stepIsExpanded = !isExpanded;
//     controllerMeal.sink.add(meal);
//   }

//   Future<int> idLastMeal() async{
//     Meal lastMeal =  await registrationRepository.findLastMeal();
//     return lastMeal.id!;
//   }

//   String validationForm(Meal meal, BuildContext context){
//     if(meal.imgUrl == null ||  meal.imgUrl!.isEmpty){

//       formKey.currentState!.validate();

//       return "Adicione uma imagem";

//     }else if(textControllerNameMeal.text.isEmpty){
      
//       formKey.currentState!.validate();
      
//       return "Adicione o nome da receita";

//     }else if(meal.category == null || meal.category!.isEmpty){
      
//       formKey.currentState!.validate();
      
//       return "Escolha a categoria da receita";

//     }else if(textControllerTimeMeal.text.isEmpty){
      
//       formKey.currentState!.validate();
      
//       return "Adicione o tempo da receita";

//     }else if(meal.complexity == null || meal.complexity!.isEmpty){
      
//       formKey.currentState!.validate();
      
//       return "Escolha a dificuldade da receita";

//     }else if(meal.cost == null){
      
//       formKey.currentState!.validate();
      
//       return "Escolha o custo da receita";

//     }else if(meal.ingredientMeal.isEmpty){
      
//       formKey.currentState!.validate();
      
//       return "Insira pelo menos 1 ingrediente";

//     }else if(meal.stepMeal.isEmpty){
      
//       formKey.currentState!.validate();
      
//       return "Insira pelo menos 1 passo";

//     }else {
//       insertMealDatabase(meal);
//       Navigator.pop(context);
//       return "Receita salva com sucesso!";
//     }
//   }

//   void printTables() async{
//     print("MEALS");
//     for(var x in await registrationRepository.findAllMeals()){
//       log(x.toString());
//     }

//     for(var x in await registrationRepository.findAllIngredients()){
//       log(x.toString());
//     }

//      for(var x in await registrationRepository.findAllSteps()){
//       log(x.toString());
//     }
//   }
// }