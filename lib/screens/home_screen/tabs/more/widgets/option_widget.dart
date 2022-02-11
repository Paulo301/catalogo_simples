import 'package:flutter/material.dart';

class OptionWidget extends StatelessWidget {
  final String text;
  final IconData icon;
  final VoidCallback onPressed;

  const OptionWidget({ 
    Key? key,
    required this.text,
    required this.icon,
    required this.onPressed
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed, 
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0),
        child: Row(
          children: [
            Icon(
              icon,
              color: const Color(0xFFFDFFFC),
              size: MediaQuery.of(context).size.width * 0.07,
            ),
            Container(
              margin: const EdgeInsets.only(left: 15),
              child: Text(
                text,
                style: Theme.of(context).textTheme.headline2,
              ),
            )
          ],
        ),
      )
    );
  }
}