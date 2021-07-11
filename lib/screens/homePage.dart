import 'package:flutter/material.dart';
import 'package:inchallahlist/models/task.dart';
import 'package:inchallahlist/services/taskApi.dart';
import 'package:inchallahlist/utils/colors.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Task> myTasks = [];
  bool loading = false;

  getTasks() {
    setState(() {
      loading = true;
    });
    TaskApi.getAllTasks().then((res) {
      setState(() {
        loading = false;
        myTasks = res;
      });
    });
  }

  @override
  void initState() {
    getTasks();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: loading,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Inchallah List'),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.pushNamed(context, '/addTask');
          },
          child: Icon(Icons.add),
        ),
        body: ListView.builder(
          itemBuilder: (context, index) => ListTile(
            title: Text(
              myTasks[index].description,
              style: TextStyle(
                fontSize: 18,
                color: MyColors.purpelPrimary,
                fontWeight: FontWeight.w500,
                decoration: myTasks[index].completed
                    ? TextDecoration.lineThrough
                    : TextDecoration.none,
              ),
            ),
            leading: Checkbox(
              activeColor: MyColors.purpelPrimary,
              focusColor: MyColors.purpelPrimary,
              value: myTasks[index].completed,
              onChanged: (newValue) {
                setState(() {
                  myTasks[index].completed = newValue;
                });
              },
            ),
          ),
          itemCount: myTasks.length,
        ),
      ),
    );
  }
}
