import 'package:flutter/material.dart';

class DetailsScreen extends StatelessWidget {
  final HeroController _heroController = HeroController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('HoloSched'),
        leading: IconButton(
          icon: Icon(Icons.menu),
          tooltip: 'Menu Icon',
          onPressed: () {
            print('Icon Menu pressed');
          },
        ),
        actions: [
          CircleAvatar(),
        ],
      ),
      // TODO: Add body with detail page
      body: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(50.0),
            child: Image.asset('assets/talents/gura.jpg'),
          ),
          Text(
            'Gawr Gura',
            style: Theme.of(context).textTheme.headline5,
          ),
          IconButton(
              icon: Icon(Icons.star_border),
              onPressed: () {

          }
          )
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.star), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.home), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.settings), label: ''),
        ],
        currentIndex: 1,
      ),
    );
  }
}