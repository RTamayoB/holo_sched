import 'package:flutter/material.dart';
import 'vtuber_details.dart';

class BranchList extends StatelessWidget {

  HeroController _heroController = HeroController();

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
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(4.0),
            child: TextField(
              decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.search),
                  hintText: 'Talent Name'),
            ),
          ),
          Expanded(
            child: Navigator(
              observers: [_heroController],
              onGenerateRoute: (RouteSettings settings) {
                return MaterialPageRoute(
                  builder: (_) => VtuberList(),
                );
              },
            ),
          ),
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

class VtuberList extends StatelessWidget {
  //Temporary Vtuber List
  // TODO: Change this list for a firebase or similiar implementation.
  List<ListItem<String>> _kHololiveBranchs = [
    ListItem('HOLO JP'),
    ListItem('HOLOSTARS'),
    ListItem('HOLO ID'),
    ListItem('HOLO EN'),
  ];


  //_kHololiveBranchs = [];
  //_kHololiveBranchs.add(ListItem<String>("HOLO JP"));
  //_kHololiveBranchs.add(ListItem<String>("HOLOSTARS"));
  //_kHololiveBranchs.add(ListItem<String>("HOLO ID"));
  //_kHololiveBranchs.add(ListItem<String>("HOLO EN"));

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [Expanded(
        child: ListView.builder(
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          itemCount: _kHololiveBranchs.length,
          itemBuilder: _vtuberListBuilder,
        ),
      ),
    ]
    );
  }

  Widget _vtuberListBuilder(BuildContext context, int index) {
    return Column(
      children: [
        Hero(
          tag: _kHololiveBranchs[index].data,
          child: Container(
            margin: EdgeInsets.all(4.0),
            decoration: BoxDecoration(
              border: Border.all(width: 2.0, color: Colors.green),
              borderRadius: BorderRadius.all(Radius.circular(10.0)),
              color: Colors.lightGreen,
            ),
            child: ListTile(
              onTap: () {
                // TODO: Display talents from branch
                Navigator.push(context, MaterialPageRoute(builder: (_) {
                  return VtuberNames(_kHololiveBranchs[index].data, context);
                }));
                print('${_kHololiveBranchs[index].data} pressed, displaying talents, visible is ${_kHololiveBranchs[index].isVisible}');
              },
              title: Text(
                '${_kHololiveBranchs[index].data}',
                style: Theme
                    .of(context)
                    .textTheme
                    .headline3,
              ),
              trailing: IconButton(
                icon: Icon(
                  Icons.arrow_drop_down,
                ),
              ),
            ),
          ),
        ),
        Column()
      ],
    );
  }
}

class ListItem<T> {
  bool isVisible = false; //Selection property to highlight or not
  T data; //Data of the user
  ListItem(this.data); //Constructor to assign the data
}

class VtuberNames extends StatelessWidget {
  String branchName;
  BuildContext mainContext;

  VtuberNames(String branch, BuildContext context) {
    this.branchName = branch;
    this.mainContext = context;
  }

  //Mockup data of vtubers for testing
  final List<String> _kVutbers = [
    //Holo ID
    "Ayunda Risu",
    'Moona Hoshinova',
    'Airani Iofifteen',
    'Kureiji Ollie',
    'Anya Melfissa',
    'Pavolia Reine',
    "Ayunda Risu",
    'Moona Hoshinova',
    'Airani Iofifteen',
    'Kureiji Ollie',
    'Anya Melfissa',
    'Pavolia Reine',
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Hero(
          tag: branchName,
          child: Container(
            margin: EdgeInsets.all(4.0),
            decoration: BoxDecoration(
              border: Border.all(width: 2.0, color: Colors.green),
              borderRadius: BorderRadius.all(Radius.circular(10.0)),
              color: Colors.lightGreen,
            ),
            child: ListTile(
              onTap: () {
                // TODO: Display talents from branch
                Navigator.push(context, MaterialPageRoute(builder: (_) {
                  return VtuberList();
                }));
              },
              title: Text(
                branchName,
                style: Theme
                    .of(context)
                    .textTheme
                    .headline3,
              ),
              trailing: IconButton(
                icon: Icon(
                  Icons.arrow_drop_down,
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: ListView.builder(
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              itemCount: _kVutbers.length,
              itemBuilder: (context, index) {
                return Container(
                  decoration: BoxDecoration(
                    border: Border.all(width: 2.0, color: Colors.grey),
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  ),
                  child: ListTile(
                    leading: Image.network('https://yt3.ggpht.com/ytc/AAUvwnhSSaF3Q-PyyTSis4EH6Cu8FZ32LNvkxI9Gl_rn=s88-c-k-c0x00ffffff-no-rj'),
                    title: Text(_kVutbers[index]),
                    trailing: IconButton(icon: Icon(Icons.star_border),),
                    onTap: () {
                      Navigator.of(context, rootNavigator: true).push(
                        MaterialPageRoute(builder: (context) => VtuberDetails()),
                      );
                    },
                  ),
                );
              }),
        ),
      ],
    );
  }
}
