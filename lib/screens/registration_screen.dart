import 'package:flutter/material.dart';
import 'package:textify/features/authentication/repositary/auth_repository.dart';
import 'package:textify/screens/login_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
class Registration extends StatefulWidget {
  Registration({super.key});
  static String routeName="registration_screen";

  @override
  State<Registration> createState() => _RegistrationState();
}

class _RegistrationState extends State<Registration> {
  final _auth=FirebaseAuth.instance;
  final _formKey=GlobalKey<FormState>();
  final _emailPhoneController=TextEditingController();
  final _passwordController=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal:       24
        ),
        child: 
        Container(
          padding: EdgeInsets.all(9),
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        
            children: [
              Flexible(
                child: Hero(
                  tag: "logo",
                  child: Container(
                    height: 200,
                    child: Image.asset("assets/images/logo.png"),
                  ),
                ),
              ),
               const SizedBox(
                height: 48.0,
              ),
              Form(
                autovalidateMode: AutovalidateMode.onUserInteraction,
                key: _formKey,
                child: Column(
                  children: [  TextFormField(
                 controller: _emailPhoneController,
                 validator: (value) {
          if(value!.isEmpty){
            return "Please enter email or phone";
          }
           final isValid = RegExp(r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$').hasMatch(value);
          final pattern = r'^\d{10}$';
          final regExpPhone = RegExp(pattern);
          if (!isValid &&!regExpPhone.hasMatch(value)) {
          return "Enter a valid email or phone number";
          } 
        
                 },
                  decoration: const InputDecoration(
                    hintText: 'Enter  email or phonenumber',
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(32.0)),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.blueAccent, width: 1.0),
                      borderRadius: BorderRadius.all(Radius.circular(32.0)),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.blueAccent, width: 2.0),
                      borderRadius: BorderRadius.all(Radius.circular(32.0)),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 8.0,
                ),
                TextFormField(
                  validator: (value) {
                    if(value!.length<6){
                      return "password must be atleast 6 characters";
                    }
                  },
                  obscureText: true,
                  obscuringCharacter: "*",
                controller: _passwordController,
                
                  decoration: const InputDecoration(
                    hintText: 'Enter your password',
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(32.0)),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.blueAccent, width: 1.0),
                      borderRadius: BorderRadius.all(Radius.circular(32.0)),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.blueAccent, width: 2.0),
                      borderRadius: BorderRadius.all(Radius.circular(32.0)),
                    ),
                  ),
                ),],
                ),
              ),
            
              const SizedBox(
                height: 24.0,
              ),
               ElevatedButton(
               style: ElevatedButton.styleFrom(backgroundColor: Colors.blueAccent), 
              onPressed: () async{
                if(_formKey.currentState!.validate()){
               final value=_emailPhoneController.text;
               
                final isValid = RegExp(r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$').hasMatch(value);
           const pattern = r'^\d{10}$';
          final regExpPhone = RegExp(pattern);
          if (isValid ) {
        try{
         final newUser=await _auth.createUserWithEmailAndPassword(email: _emailPhoneController.text, password: _passwordController.text);
          if(newUser!=null){
          Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => LoginScreen(),));
          }
           }
           catch(e){
           
           }
            } 
          else{
            try{

            }
            catch(e){
              print(e.toString());
            }
          }
                }
            }, child: Text("Register")),
            ],
          ),
        ),
      ),
    );
  }
}