import 'package:flutter/material.dart';

class InputFieldArea extends StatelessWidget {
  final String hint;
  final bool obscure;
  final IconData icon;
  InputFieldArea({this.hint, this.obscure, this.icon});
  @override
  Widget build(BuildContext context) {
    return (new Container(
      decoration: new BoxDecoration(
        border: new Border(
          bottom: new BorderSide(
            width: 0.5,
          ),
        ),
      ),
      child: new TextFormField(
        obscureText: obscure,

        decoration: new InputDecoration(
          icon: new Icon(
            icon,
          ),
          border: InputBorder.none,
          hintText: hint,
          hintStyle: const TextStyle(fontSize: 15.0),

        ),
      ),
    ));
  }
}