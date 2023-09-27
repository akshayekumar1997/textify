import 'package:flutter/material.dart';

class EnterPhoneNumberScreen extends StatefulWidget {
  @override
  State<EnterPhoneNumberScreen> createState() => _EnterPhoneNumberScreenState();
}

class _EnterPhoneNumberScreenState extends State<EnterPhoneNumberScreen> {
  final TextEditingController _phoneNumberController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Enter your phone number'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFormField(
              controller: _phoneNumberController,
              keyboardType: TextInputType.phone,
              decoration: InputDecoration(labelText: 'Phone number'),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              child: Text('Submit'),
              onPressed: () {
                // TODO: Submit the phone number
              },
            ),
          ],
        ),
      ),
    );
  }
}
