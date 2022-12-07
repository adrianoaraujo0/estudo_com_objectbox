import 'package:object_box/database/objectbox_database.dart';
import 'package:object_box/models/user.dart';

class ObjectBoxRepository{

   ObjectBox? objectBox;
  
  Future<void> initDb() async{
    await ObjectBox.create();
  }

  void insert(String name){
    final userBox = ObjectBox.store.box<User>();
    userBox.put(User(name, 1));
  }

  void getAll(){
    final userBox = ObjectBox.store.box<User>();
    
    print(userBox.getAll().last.idade);
  }

}