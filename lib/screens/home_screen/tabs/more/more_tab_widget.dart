import 'package:catalogo_simples/screens/home_screen/tabs/more/widgets/option_widget.dart';
import 'package:flutter/material.dart';

class MoreTabWidget extends StatelessWidget {
  const MoreTabWidget({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 10),
      child: Column(
        children: [
          OptionWidget(
            text: "Entrar", 
            icon: Icons.person, 
            onPressed: (){
              Navigator.pushNamed(context, "/login");
            }
          ),
          OptionWidget(
            text: "Configurações", 
            icon: Icons.settings_outlined, 
            onPressed: (){}
          ),
        ],
      ),
    );
  }
}