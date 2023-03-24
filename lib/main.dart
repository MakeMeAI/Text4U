import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;
import 'package:text4u/helper/requests.dart' as requests;
import "page2.dart";
import "page1.dart";
import "sidebar.dart";

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
          // App Theme (1)
        primarySwatch: Colors.blue,
        canvasColor: Colors.transparent,
      ),
      home: Nav(),
    );
  }
}

class Nav extends StatefulWidget {
  @override
  _NavState createState() => _NavState();
}

class _NavState extends State<Nav> {
  int _selectedIndex = 0;
  String name = "";
  TextEditingController nameController = TextEditingController();
  PageController _pageController = PageController(initialPage: 0);

  List<Widget> _pageOptions = <Widget>[
    Page1(),
    Page2(),
    Text("Messages"),
  ];

  void _onItemTap(int index) {
    setState(() {
      _selectedIndex = index;
      /*
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => _pageOptions[index]),
      );
       */
      _pageController.animateToPage(index,
          duration: Duration(milliseconds: 300),
          curve: Curves.easeInOut);
    });
  }

  // delete if fails
  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold (
      //drawer: sidebar(),
      extendBodyBehindAppBar: true,
      backgroundColor: Colors.transparent,
      //appBar: AppBar(
        //title: Text("Welcome back, NAME"),
        //backgroundColor: Colors.transparent,
        //elevation: 0,
      //),
      body: Stack (
        children: <Widget> [
          Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Colors.purple,
                  Colors.blue,
                ],
              )
           ),
          ),
          PageView(
            controller: _pageController,
            onPageChanged: (newIndex) {
              setState(() {
                _selectedIndex = newIndex;
              });
            },
            children: [
              Page1(),
              Page2(),
            ],
          ),
        ],
      ),
      extendBody: true,
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.black,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            tooltip: 'Calls',
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.camera),
            tooltip: 'Camera',
            label: "page 2",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.chat),
            tooltip: 'Chats',
            label: "Messages",
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTap,
      ),
    );
  }
}
/* working on --- uncomment if other fails
  @override
  Widget build(BuildContext context) {
    return Scaffold (
      drawer: sidebar(),
      extendBodyBehindAppBar: true,
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        title: Text("Welcome back $name"),
        backgroundColor: const Color(0x4400000000),
        elevation: 0,
      ),
      body: Center (
        child: Stack (
          children: <Widget> [
            Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    Colors.purple,
                    Colors.blue,
                  ],
                ),
              ),
            ),
            Positioned.fill(
              child: Align(
                alignment: Alignment.center,
                child: _pageOptions.elementAt(_selectedIndex),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 0.0),
              child: Align(
                alignment: Alignment.center,
                child: FractionalTranslation(
                  translation: const Offset(0.0, -1.0),
                  child: TextField(
                    cursorColor: Colors.white,
                    controller: nameController,
                    decoration: InputDecoration(
                      labelText: "Name",
                      hintText: "Please Enter Your Name ",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                        borderSide: const BorderSide(
                          color: Colors.white,
                        ),
                      ),
                      labelStyle: const TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    keyboardType: TextInputType.text,
                  ),
                ),
              ),
            ),
            Positioned(
              top: MediaQuery.of(context).size.height / 2 + 50,
              left: MediaQuery.of(context).size.width / 2 - 50,
              child: Text("Name: " + name.toString()),
            ),
            Center(
              child: ElevatedButton(
                onPressed: () async {
                  // setState(() {
                  //   name = nameController.text;
                  // });
                  var response = await requests.postData(nameController.text);
                  var jsonResponse = convert.jsonDecode(response.body);
                  setState(() {
                    name = jsonResponse['name'];
                  });
                },

                child: Text("Submit"),
              ),
            ),
            _pageOptions[_selectedIndex],
            //_pageOptions.elementAt(_selectedIndex),
          ]
        ),
      ),
      extendBody: true,
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Color(0x4400000000),
        elevation: 0,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.black,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            tooltip: 'Calls',
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.camera),
            tooltip: 'Camera',
            label: "page 2",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.chat),
            tooltip: 'Chats',
            label: "Messages",
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTap,
      ),
    );
  }
}