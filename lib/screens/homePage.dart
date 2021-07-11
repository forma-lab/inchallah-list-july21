import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:inchallahlist/models/task.dart';
import 'package:inchallahlist/screens/addTaskPage.dart';
import 'package:inchallahlist/services/taskApi.dart';
import 'package:inchallahlist/utils/colors.dart';
import 'package:inchallahlist/utils/util.dart';
import 'package:inchallahlist/widgets/shared.dart';
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
        drawer: Drawer(
          child: Container(
            decoration: BoxDecoration(
              gradient: SharedWidgets.gradientBg(),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Username',
                  style: TextStyle(
                    fontSize: 25,
                    color: Colors.white,
                  ),
                )
              ],
            ),
          ),
        ),
        appBar: AppBar(
          title: Text('Inchallah List'),
          actions: [
            IconButton(
              icon: Icon(Icons.logout),
              onPressed: () {
                deleteToken().then((value) {
                  Navigator.pushReplacementNamed(context, '/login');
                });
              },
            )
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () async {
            // method 1
            //Navigator.pushNamed(context, '/addTask');

            //method 2
            String kamalt = await Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => AddTaskPage()),
            );
            // code ysir ki yarja3 mel Add task
            getTasks();
          },
          child: Icon(Icons.add),
        ),
        body: ListView.builder(
          itemBuilder: (context, index) => Slidable(
            actionPane: SlidableDrawerActionPane(),
            actionExtentRatio: 0.25,
            actions: [
              IconSlideAction(
                caption: 'Complete',
                color: Colors.green,
                icon: Icons.done,
                onTap: () {},
              ),
            ],
            secondaryActions: [
              IconSlideAction(
                caption: 'Delete',
                color: Colors.red,
                icon: Icons.delete,
                onTap: () {
                  setState(() {
                    loading = true;
                  });

                  TaskApi.deleteTask(myTasks[index].id).then((res) {
                    setState(() {
                      loading = false;
                    });
                    if (res.statusCode == 200) {
                      setState(() {
                        myTasks.removeAt(index);
                      });
                    }
                  });
                },
              ),
            ],
            child: Card(
              child: CheckboxListTile(
                title: Text(
                  myTasks[index].description,
                  style: TextStyle(
                    color: MyColors.purpelPrimary,
                    fontWeight: FontWeight.w500,
                    fontSize: 18,
                    decoration: myTasks[index].completed
                        ? TextDecoration.lineThrough
                        : TextDecoration.none,
                  ),
                ),
                activeColor: MyColors.purpelPrimary,
                value: myTasks[index].completed,
                onChanged: (newValue) {
                  TaskApi.updateTask(myTasks[index].id, newValue).then((res) {
                    print(res.statusCode);
                  });

                  setState(() {
                    myTasks[index].completed = newValue;
                  });
                },
              ),
            ),
          ),
          itemCount: myTasks.length,
        ),
      ),
    );
  }
}
