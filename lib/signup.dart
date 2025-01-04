import 'dart:async';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
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
                ElevatedButton(
                    onPressed: () {
                      setState(() {
                        changeLocale();
                      });
                    },
                    child: context.locale == Locale('en', 'US')
                        ? Text("العربية",
                            style: TextStyle(
                                fontSize: 15, fontWeight: FontWeight.bold))
                        : Text(
                            "English",
                            style: TextStyle(
                                fontSize: 15, fontWeight: FontWeight.bold),
                          )),
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
                        return "fnamever".tr();
                      } else {
                        return null;
                      }
                    },
                    decoration: InputDecoration(labelText: "full_name".tr()),
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
                    decoration: InputDecoration(labelText: "email".tr()),
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
                    decoration: InputDecoration(labelText: "password".tr()),
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
                    decoration: InputDecoration(labelText: "co_password".tr()),
                    textAlign: TextAlign.start,
                  ),
                ),
                ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        myDialog();
                      }
                    },
                    child: Text("sign_up".tr()))
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
                      builder: (context) => const MyHomePage()
                          .animate()
                          .fadeIn(duration: Duration(seconds: 3))
                          .shimmer()),
                );
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
