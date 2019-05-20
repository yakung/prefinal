import 'package:flutter/material.dart';


class Home extends StatefulWidget {
  @override
  HomeState createState() {
    return new HomeState();
  }
}

class HomeState extends State<Home> {
  int index = 0;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
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
              Text("Hello FIRSTNAME LASTNAME"),
              Text("this is my quote today is my day"),
              Container(
                  margin: const EdgeInsets.only(top: 20),
                  child: RaisedButton(
                    child: Text('PROFILE SETUP'),
                    color: Theme.of(context).accentColor,
                    splashColor: Colors.blue,
                    onPressed: () {},
                  )),
              Container(
                  margin: const EdgeInsets.only(top: 20),
                  child: RaisedButton(
                    child: Text('MY FRIENDS'),
                    color: Theme.of(context).accentColor,
                    splashColor: Colors.blue,
                    onPressed: () {},
                  )),
              Container(
                  margin: const EdgeInsets.only(top: 20),
                  child: RaisedButton(
                    child: Text('SIGN OUT'),
                    color: Theme.of(context).accentColor,
                    splashColor: Colors.blue,
                    onPressed: () {},
                  )),
            ]),
      ),
    );
  }
}
