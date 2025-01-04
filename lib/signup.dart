import 'dart:async';

import 'package:flutter/material.dart';
import 'package:my_project/home.dart';

class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  TextEditingController fnameCont = TextEditingController();
  TextEditingController emailCont = TextEditingController();
  TextEditingController passwordCont = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Sign up",
          style: TextStyle(color: Colors.black, fontSize: 25),
          textAlign: TextAlign.center,
        ),
        foregroundColor: Colors.blue,
        backgroundColor: Colors.yellow,
        surfaceTintColor: Colors.blueGrey,
        shadowColor: Colors.black,
      ),
      body: SingleChildScrollView(
        child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 5,
                ),
                Image.asset(
                  'assets/signup.png',
                  height: 80,
                  width: 80,
                ),
                //first Letter is Cap
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    controller: fnameCont,
                    validator: (value) {
                      if (value != null && value[0] != value[0].toUpperCase()) {
                        return "Make sure First char is Capitalized";
                      } else {
                        return null;
                      }
                    },
                    decoration: InputDecoration(labelText: "FullName"),
                    textAlign: TextAlign.start,
                  ),
                ),
                //check if the email contains @
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    controller: emailCont,
                    validator: (value) {
                      if (value != null && value.contains('@') == false) {
                        return "Please enter a valid email";
                      } else {
                        return null;
                      }
                    },
                    decoration: InputDecoration(labelText: "Email"),
                    textAlign: TextAlign.start,
                  ),
                ),
                //password >6
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    controller: passwordCont,
                    validator: (value) {
                      if (value != null && value.length < 6) {
                        return "Please enter a strong password";
                      } else {
                        return null;
                      }
                    },
                    obscureText: true,
                    decoration: InputDecoration(labelText: "Password"),
                    textAlign: TextAlign.start,
                  ),
                ),
                //confirm password
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    //controller: passwordCont,
                    validator: (value) {
                      if (value != null && value != passwordCont.text) {
                        return "password not match";
                      } else {
                        return null;
                      }
                    },
                    obscureText: true,
                    decoration: InputDecoration(labelText: "Confirm Password"),
                    textAlign: TextAlign.start,
                  ),
                ),
                ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        myDialog();
                      }
                    },
                    child: Text("Sign Up"))
              ],
            )),
      ),
    );
  }

  Future<void> myDialog() async {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Welcome ${fnameCont.text}'),
          content: Text("account created successfully"),
          actions: <Widget>[
            TextButton(
              child: const Text('Continue'),
              onPressed: () {
                Navigator.of(context).pop();
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const MyHomePage()),
                );
              },
            ),
          ],
        );
      },
    );
  }

  formValdite() {}
}
