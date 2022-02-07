import 'package:catalogo_simples/core/model/user_context.dart';
import 'package:flutter/material.dart';
import 'package:catalogo_simples/catalogo_simples_app.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

void main(){
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
  ));
  
  runApp(
    ChangeNotifierProvider(
      create: (_) => UserContext(), 
      child: const CatalogoSimplesApp()
    )
  );
}