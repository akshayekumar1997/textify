import 'package:flutter/material.dart';
import 'package:textify/screens/login_screen.dart';
import 'package:textify/screens/registration_screen.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:textify/screens/widgets/rounded_button.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});
static String routeName="welcome_screen";
  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            children: [
              const SizedBox(width: 40,),
              Hero
              (
                tag: "logo",
                child: Image.asset("assets/images/logo.png",height: 60,)),
            AnimatedTextKit(animatedTexts: [
              TypewriterAnimatedText(
              
                "Textify"
              ,textStyle:TextStyle(
                fontSize: 45,
                fontWeight: FontWeight.bold
              ) ,
            
              )
             
            ],
              totalRepeatCount: 4,
            )
            ],
          ),
          const SizedBox(
            height: 48,
          ),
          Padding(padding: 
          const EdgeInsets.symmetric(vertical: 16),
          child: ElevatedButton(

            onPressed: () {
           Navigator.of(context).push(MaterialPageRoute(builder: (context) => const LoginScreen(),)); 
          },
        
           child: const Text("LogIn")),
          ),
          const SizedBox(
            height: 16,
          ),
          RoundedButton(onpressed:() =>  Navigator.of(context).push(MaterialPageRoute(builder: (context) => Registration(),)) ,color: Colors.blueAccent, text:"Register" )
        ],
      ),),
    );
  }
}