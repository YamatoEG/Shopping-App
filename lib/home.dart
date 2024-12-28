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
      appBar: AppBar(
        title: Center(
          child: Text(
            "Shopping App",
            style: TextStyle(color: Colors.black, fontSize: 20),
          ),
        ),
        backgroundColor: const Color.fromRGBO(3, 125, 246, 1),
        toolbarHeight: 25,
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height -
            AppBar().preferredSize.height -
            MediaQuery.of(context).padding.top,
        child: SingleChildScrollView(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: Text(
                "Our Products",
                style: TextStyle(fontSize: 15),
              ),
            ),
            Container(
              //color: Colors.blueGrey,
              width: MediaQuery.of(context).size.width * 0.9,
              //width: 300,
              height: MediaQuery.of(context).size.height * 0.25,
              child: PageView(
                children: [
                  Image.asset('assets/prod3.webp'),
                  Image.asset('assets/prod2.png'),
                  Image.asset('assets/prod1.png'),
                ],
              ),
            ),
            Container(
              //width: MediaQuery.of(context).size.width * 0.8,
              //width: 300,
              height: MediaQuery.of(context).size.height * 0.3,
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                ),
                itemCount: 2,
                itemBuilder: (BuildContext context, int index) {
                  return Card(
                    child: Column(
                      children: [
                        Image.asset(
                          'assets/prod${index + 1}.png',
                          width: 100,
                          height: 60,
                        ),
                        Text("Product ${index + 1}"),
                        IconButton(
                          icon: Icon(Icons.add_shopping_cart),
                          onPressed: () {
                            final snackBar = SnackBar(
                              content: Text("Item added to cart"),
                            );
                            ScaffoldMessenger.of(context)
                                .showSnackBar(snackBar);
                          },
                        )
                      ],
                    ),
                  );
                },
              ),
            ),
            Container(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "Hot Offers",
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Container(
                    height: 150, // Set a fixed height for the ListView
                    child: ListView.builder(
                      scrollDirection:
                          Axis.horizontal, // Change to horizontal if desired
                      itemCount: 5,
                      itemBuilder: (context, index) {
                        return Container(
                          width: MediaQuery.of(context).size.width * 0.6,
                          child: Image.asset(
                            'assets/pro${index + 1}.png',
                            width: 80,
                            height: 60,
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            )
          ],
        )),
      ),
    );
  }
}
