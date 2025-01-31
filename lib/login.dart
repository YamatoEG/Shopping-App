import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:my_project/home.dart';
import 'package:my_project/signup.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(children: [
      Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            gradient:
                LinearGradient(colors: [Color(0xffB81736), Color(0xff281737)])),
        child: Padding(
          padding: const EdgeInsets.only(top: 60.0, left: 20.0),
          child: Text(
            "Hello\nLogin!",
            style: TextStyle(
                fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ),
      ),
      Padding(
        padding: const EdgeInsets.only(top: 200.0),
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(40), topRight: Radius.circular(40))),
          child: Padding(
            padding: const EdgeInsets.only(left: 18.0, right: 18.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextField(
                  controller: emailController,
                  decoration: InputDecoration(
                    suffixIcon: Icon(
                      Icons.email,
                    ),
                    label: Text(
                      "Email",
                      style: TextStyle(
                          color: Color(0xffB81736),
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                TextField(
                  controller: passwordController,
                  obscureText: true,
                  decoration: InputDecoration(
                    suffixIcon: Icon(
                      Icons.visibility_off,
                    ),
                    label: Text(
                      "Password",
                      style: TextStyle(
                          color: Color(0xffB81736),
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                SizedBox(
                  height: 70,
                ),
                InkWell(
                  onTap: () async {
                    try {
                      final credential = await FirebaseAuth.instance
                          .signInWithEmailAndPassword(
                        email: emailController.text,
                        password: passwordController.text,
                      );
                      if (credential.user != null) {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => MyHomePage()
                                    .animate()
                                    .fadeIn(duration: Duration(seconds: 3))
                                    .shimmer()));
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            content: Text("incorrect email/password")));
                      }
                    } on FirebaseAuthException catch (e) {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: Text(e.message ?? "Unknown error")));
                    } catch (e) {
                      print(e);
                    }
                  },
                  child: Container(
                    width: MediaQuery.of(context).size.width *
                        0.65, // 65% of screen width
                    height: MediaQuery.of(context).size.height *
                        0.07, // 7% of screen height
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                            colors: [Color(0xffB81736), Color(0xff281737)]),
                        borderRadius: BorderRadius.circular(30)),
                    child: Center(
                      child: Text(
                        "LOGIN",
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 60,
                ),
                Align(
                  alignment: Alignment.bottomRight,
                  child: Column(
                    children: [
                      Text(
                        "Don't have Account ?",
                        style: TextStyle(fontSize: 15, color: Colors.black87),
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const Signup()),
                          );
                        },
                        child: Text(
                          "Sign Up",
                          style: TextStyle(
                              fontSize: 15,
                              color: Color(0xffB81736),
                              fontWeight: FontWeight.bold),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      )
    ]));
  }
}
