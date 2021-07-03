import 'package:flutter/material.dart';
import 'package:inchallahlist/utils/colors.dart';

class MainTextField extends StatefulWidget {
  TextInputType keyboardType;
  bool password;
  String hint;
  IconData icon;

  MainTextField(
    this.hint,
    this.password,
    this.icon,
    this.keyboardType,
  );

  @override
  _MainTextFieldState createState() => _MainTextFieldState();
}

class _MainTextFieldState extends State<MainTextField> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      child: TextFormField(
        keyboardType: widget.keyboardType,
        obscureText: widget.password,
        decoration: InputDecoration(
          hintText: widget.hint,
          prefixIcon: Icon(
            widget.icon,
            color: MyColors.pinkPrimary,
          ),
          filled: true,
          fillColor: Colors.white,
          border: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.white,
            ),
            borderRadius: BorderRadius.all(
              Radius.circular(10),
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.white,
            ),
            borderRadius: BorderRadius.all(
              Radius.circular(10),
            ),
          ),
        ),
      ),
    );
  }
}
