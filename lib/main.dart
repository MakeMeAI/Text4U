import "dart:convert";

import 'package:flutter/material.dart';
import "page2.dart" as page2;
import "request2.dart";
import "sidebar.dart";

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
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
  List<Widget> _pageOptions = <Widget>[
    Text("Home"),
    Text("Page2"),
    Text("Messages"),
  ];

  void _onItemTap(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
  String url = '';
  var data;
  String output = 'Initial Output';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: sidebar(),
      extendBodyBehindAppBar: true,
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        title: Text("Welcome back, NAME"),
        backgroundColor: Color(0x4400000000),
        elevation: 0,
      ),
      body: Center(
        child: Stack(children: <Widget>[
          Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Colors.purple,
                Colors.blue,
              ],
            )),
          ),
          Positioned.fill(
            child: Align(
              alignment: Alignment.center,
              child: _pageOptions.elementAt(_selectedIndex),
            ),
          ),
          //_pageOptions.elementAt(_selectedIndex),
          TextField(
            onChanged: (value) {
              url = 'http://10.0.2.2:5000/api?query='+value.toString();
          },
          ),
          TextButton(
              onPressed: () async {
                data = await jsonDecode(fetchdata(url));
                setState(() {
                  output = data['output'];

                });
          },
          child: Text('Fetch ASCII Value')),
          Text(output)
        ]),
      ),
      extendBody: true,
      bottomNavigationBar: BottomNavigationBar(
        //currentIndex: 2,
        backgroundColor: Color(0x4400000000),
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


/*
class _NavState extends State<Nav> {
  @override
  Widget build(BuildContext context) {
    return Container(
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
      child: PageView(
      //controller: _controller,
      children: [
        _MyHomePageState(),
         page2.Page2(),
      ],

    ),
    );

  }
}

*/
/*
class _MyHomePageState extends StatefulWidget {
  //FIGURE OUT WHY WRONG
  // void _onItemTapped(int index) {
  //   setState(() {
  //     _selectedIndex = index;
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    // Rerunning build (4)
    return Scaffold(
      drawer: sidebar(),
      extendBodyBehindAppBar: true,
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text("Welcome back, NAME"),
        backgroundColor: Color(0x4400000000),
        elevation: 0,
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Container (
        ),
      ),

      extendBody: true,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0,
        backgroundColor: Color(0x4400000000),
        elevation: 0,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.black,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            tooltip: 'Calls',
            label: "Home",
            //backgroundColor: Colors.blue,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.camera),
            tooltip: 'Camera',
            label: "page 2",
            //backgroundColor: Colors.green,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.chat),
            tooltip: 'Chats',
            label: "page 3",
            //backgroundColor: Colors.red,
          ),
        ],
        //currentIndex: _selectedIndex, ---- add back in - ali
        //ADD BACK
        //onTap: _onItemTapped,
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    throw UnimplementedError();
  }
}
*/