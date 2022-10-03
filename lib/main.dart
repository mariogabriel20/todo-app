import 'package:flutter/material.dart';
import 'package:flutter_application_1/add_todo.dart';
import 'package:flutter_application_1/checkbox_state.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Lista de quehaceres'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  bool _checked = false;
  Set<CheckBoxState> toDoList = {};

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFEEEEEE),
      appBar: AppBar(
        title: Text("TODO List"),
      ),
      body: Container(
        padding: EdgeInsets.only(top: 10),
        child: SingleChildScrollView(
          child: Column(
            children: toDoList
                .map(buildCheckBox)
                .toList(), //se usa buildCheckBox como funcion para map en lugar de una funcion anonima
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async{
          await showDialog(
              context: context,
              builder: (context) => AddToDo(toDoList: toDoList));
          setState((){});
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }

  Widget buildCheckBox(CheckBoxState checkbox) {
    return Container(
      margin: EdgeInsets.all(10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(5.0)),
          color: Colors.white),
      child: ListTile(
        leading: Checkbox(
            value: checkbox.value,
            onChanged: (value) => setState(() => checkbox.value = value!)),
        title: Text(checkbox.title),
        trailing: Material(
          color: Colors.white,
          child: IconButton(
            icon: Icon(
              Icons.delete,
              color: Colors.red,
            ),
            onPressed: () => setState(() => toDoList.remove(checkbox)),
          ),
        ),
      ),
    );
  }
}
