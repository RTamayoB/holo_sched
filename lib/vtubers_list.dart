import 'package:flutter/material.dart';

class VtuberList extends StatelessWidget {

  //Temporary Vtuber List
  final List<String> _kHololiveBranchs = <String> [
    'HOLO JP',
    'HOLOSTARS',
    'HOLO ID',
    'HOLO EN',
  ];

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
          CircleAvatar(
          ),
        ],
      ),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(4.0),
            child: TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.search),
                hintText: 'Talent Name'
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              itemCount: _kHololiveBranchs.length,
              itemBuilder: (context, index) {
                return Container(
                  margin: EdgeInsets.all(4.0),
                  decoration: BoxDecoration(
                    border: Border.all(width: 2.0, color: Colors.green),
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    color: Colors.lightGreen,
                  ),
                  child: ListTile(
                    onTap: () {
                      // TODO: Display talents from branch
                      print('${_kHololiveBranchs[index]} pressed, displaying talents');
                    },
                    title: Text(
                      '${_kHololiveBranchs[index]}',
                      style: Theme.of(context).textTheme.headline3,
                    ),
                    trailing: IconButton(
                      icon: Icon(Icons.arrow_drop_down),
                      onPressed: () {
                        print('${_kHololiveBranchs[index]} dropdown');
                      },
                    ),
                  ),
                );
              },
            ),
          )
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.star),
            label: ''
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: ''
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.settings),
              label: ''
          ),
        ],
        currentIndex: 1,
      ),
    );
  }
}
