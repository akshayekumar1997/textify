import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:textify/screens/chat_screen.dart';
import 'package:textify/screens/login_screen.dart';
import 'package:textify/screens/registration_screen.dart';
import 'package:textify/screens/welcome_screen.dart';
void main()async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(Textify());
}

class Textify extends StatelessWidget {
  const Textify({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: WelcomeScreen.routeName,
routes: {
  WelcomeScreen.routeName:(context) => WelcomeScreen(),
  Registration.routeName:(context) => Registration(),
  LoginScreen.routeName:(context) => LoginScreen(),
  ChatScreen.routeName:(context) => ChatScreen()


},
      
    );
  }
}