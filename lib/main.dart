import 'package:flutter/material.dart';
import 'package:object_box/database/objectbox_database.dart';
import 'package:object_box/repository/objectbox_repository.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // await ObjectBox.create();
  runApp(const MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({super.key, required this.title});

  final String title;


  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  // ObjectBoxRepository objectBoxRepository = ObjectBoxRepository();
  TextEditingController textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Row(
              children:  [
                Expanded(
                  child: TextField(
                    controller: textEditingController,
                  ),
                ),
                IconButton(
                  onPressed: (){
                    // objectBoxRepository.insert(textEditingController.text);
                  }, 
                  icon: const Icon(Icons.add)
                ),
                IconButton(
                  onPressed: (){
                    // objectBoxRepository.getAll();
                  }, 
                  icon: const Icon(Icons.search)
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
