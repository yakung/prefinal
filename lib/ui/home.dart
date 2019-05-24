import 'package:final_test/models/user.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  final Todo user;
  Home({Key key, this.user}) : super(key: key);
  @override
  HomeState createState() {
    return new HomeState();
  }
}

class HomeState extends State<Home> {
  int index = 0;

  @override
  Widget build(BuildContext context) {
    Todo user = widget.user;
    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
        centerTitle: true,
        actions: <Widget>[],
      ),
      body: Padding(
        padding: const EdgeInsets.all(130.0),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              Text("Hello ${user.name}"),
              Text("this is my ${user.quaot ?? "should set your quaot"}"),
              Container(
                  margin: const EdgeInsets.only(top: 20),
                  child: RaisedButton(
                    child: Text('PROFILE SETUP'),
                    color: Color(0xff00796b),
                    onPressed: () {},
                  )),
              Container(
                  margin: const EdgeInsets.only(top: 20),
                  child: RaisedButton(
                    child: Text('MY FRIENDS'),
                    color: Color(0xff00796b),
                    onPressed: () {
                    //   Navigator.pushReplacement(
                    //   context,
                    //   MaterialPageRoute(
                    //     builder: (context) => FriendScreen(user: user),
                    //   ),
                    // );
                    },
                  )),
              Container(
                  margin: const EdgeInsets.only(top: 20),
                  child: RaisedButton(
                    child: Text('SIGN OUT'),
                    color: Color(0xff00796b),
                    onPressed: () {},
                  )),
            ]),
      ),
    );
  }
}
