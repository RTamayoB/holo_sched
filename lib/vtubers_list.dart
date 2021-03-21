import 'package:flutter/material.dart';
import 'vtuber_details.dart';
import 'test_data.dart';

class Data {
  List<Branch> kHololiveBranches = [
    Branch('holo_jp', 'HOLO JP'),
    Branch('holo_stars', 'HOLOSTARS'),
    Branch('holo_id', 'HOLO ID'),
    Branch('holo_en', 'HOLO EN'),
  ];

  List<Talent> kHololiveTalents = [
    // TODO: Add the rest of the mockup values (opt to already instantiate firebase)
    //HOLO JP
    Talent(
        'sora',
        'Tokino Sora',
        'holo_jp'),
    Talent(
        'roboco',
        'Roboco',
        'holo_jp'),
    Talent(
        'miko',
        'Sakura Miko',
        'holo_jp'),
    Talent(
        'suisei',
        'Hoshimachi Suisei',
        'holo_jp'),
    Talent(
        'azki',
        'AZKi',
        'holo_jp'),
    Talent(
        'mel',
        'Yozora Mel',
        'holo_jp'),
    Talent(
        'fubuki',
        'Shirakami Fubuki',
        'holo_jp'),
    Talent(
        'matsuri',
        'Natsuiro Matsuri',
        'holo_jp'),
    Talent(
        'rosenthal',
        'Aki Rosenthal',
        'holo_jp'),
    Talent(
        'haato',
        'Akai Haato',
        'holo_jp'),
    Talent(
        'aqua',
        'Minato Aqua',
        'holo_jp'),
    Talent(
        'shion',
        'Murasaki Shion',
        'holo_jp'),
    Talent(
        'ayame',
        'Nakiri Ayame',
        'holo_jp'),
    Talent(
        'choco',
        'Yuzuki Choco',
        'holo_jp'),
    Talent(
        'subaru',
        'Oozora Subaru',
        'holo_jp'),
    Talent(
        'mio',
        'Ookami Mio',
        'holo_jp'),
    Talent(
        'okayu',
        'Nekomata Okayu',
        'holo_jp'),
    Talent(
        'korone',
        'Inugami Korone',
        'holo_jp'),
    Talent(
        'pekora',
        'Usada Pekora',
        'holo_jp'),
    Talent(
        'rushia',
        'Uruha Rushia',
        'holo_jp'),
    Talent(
        'flare',
        'Shiranui Flare',
        'holo_jp'),
    Talent(
        'noel',
        'Shirogane Noel',
        'holo_jp'),
    Talent(
        'marine',
        'Houshou Marine',
        'holo_jp'),
    Talent(
        'kanata',
        'Amane Kanata',
        'holo_jp'),
    Talent(
        'coco',
        'Kiryu Coco',
        'holo_jp'),
    Talent(
        'watame',
        'Tsunomaki Watame',
        'holo_jp'),
    Talent(
        'towa',
        'Tokoyami Towa',
        'holo_jp'),
    Talent(
        'luna',
        'Hinemori Luna',
        'holo_jp'),
    Talent(
        'lamy',
        'Yukihana Lamy',
        'holo_jp'),
    Talent(
        'nene',
        'Momosuzu Nene',
        'holo_jp'),
    Talent(
        'botan',
        'Shishiro Botan',
        'holo_jp'),
    Talent(
        'polka',
        'Omaru Polka',
        'holo_jp'),
    //HOLOSTARS
    Talent(
        'miyabi',
        'Hanasaki Miyabi',
        'holo_stars'),
    Talent(
        'izuru',
        'Kanade Izuru',
        'holo_stars'),
    Talent(
        'arurandeisu',
        'Arurandeisu',
        'holo_stars'),
    Talent(
        'rikka',
        'Rikka',
        'holo_stars'),
    Talent(
        'leda',
        'Astel Leda',
        'holo_stars'),
    Talent(
        'temma',
        'Kishido Temma',
        'holo_stars'),
    Talent(
        'roberu',
        'Yukoku Roberu',
        'holo_stars'),
    Talent(
        'shien',
        'Kageyama Shien',
        'holo_stars'),
    Talent(
        'oga',
        'Aragami Oga',
        'holo_stars'),
    //HOLO ID
    Talent(
        'risu',
        'Ayunda Risu',
        'holo_id'),
    Talent(
        'hoshinova',
        'Moona Hoshinova',
        'holo_id'),
    Talent(
        'iofifteen',
        'Airani Iofifteen',
        'holo_id'),
    Talent(
        'ollie',
        'Kureiji Ollie',
        'holo_id'),
    Talent(
        'melfissa',
        'Anya Melfissa',
        'holo_id'),
    Talent(
        'reine',
        'Pavolia Reine',
        'holo_id'),
    //HOLO EN
    Talent(
        'calliope',
        'Mori Calliope',
        'holo_en'),
    Talent(
        'kiara',
        'Takanashi Kiara',
        'holo_en'),
    Talent(
        'inanis',
        "Ninomae Ina'nis",
        'holo_en'),
    Talent(
        'gura',
        'Gawr Gura',
        'holo_en'),
    Talent(
        'amelia',
        'Amelia Watson',
        'holo_en'),
  ];
}

class Search extends SearchDelegate {

  @override
  List<Widget> buildActions(BuildContext context) {
    return <Widget>[
      IconButton(
        icon: Icon(Icons.close),
        onPressed: () {
          query = "";
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: () {
        Navigator.pop(context);
      },
    );
  }

  String selectedResult;

  @override
  Widget buildResults(BuildContext context) {

    List<Talent> suggestionList = [];
    query.isEmpty
        ? suggestionList = recentList
        : suggestionList.addAll(listExample.where(
          (element) => element.mTalentName.toLowerCase().contains(query),
    ));

    return ListView.builder(
      itemCount: suggestionList.length,
      itemBuilder: (context, index) {
        return Container(
          decoration: BoxDecoration(
            border: Border.all(width: 2.0, color: Colors.grey),
            borderRadius: BorderRadius.all(Radius.circular(10.0)),
          ),
          child: ListTile(
            leading: Image.asset('assets/talents/${suggestionList[index].mId}.jpg'),
            title: Text(suggestionList[index].mTalentName),
            trailing: IconButton(
              icon: Icon(Icons.star_border),
            ),
            onTap: () {
              Navigator.of(context, rootNavigator: true).push(
                MaterialPageRoute(builder: (context) => VtuberDetails()),
              );
            },
          ),
        );
      },
    );
  }

  final List<Talent> listExample;
  Search(this.listExample);

  List<Talent> recentList = [Talent('gura', 'Gawr Gura', 'holo_en')];

  @override
  Widget buildSuggestions(BuildContext context) {
    List<Talent> suggestionList = [];
    query.isEmpty
      ? suggestionList = recentList
      : suggestionList.addAll(listExample.where(
        (element) => element.mTalentName.toLowerCase().contains(query),
        ));

    return ListView.builder(
      itemCount: suggestionList.length,
      itemBuilder: (context, index) {
        return Container(
          decoration: BoxDecoration(
            border: Border.all(width: 2.0, color: Colors.grey),
            borderRadius: BorderRadius.all(Radius.circular(10.0)),
          ),
          child: ListTile(
            leading: Image.asset('assets/talents/${suggestionList[index].mId}.jpg'),
            title: Text(suggestionList[index].mTalentName),
            trailing: IconButton(
              icon: Icon(Icons.star_border),
            ),
            onTap: () {
              Navigator.of(context, rootNavigator: true).push(
                MaterialPageRoute(builder: (context) => VtuberDetails()),
              );
            },
          ),
        );
      },
    );
  }
}


class BranchList extends StatefulWidget {
  @override
  _BranchListState createState() => _BranchListState();
}

class _BranchListState extends State<BranchList> {
  HeroController _heroController = HeroController();

  void showSnack() {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('Changed'),
    ));
  }

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
              onTap: () {
                showSearch(context: context, delegate: Search(Data().kHololiveTalents));
              },
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

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Expanded(
        child: ListView.builder(
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          itemCount: Data().kHololiveBranches.length,
          itemBuilder: _vtuberListBuilder,
        ),
      ),
    ]);
  }

  Widget _vtuberListBuilder(BuildContext context, int index) {
    return Column(
      children: [
        Hero(
          tag: Data().kHololiveBranches[index].mId,
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
                  return VtuberNames(Data().kHololiveBranches[index].mId,
                      Data().kHololiveBranches[index].mBranchName, context);
                }));
                print(
                    '${Data().kHololiveBranches[index].mBranchName} pressed, displaying talents, visible is ${Data().kHololiveBranches[index].isVisible}');
              },
              title: Text(
                '${Data().kHololiveBranches[index].mBranchName}',
                style: Theme.of(context).textTheme.headline5,
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

class VtuberNames extends StatelessWidget {
  String branchName;
  String realBranchName;
  BuildContext mainContext;

  VtuberNames(String branch, String realName, BuildContext context) {
    this.branchName = branch;
    this.realBranchName = realName;
    this.mainContext = context;

    _getTalents();
  }

  List<Talent> _kTalentsFromBranch = [];

  void _getTalents() {
    for (Talent talent in Data().kHololiveTalents) {
      if (talent.mBranchId == branchName) {
        _kTalentsFromBranch.add(talent);
      }
    }
  }

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
                realBranchName,
                style: Theme.of(context).textTheme.headline5,
              ),
              trailing: IconButton(
                icon: Icon(
                  Icons.arrow_drop_down,
                ),
              ),
            ),
          ),
        ),
        Text('Tags go here'),
        Expanded(
          child: ListView.builder(
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            itemCount: _kTalentsFromBranch.length,
            itemBuilder: (context, index) {
              return Container(
                decoration: BoxDecoration(
                  border: Border.all(width: 2.0, color: Colors.grey),
                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                ),
                child: ListTile(
                  leading: Image.asset('assets/talents/${_kTalentsFromBranch[index].mId}.jpg'),
                  title: Text(_kTalentsFromBranch[index].mTalentName),
                  trailing: IconButton(
                    icon: Icon(Icons.star_border),
                  ),
                  onTap: () {
                    Navigator.of(context, rootNavigator: true).push(
                      MaterialPageRoute(builder: (context) => VtuberDetails()),
                    );
                  },
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
