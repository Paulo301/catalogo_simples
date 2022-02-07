import 'package:flutter/material.dart';
import 'package:catalogo_simples/core/widgets/action_button.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        backgroundColor: const Color(0xFF011627),
        body: SafeArea(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Spacer(),
                Text(
                  "Racha Conta", 
                  style: Theme.of(context).textTheme.headline1,
                ),
                Text(
                  "Raspadinha", 
                  style: Theme.of(context).textTheme.headline2,
                ),
                const Spacer(),
                Padding(
                  padding: const EdgeInsets.fromLTRB(32.0, 0.0, 32.0, 32.0),
                  child: ActionButton(
                    "Iniciar",
                    onPressed: () {
                      Navigator.pushNamed(context, "/start");
                    },
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