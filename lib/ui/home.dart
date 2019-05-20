import 'package:flutter/material.dart';
import '../models/user.dart';
class TabDemo extends StatefulWidget{
  final Todo user;
  TabDemo({Key key, this.user}) : super(key: key);
  @override
  TabDemoState createState() {
    return new TabDemoState();
  }
}

class TabDemoState extends State<TabDemo> {
  int _currentIndex = 0;
  final List<Widget> _home = [

    Text("data"),
    Text("Notify",style: TextStyle(fontSize: 20)),
    Text("Map",style: TextStyle(fontSize: 20)),
    Text("Profile",style: TextStyle(fontSize: 20)),
    Text("Setup",style: TextStyle(fontSize: 20)),
  ];

  @override
  Widget build(BuildContext context){
    Todo user = widget.user;
      return Scaffold(
        appBar: AppBar(
          title: Text("${user.name}"),

          centerTitle: true,
        ),
        body:Center(
          child: _home[_currentIndex]
        ),
        bottomNavigationBar:new Theme(
            data: Theme.of(context).copyWith(
        // sets the background color of the `BottomNavigationBar`
              canvasColor: Colors.blue,
          ),
        child:BottomNavigationBar(
          currentIndex: _currentIndex,
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.view_compact),
              title: Text("")
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.notifications),
              title: Text("")
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.explore),
              title: Text("")
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              title: Text("")
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.settings),
              title: Text("")
            ),
          ],
          onTap: (int index){
            setState(() {
              _currentIndex = index;
            });
          },
        ),
      ),
      );
  }
}