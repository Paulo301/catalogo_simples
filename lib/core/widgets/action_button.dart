import 'package:flutter/material.dart';

class ActionButton extends StatelessWidget {
  final String text;
  final Color backgroundColor;
  final Color foregroundColor;
  final VoidCallback onPressed;

  const ActionButton(
    this.text, 
    { 
      Key? key,
      this.backgroundColor = const Color(0xFF2EC4B6),
      this.foregroundColor = const Color(0xFFFDFFFC),
      required this.onPressed,
    }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double _screenWidth = MediaQuery.of(context).size.width;

    return TextButton(
      onPressed: onPressed,
      child: Container(
        width: _screenWidth * 0.85,
        padding: const EdgeInsets.symmetric(vertical: 20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: backgroundColor,
        ),
        alignment: Alignment.center,
        child: Text(
          text,
          style: TextStyle(
            color: foregroundColor,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ),
    );
  }
}