import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:inchallahlist/widgets/mainTextField.dart';
import 'package:inchallahlist/widgets/shared.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: SharedWidgets.gradientBg(),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SingleChildScrollView(
          child: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                //part 1 30%
                Container(
                  height: MediaQuery.of(context).size.height * 0.3,
                  width: MediaQuery.of(context).size.width,
                  child: Center(
                    child: Text(
                      'Inchallah List',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                //part 2 40%
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 15),
                  height: MediaQuery.of(context).size.height * 0.4,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width,
                        margin: EdgeInsets.only(left: 10, bottom: 5),
                        child: Text(
                          'Email address',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                            fontSize: 17,
                          ),
                        ),
                      ),
                      MainTextField(
                        'user@gmail.com',
                        false,
                        Icons.email_outlined,
                        TextInputType.emailAddress,
                      ),
                      SizedBox(height: 20),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        margin: EdgeInsets.only(left: 10, bottom: 5),
                        child: Text(
                          'Password',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                            fontSize: 17,
                          ),
                        ),
                      ),
                      MainTextField(
                        '●●●●●●●',
                        true,
                        Icons.lock_outline,
                        TextInputType.name,
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
                                Navigator.pushReplacementNamed(
                                    context, '/home');
                              },
                              child: Text(
                                'Log in',
                                style: TextStyle(fontSize: 20),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                //part 3 30%
                Container(
                  height: MediaQuery.of(context).size.height * 0.3,
                  child: Column(
                    children: [
                      Spacer(),
                      TextButton(
                        style: TextButton.styleFrom(
                          primary: Colors.pinkAccent,
                        ),
                        onPressed: () {
                          Navigator.pushReplacementNamed(context, '/register');
                        },
                        child: Text(
                          'Create new account',
                          style: TextStyle(
                            fontSize: 20,
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
