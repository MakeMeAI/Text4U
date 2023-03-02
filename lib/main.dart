import 'package:flutter/material.dart';
import "page2.dart";
import "page1.dart";
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

  PageController _pageController = PageController(initialPage: 0);

  List<Widget> _pageOptions = <Widget>[
    Page1(),
    Page2(),
    Text("Messages"),
  ];

  void _onItemTap(int index) {
    setState(() {
      _selectedIndex = index;
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => _pageOptions[index]),
      );
    });
  }

  // delete if fails
  @override
  Widget build(BuildContext context) {
    return Scaffold (
      drawer: sidebar(),
      extendBodyBehindAppBar: true,
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        title: Text("Welcome back, NAME"),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Stack (
        children: <Widget> [
          Container(
            decoration: BoxDecoration(
                border: Border.all( width: 1, color: Colors.transparent),
                borderRadius: const BorderRadius.all(const Radius.circular(40)),
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    Colors.purple,
                    Colors.deepPurpleAccent,
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
        title: Text("Welcome back, NAME"),
        backgroundColor: Color(0x4400000000),
        elevation: 0,
      ),
      body: Center (
        child: Stack (
          children: <Widget> [
            Container (
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
*/


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