import 'package:flutter/material.dart';

class TextfieldWidget extends StatelessWidget {
  final TextEditingController? controller;
  final String hint;
  final double marginTop;

  const TextfieldWidget({ 
    Key? key, 
    this.controller, 
    required this.hint, 
    required this.marginTop 
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: marginTop),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          hintText: hint,
          floatingLabelBehavior: FloatingLabelBehavior.auto,
          hintStyle: Theme.of(context).textTheme.headline1,
        ),
      ),
    );
  }
}