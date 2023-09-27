import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_contacts/flutter_contacts.dart';
import 'package:riverpod/riverpod.dart';
import 'package:textify/models/user_model.dart';
import 'package:textify/screens/chat_screen.dart';
import 'package:textify/utils/utils.dart';
final SelectContactRepositaryProvider=Provider((ref) => SelectContactRepositary(fireStrore: FirebaseFirestore.instance));
class SelectContactRepositary{
  final FirebaseFirestore fireStrore;
bool isFound=false;
  SelectContactRepositary({required this.fireStrore});
 Future <List<Contact>> getContacts()async{
    List <Contact>contacts=[];
    try{
if(await FlutterContacts.requestPermission()){
   
contacts=await FlutterContacts.getContacts(withProperties: true);
}
    }
    catch(error){
      debugPrint(error.toString());
    }
    return contacts;
  }
   selectContact(selectedContact,context)async{
    try{
var userCollection=await  fireStrore.collection("user").get();

for(var document in userCollection.docs){
var userData=UserModel.fromMap(document.data());
 String selectedPhoneNum = selectedContact.phones[0].number.replaceAll(
          ' ',
          '',
        );
        if(selectedPhoneNum==userData.phoneNumber){
          isFound=true;
          Navigator.of(context).push(MaterialPageRoute(builder: (context) => ChatScreen(),));
        }
}
    }
    catch(e){
      showSnack(context: context, title: e.toString());
    }
    if(!isFound){
    showSnack(context: context, title: "This number is not found");
  }
  
  }
}