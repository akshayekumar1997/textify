import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:textify/controller/contacts_controller.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
class ContactList extends ConsumerWidget {
  const ContactList({super.key});
static final routName="contactsScreen";
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Contacts"),
        leading: IconButton(onPressed: () => Navigator.of(context).pop(), icon: Icon(Icons.arrow_back)),
        actions: [
          IconButton(onPressed: () => () {
            
          }, icon: Icon(Icons.search)),
          IconButton(onPressed: () => () {
            
          }, icon: Icon(Icons.more_vert))
        ],
      ),
    
      body: ref.watch(getContactsProvider).when(data: (contactList)=>
      ListView.builder(itemBuilder: (context, index) {
      
        final contact=contactList[index];
        return Card(
elevation: 2,
          child: ListTile(
            
            title: Text(contact.displayName,
            style: TextStyle(fontSize: 18),),
            leading: contact.photo==null?null:CircleAvatar(
              backgroundImage: MemoryImage(contact.photo!,),
              radius: 30,
            ),
          ),
        );
      },
      itemCount: contactList.length,
      
      ),
      
       error: (error, stackTrace){
        return Text(error.toString());
       } , loading: () {
         return Loader();
       },),
    );
  }
  Widget Loader() {
  return SpinKitCircle(
    color: Colors.blue,
    size: 50.0,
  );
}
  
  }
