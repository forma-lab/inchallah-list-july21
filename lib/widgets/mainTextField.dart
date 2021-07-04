import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:inchallahlist/utils/colors.dart';

class MainTextField extends StatefulWidget {
  TextInputType keyboardType;
  bool password;
  String hint;
  IconData icon;
  TextEditingController textEditingController;
  String error;

  MainTextField(
    this.hint,
    this.password,
    this.icon,
    this.keyboardType,
    this.textEditingController,
    this.error,
  );

  @override
  _MainTextFieldState createState() => _MainTextFieldState();
}

class _MainTextFieldState extends State<MainTextField> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.error != null ? 75 : 60,
      child: TextFormField(
        controller: widget.textEditingController,
        keyboardType: widget.keyboardType,
        obscureText: widget.password,
        decoration: InputDecoration(
          errorText: widget.error,
          errorStyle: TextStyle(
            color: Colors.yellow,
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
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
