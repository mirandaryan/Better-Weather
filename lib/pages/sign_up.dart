import 'package:flutter/material.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    // Build a Form widget using the _formKey created above.
    return Scaffold(
      appBar: AppBar(title: const Text('Sign Up')),
     body: Padding(
       padding: const EdgeInsets.all(16.0),
       child: Form(
         key: _formKey,
         child: Column(
           crossAxisAlignment: CrossAxisAlignment.start,
           children: [
             TextFormField(
               // The validator receives the text that the user has entered.
               decoration: const InputDecoration(
                 border: OutlineInputBorder(),
                 hintText: 'Username',
               ),
               validator: (value) {
                 if (value == null || value.isEmpty) {
                   return 'Please enter some text';
                 }
                 return null;
               },
             ),
             TextFormField(
               // The validator receives the text that the user has entered.
               decoration: const InputDecoration(
                 border: OutlineInputBorder(),
                 hintText: 'Password',
               ),
               validator: (value) {
                 if (value == null || value.isEmpty) {
                   return 'Please enter some text';
                 }
                 return null;
               },
             ),
             ElevatedButton(
               onPressed: () {
                 // Validate returns true if the form is valid, or false otherwise.
                 if (_formKey.currentState!.validate()) {
                   // If the form is valid, display a snackbar. In the real world,
                   // you'd often call a server or save the information in a database.
                   ScaffoldMessenger.of(context).showSnackBar(
                     const SnackBar(content: Text('Processing Data')),
                   );
                 }
               },
               child: const Text('Submit'),
             ),
           ],
         ),
       ),

     ),
    );
  }
}

//https://www.tutorialkart.com/flutter/flutter-login-screen/

