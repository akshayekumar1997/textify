import 'package:flutter/material.dart';
import 'package:textify/constants/constants.dart';
import 'package:textify/screens/chat_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginScreen extends StatefulWidget {
  static String routeName="login_screen";
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formkey=GlobalKey<FormState>();
  final _auth=FirebaseAuth.instance;
  final _usernameEditingController=TextEditingController();
  final _passwordEditingController=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      
      body:
      
       Container(
        
         child: Column(
          
          children: [
            const SizedBox(height: 100,),
            Flexible(
              child: Hero(
                tag: "logo",
                child: Container(
                  height: 200,
                  child: Image.asset("assets/images/logo.png"),
                ),
              ),
            ),
            const SizedBox(height: 48,),
           Form(
            key: _formkey,
            child: 
           Column(
            children:[  
              TextFormField(
                controller: _usernameEditingController,
                decoration:const InputDecoration(
       hintText: "Enter your email",
          contentPadding:
                      EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(32.0)),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide:
                        BorderSide(color: Colors.lightBlueAccent, width: 1.0),
                    borderRadius: BorderRadius.all(Radius.circular(32.0)),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide:
                        BorderSide(color: Colors.lightBlueAccent, width: 2.0),
                    borderRadius: BorderRadius.all(Radius.circular(32.0)),
                  ),
                
       )
              ),
                const SizedBox(
                height: 8.0,
              ),
                   TextFormField(
                controller: _passwordEditingController,
                decoration:const InputDecoration(
       hintText: "Enter your Password",
          contentPadding:
                      EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(32.0)),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide:
                        BorderSide(color: Colors.lightBlueAccent, width: 1.0),
                    borderRadius: BorderRadius.all(Radius.circular(32.0)),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide:
                        BorderSide(color: Colors.lightBlueAccent, width: 2.0),
                    borderRadius: BorderRadius.all(Radius.circular(32.0)),
                  ),
                
       )
              )
       
            ]
           )
           ),
             const SizedBox(
                height: 24.0,
              ),
             Padding(
              padding: const EdgeInsets.symmetric(vertical: 16),
               child: ElevatedButton(
               style: 
                ElevatedButton.styleFrom(backgroundColor: Colors.blueAccent),
                       
                onPressed: () async{
                  
                  try{
        final user=await _auth.signInWithEmailAndPassword(email:_usernameEditingController.text.trim() , password: _passwordEditingController.text.trim());
                if(user!=null){
                 Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => ChatScreen(),));
                }
                  }
                  catch(e){
                    print(e);
                  }
                 
               }, child: const Text("Login")),
             )
          ],
             ),
       ),
    
    );
  }
}