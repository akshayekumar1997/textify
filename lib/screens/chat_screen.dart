import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:textify/constants/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:textify/screens/contacts_screen.dart';
/// A firebase variable to check wheather the user is logged in 
 User ?  loggedInuser;
final fireStore=FirebaseFirestore.instance;
class ChatScreen extends StatefulWidget {
   ChatScreen({super.key});
   static String routeName="chat_screen";

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  ///creating firebase instance
  final _auth=FirebaseAuth.instance;
   String ? messageText;
  final _messageEditingController=TextEditingController();
  
  @override
  void initState() {
    getCurrentUser();
    super.initState();
  }

/// A method to get Current User 
  void getCurrentUser()async{ 
    try{
    final user=await _auth.currentUser;
    if(user!=null)
{
  loggedInuser=user;
  
}  }
 catch(e){
    print(e);
  }
  }
 
  @override 
  Widget build(BuildContext context) {
    return
     Scaffold(
        floatingActionButton: FloatingActionButton(onPressed: () =>()async {
await requestPhotosPermission();

      
      } ,
      child: Icon(Icons.comment),
      ),
      appBar: AppBar(
        centerTitle: true,
        title: const Text("⚡️Chat"),
        backgroundColor: Colors.lightBlueAccent,
        leading: IconButton(onPressed: () {
        
        }, icon: const Icon(Icons.arrow_back_ios_new)),
        actions: [IconButton(onPressed: () {
          _auth.signOut();
          Navigator.pop(context);
        }, icon:const Icon(Icons.close))],
      ),
      body:   Column(
           mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const MessageStream(),
            
Container(
decoration: MessageContainerDecoration,
 child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: TextField(
                    controller:_messageEditingController ,
                      decoration: MessageTextFieldDecoration,
                    ),
),
TextButton(onPressed: () {
  fireStore.collection("messages").add({"text":_messageEditingController.text,
  "sender":loggedInuser!.email});
  _messageEditingController.clear();
}, child: const Text("Send",
style: sendButtonStyle,),
 )
          ],
        ),
      ),
          ]
        )
      
    );
    
  }
  /// A method to get messages
   void getMessagesStream()async{
          await  for(var snapShot in fireStore.collection("messages").snapshots()){
for(var message in snapShot.docs){
  print(message.data());
}
            }
          }
          Future<void> requestPhotosPermission() async {
    var status = await Permission.photos.request();
    if (status.isGranted) {
     Navigator.of(context).push(MaterialPageRoute(builder: (context) => ContactList(),));
    } else if (status.isDenied) {
      // Permission denied.
    } else if (status.isPermanentlyDenied) {
      // Permission permanently denied. Open app settings to enable.
      openAppSettings();
    }
    }
}
class MessageBubble extends StatelessWidget {
   MessageBubble({super.key,required this.sender,required this.text,required this.isMe});
final String sender;
final String text;
final bool isMe;
  @override
  Widget build(BuildContext context) {
    return
     Padding(
       padding: const EdgeInsets.all(10),
       child:
      
          
          Column(
        crossAxisAlignment: isMe? CrossAxisAlignment.end:CrossAxisAlignment.start,
            children: [
              Text(sender,style: const TextStyle(fontSize: 12,color:Colors.black54 ),),
              Container(
                  
              decoration: BoxDecoration(
                color:
                isMe? Colors.lightBlueAccent:const Color.fromARGB(255, 209, 203, 203),
                borderRadius: isMe? const BorderRadius.only(topLeft: Radius.circular(30),bottomRight: Radius.circular(30),topRight: Radius.circular(30)):const BorderRadius.only(topLeft: Radius.circular(30),bottomRight: Radius.circular(30),bottomLeft: Radius.circular(30))
              ),
              child:
               Padding(
                 padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 20),
                 child: Text("$text ",style: TextStyle(
                  color:isMe? Colors.white:Colors.black,fontSize: 15
                       ),),
               )),
            ],
          ),
        
     );
  }
}
class MessageStream extends StatelessWidget {
  const MessageStream({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(stream:fireStore.collection("messages").snapshots() , builder:(context,snapshot){
           List<MessageBubble>messageBubbles=[];
           if(!snapshot.hasData){
            return const Center(
              child: CircularProgressIndicator(
                backgroundColor: Colors.lightBlueAccent,
              ),
            );
           }
             
                final messages=snapshot.data!.docs.reversed;
                
                for(var message in messages){
                 var datas=message.data()as Map;
    final messageText = datas["text"];
    

final messageSender=message["sender"];
final currentUser=loggedInuser?.email;
if(currentUser==messageSender){

}
final messageBubble=MessageBubble(sender: messageSender, text: messageText,isMe: currentUser==messageSender,

);
messageBubbles.add(messageBubble);
                } 
                     return 
                     Expanded(
                       child: ListView(
                        reverse: true,
                        padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 25),
                       children: messageBubbles.reversed.toList(),
                       
                       
                     ),
                     );
            }
 );
  }
}