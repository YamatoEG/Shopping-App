import 'dart:async';
import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:my_project/home.dart';
import 'package:my_project/login.dart';

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
  bool isFadingOut = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "sign_up",
          style: TextStyle(color: Colors.black, fontSize: 25),
          textAlign: TextAlign.center,
        ).tr(),
        foregroundColor: Colors.blue,
        backgroundColor: Color(0xffB81736),
        surfaceTintColor: Colors.blueGrey,
        shadowColor: Colors.black,
      ),
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(color: Colors.white),
          child: Padding(
            padding: const EdgeInsets.all(7.0),
            child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                        onPressed: () {
                          setState(() {
                            changeLocale();
                          });
                        },
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Color(0xffB81736)),
                        child: context.locale == Locale('en', 'US')
                            ? Text("العربية",
                                style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white))
                            : Text(
                                "English",
                                style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                              )),
                    SizedBox(
                      height: 5,
                    ),
                    Image.asset(
                      'assets/signup.png',
                      height: MediaQuery.of(context).size.height * 0.09,
                      width: MediaQuery.of(context).size.width * 0.17,
                    ),
                    //first Letter is Cap
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        controller: fnameCont,
                        validator: (value) {
                          if (value != null &&
                              value[0] != value[0].toUpperCase()) {
                            return "fnamever".tr();
                          } else {
                            return null;
                          }
                        },
                        decoration: InputDecoration(
                          suffixIcon: Icon(
                            Icons.person,
                          ),
                          label: Text(
                            "full_name".tr(),
                            style: TextStyle(
                                color: Color(0xffB81736),
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        textAlign: TextAlign.start,
                      ),
                    ),
                    //check if the email contains @
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        controller: emailCont,
                        validator: (value) {
                          if (value != null && !value.contains('@')) {
                            return 'emailver'.tr();
                          } else {
                            return null;
                          }
                        },
                        decoration: InputDecoration(
                          suffixIcon: Icon(
                            Icons.email,
                          ),
                          label: Text(
                            "email".tr(),
                            style: TextStyle(
                                color: Color(0xffB81736),
                                fontWeight: FontWeight.bold),
                          ),
                        ),
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
                            return "psverf".tr();
                          } else {
                            return null;
                          }
                        },
                        obscureText: true,
                        decoration: InputDecoration(
                          suffixIcon: Icon(
                            Icons.password,
                          ),
                          label: Text(
                            "password".tr(),
                            style: TextStyle(
                                color: Color(0xffB81736),
                                fontWeight: FontWeight.bold),
                          ),
                        ),
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
                            return "copassver".tr();
                          } else {
                            return null;
                          }
                        },
                        obscureText: true,
                        decoration: InputDecoration(
                          suffixIcon: Icon(
                            Icons.password,
                          ),
                          label: Text(
                            "co_password".tr(),
                            style: TextStyle(
                                color: Color(0xffB81736),
                                fontWeight: FontWeight.bold),
                          ),
                        ),

                        textAlign: TextAlign.start,
                      ),
                    ),
                    SizedBox(
                      height: 60,
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width *
                          0.65, // 65% of screen width
                      height: MediaQuery.of(context).size.height *
                          0.07, // 7% of screen height
                      child: ElevatedButton(
                          onPressed: () async {
                            if (_formKey.currentState!.validate()) {
                              try {
                                final credential = await FirebaseAuth.instance
                                    .createUserWithEmailAndPassword(
                                  email: emailCont.text,
                                  password: passwordCont.text,
                                );
                                if (credential.user != null) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                          content: Text(
                                              "account created successfully!")));
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const LoginScreen()));
                                }
                              } on FirebaseAuthException catch (e) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                        content: Text(
                                            e.message ?? "Unknown error")));
                              } catch (e) {
                                print(e);
                              }
                            }
                          },
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Color(0xffB81736)),
                          child: Text(
                            "sign_up".tr(),
                            style: TextStyle(color: Colors.white),
                          )),
                    )
                  ],
                )),
          ),
        ),
      ),
    );
  }

  Future<void> myDialog() async {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('${'welcome'.tr()}${fnameCont.text}'),
          content: Text("acc_scc_crt").tr(),
          actions: <Widget>[
            TextButton(
              child: const Text('continue').tr(),
              onPressed: () {
                Navigator.of(context).pop();
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const LoginScreen()));
              },
            ),
          ],
        );
      },
    );
  }

  changeLocale() {
    setState(() {
      if (context.locale == Locale('en', 'US')) {
        context.setLocale(Locale('ar', 'EG'));
      } else {
        context.setLocale(Locale('en', 'US'));
      }
    });
  }
}
