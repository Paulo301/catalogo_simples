import 'package:catalogo_simples/core/model/user_context.dart';
import 'package:catalogo_simples/core/services/user_api.dart';
import 'package:catalogo_simples/core/widgets/action_button.dart';
import 'package:catalogo_simples/screens/login_screen/widgets/textfield_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({ Key? key }) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _loginController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final UserApi _userApi = UserApi();
  

  String login = "";
  String password = "";

  @override
  void initState() {
    super.initState();

    _loginController.addListener(() {
      setState(() {
        login = _loginController.text;
      });
    });

    _passwordController.addListener(() {
      setState(() {
        password = _passwordController.text;
      });
    });
  }

  @override
  void dispose() {
    _loginController.dispose();
    _loginController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<UserContext>(builder: (context, userContext, child) {
      return Scaffold(
        backgroundColor: const Color(0xFF011627),
        appBar: AppBar(
          backgroundColor: const Color(0x33070600),
          centerTitle: true,
          title: const Text("Entrar"),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextfieldWidget(
                hint: "Digite seu login", 
                controller: _loginController,
                marginTop: 0,
              ),
              TextfieldWidget(
                hint: "Digite sua senha", 
                controller: _loginController,
                marginTop: 20,
              ),
              Container(
                margin: const EdgeInsets.only(top: 50),
                child: ActionButton(
                  "Entrar", 
                  onPressed: (){
                    _userApi.login(login, password).then((value) => {
                      userContext.addToken(value)
                    });
                  }
                ),
              )
            ],
          )
        )
      );
    },
    );
  }
}