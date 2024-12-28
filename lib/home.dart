import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 217, 213, 213),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 117, 243, 216),
        centerTitle: true,
        title: Text(
          "My First Project",
          style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
              color: const Color.fromARGB(218, 0, 0, 0)),
        ),
      ),
      //adding a Center widget to align the items in center
      body: Center(
        //adding column to place the images in it
        child: Column(
          //make the alignment in center
          mainAxisAlignment: MainAxisAlignment.center,
          //wrapping the children of the column in a row then added the 2 images
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                //adding gap between the images and the appbar
                SizedBox(
                  height: 20,
                ),
                Image.asset(
                  'assets/img.webp',
                  width: 100,
                  height: 100,
                ),
                //adding gap between the 2 images
                SizedBox(
                  width: 20,
                ),
                Image.network("https://picsum.photos/100/100"),
              ],
            ),
            //adding gap between the images and the text
            SizedBox(height: 20),
            Text("The two images are displayed",
                //change the Text style color,font family,font-weight to bold
                style: TextStyle(
                    fontSize: 15,
                    fontFamily: 'Suwannaphum-Regular',
                    fontWeight: FontWeight.bold,
                    color: const Color.fromARGB(255, 74, 18, 1))),
          ],
        ),
      ),
    );
  }
}
