import 'package:flutter/material.dart';

void main() {
  runApp(new MaterialApp(
    home: new Container(
      color: Colors.white,
      child: new MyAppHome(),
    ),
  ));
}

class Foo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      primary: true,
      resizeToAvoidBottomInset: false,
      appBar: new AppBar(title: new Text('foo')),
      body: Center(
        child: Hero(
            tag : 'hero',
            child: Image.network(
              'https://picsum.photos/250?image=9',
            ),),
      ),
      floatingActionButton: new FloatingActionButton(
        child: new Icon(Icons.space_bar),
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (_) {
            return Bar();
          }));
        },
      ),
    );
  }
}

class Bar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      primary: true,
      resizeToAvoidBottomInset: false,
      appBar: new AppBar(title: new Text('bar')),
      body: Hero(
          tag: 'hero',
          child: Image.network(
            'https://picsum.photos/250?image=9',
          ),),
    );
  }

}

class MyAppHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      primary: false,
      drawer: new Drawer(
        child: new Center(
            child: new Text('hello')
        ),
      ),
      body: new Navigator(
        onGenerateRoute: (RouteSettings settings) {
          return new MaterialPageRoute(
            builder: (_) => new Foo(),
          );
        },
      ),
    );
  }
}