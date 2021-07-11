import 'package:cool_alert/cool_alert.dart';
import 'package:flutter/material.dart';
import 'package:inchallahlist/services/taskApi.dart';
import 'package:inchallahlist/utils/colors.dart';
import 'package:inchallahlist/widgets/mainTextField.dart';
import 'package:inchallahlist/widgets/shared.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';

class AddTaskPage extends StatefulWidget {
  const AddTaskPage({Key key}) : super(key: key);

  @override
  _AddTaskPageState createState() => _AddTaskPageState();
}

class _AddTaskPageState extends State<AddTaskPage> {
  var emailController = TextEditingController();
  String emailError;
  bool loading = false;

  callCreateTask() {
    setState(() {
      loading = true;
    });

    TaskApi.createTask(emailController.text).then((response) {
      setState(() {
        loading = false;
      });
      print(response.statusCode);
      print(response.body);

      if (response.statusCode == 201) {
        Navigator.pop(context, 'kamalt');
      } else {
        CoolAlert.show(
          context: context,
          type: CoolAlertType.error,
          title: 'Error',
          text: "Something went wrong! please try again.",
          confirmBtnColor: MyColors.pinkPrimary,
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: loading,
      child: Container(
        decoration: BoxDecoration(
          gradient: SharedWidgets.gradientBg(),
        ),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: Container(
            padding: EdgeInsets.all(10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Create new task',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  margin: EdgeInsets.only(left: 10, bottom: 5, top: 60),
                  child: Text(
                    'Task',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                      fontSize: 17,
                    ),
                  ),
                ),
                MainTextField(
                  'my new task..',
                  false,
                  Icons.check_circle_outlined,
                  TextInputType.emailAddress,
                  emailController,
                  emailError,
                ),
                SizedBox(height: 20),
                Row(
                  children: [
                    Spacer(),
                    Container(
                      height: 45,
                      width: MediaQuery.of(context).size.width * 0.35,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: Colors.pinkAccent,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(10),
                            ),
                          ),
                        ),
                        onPressed: () {
                          //controle de saisie

                          setState(() {
                            emailError = null;
                          });

                          if (emailController.text.isEmpty) {
                            setState(() {
                              emailError = 'Description required';
                            });
                          } else {
                            callCreateTask();
                          }
                        },
                        child: Text(
                          'Create',
                          style: TextStyle(fontSize: 20),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
