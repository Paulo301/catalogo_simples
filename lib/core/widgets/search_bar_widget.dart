import 'package:flutter/material.dart';

class SearchBarWidget extends StatelessWidget {
  final TextEditingController? controller;
  final VoidCallback onPressed;

  const SearchBarWidget({ 
    Key? key, 
    this.controller, 
    required this.onPressed 
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: null,
      height: MediaQuery.of(context).size.width * 0.2,
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: controller,
              style: Theme.of(context).textTheme.headline1,
              decoration: InputDecoration(
                hintText: "Procure pelo titulo",
                floatingLabelBehavior: FloatingLabelBehavior.never,
                hintStyle: Theme.of(context).textTheme.headline1,
                border: InputBorder.none,
                focusedBorder: InputBorder.none,
                enabledBorder: InputBorder.none,
                errorBorder: InputBorder.none,
                disabledBorder: InputBorder.none,
              ),
            ),
          ),
          IconButton(
            onPressed: onPressed, 
            icon: Icon(
              Icons.search,
              color: const Color(0xFFFDFFFC),
              size: MediaQuery.of(context).size.width * 0.07,
            ),
          )
        ],
      ),
    );
  }
}