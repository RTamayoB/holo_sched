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
        'https://static.wikia.nocookie.net/virtualyoutuber/images/4/4b/Tokino_Sora_-_Profile_Picture.jpg/revision/latest/scale-to-width-down/100?cb=20201229202429',
        'holo_jp'),
    Talent(
        'roboco',
        'Roboco',
        'https://static.wikia.nocookie.net/virtualyoutuber/images/8/8e/Roboco_-_Profile_Picture.jpg/revision/latest/scale-to-width-down/100?cb=20201212073048',
        'holo_jp'),
    Talent(
        'miko',
        'Sakura Miko',
        'https://static.wikia.nocookie.net/virtualyoutuber/images/5/54/Sakura_Miko_-_Profile_Picture.jpg/revision/latest/scale-to-width-down/100?cb=20201212075631',
        'holo_jp'),
    Talent(
        'suisei',
        'Hoshimachi Suisei',
        'https://static.wikia.nocookie.net/virtualyoutuber/images/6/61/Hoshimachi_Suisei_-_Profile_Picture.png/revision/latest/scale-to-width-down/100?cb=20200825071435',
        'holo_jp'),
    Talent(
        'azki',
        'AZKi',
        'https://static.wikia.nocookie.net/virtualyoutuber/images/b/bd/AZKi_-_Profile_Picture.jpg/revision/latest/scale-to-width-down/100?cb=20210314173744',
        'holo_jp'),
    Talent(
        'mel',
        'Yozora Mel',
        'https://static.wikia.nocookie.net/virtualyoutuber/images/3/3c/Yozora_Mel_-_Profile_Picture.jpg/revision/latest/scale-to-width-down/80?cb=20200516140846',
        'holo_jp'),
    Talent(
        'fubuki',
        'Shirakami Fubuki',
        'https://static.wikia.nocookie.net/virtualyoutuber/images/9/9d/Shirakami_Fubuki_-_Profile_Picture.jpg/revision/latest/scale-to-width-down/80?cb=20210121125758',
        'holo_jp'),
    Talent(
        'matsuri',
        'Natsuiro Matsuri',
        'https://static.wikia.nocookie.net/virtualyoutuber/images/0/04/Natsuiro_Matsuri_-_Profile_Picture.jpg/revision/latest/scale-to-width-down/80?cb=20200516140927',
        'holo_jp'),
    Talent(
        'rosenthal',
        'Aki Rosenthal',
        'https://static.wikia.nocookie.net/virtualyoutuber/images/4/45/Aki_Rosenthal_-_Profile_Picture.jpg/revision/latest/scale-to-width-down/80?cb=20200516141007',
        'holo_jp'),
    Talent(
        'haato',
        'Akai Haato',
        'https://static.wikia.nocookie.net/virtualyoutuber/images/b/b7/Akai_Haato_-_Profile_Picture.jpg/revision/latest/scale-to-width-down/80?cb=20210206203558',
        'holo_jp'),
    Talent(
        'aqua',
        'Minato Aqua',
        'https://static.wikia.nocookie.net/virtualyoutuber/images/5/5a/Minato_Aqua_-_Profile_Picture.jpg/revision/latest/scale-to-width-down/100?cb=20200516143158',
        'holo_jp'),
    Talent(
        'shion',
        'Murasaki Shion',
        'https://static.wikia.nocookie.net/virtualyoutuber/images/4/49/Murasaki_Shion_-_Profile_Picture.jpg/revision/latest/scale-to-width-down/100?cb=20200516143458',
        'holo_jp'),
    Talent(
        'ayame',
        'Nakiri Ayame',
        'https://static.wikia.nocookie.net/virtualyoutuber/images/1/12/Nakiri_Ayame_-_Profile_Picture.jpg/revision/latest/scale-to-width-down/100?cb=20200516143320',
        'holo_jp'),
    Talent(
        'choco',
        'Yuzuki Choco',
        'https://static.wikia.nocookie.net/virtualyoutuber/images/4/41/Yuzuki_Choco_-_Profile_Picture.jpg/revision/latest/scale-to-width-down/100?cb=20210214143026',
        'holo_jp'),
    Talent(
        'subaru',
        'Oozora Subaru',
        'https://static.wikia.nocookie.net/virtualyoutuber/images/c/ce/Oozora_Subaru_-_Profile_Picture.jpg/revision/latest/scale-to-width-down/100?cb=20200516144017',
        'holo_jp'),
    Talent(
        'mio',
        'Ookami Mio',
        'https://static.wikia.nocookie.net/virtualyoutuber/images/4/47/Ookami_Mio_-_Profile_Picture.jpg/revision/latest/scale-to-width-down/100?cb=20210131063047',
        'holo_jp'),
    Talent(
        'okayu',
        'Nekomata Okayu',
        'https://static.wikia.nocookie.net/virtualyoutuber/images/6/60/Nekomata_Okayu_-_Profile_Picture.jpg/revision/latest/scale-to-width-down/100?cb=20210131103324',
        'holo_jp'),
    Talent(
        'korone',
        'Inugami Korone',
        'https://static.wikia.nocookie.net/virtualyoutuber/images/0/03/Inugami_Korone_-_Profile_Picture.jpg/revision/latest/scale-to-width-down/100?cb=20210214143108',
        'holo_jp'),
    Talent(
        'pekora',
        'Usada Pekora',
        'https://static.wikia.nocookie.net/virtualyoutuber/images/a/a7/Usada_Pekora_-_Profile_Picture.jpg/revision/latest/scale-to-width-down/100?cb=20200825070508',
        'holo_jp'),
    Talent(
        'rushia',
        'Uruha Rushia',
        'https://static.wikia.nocookie.net/virtualyoutuber/images/e/ed/Uruha_Rushia_-_Profile_Picture.jpg/revision/latest/scale-to-width-down/100?cb=20200516153214',
        'holo_jp'),
    Talent(
        'flare',
        'Shiranui Flare',
        'https://static.wikia.nocookie.net/virtualyoutuber/images/6/60/Shiranui_Flare_-_Profile_Picture.jpg/revision/latest/scale-to-width-down/100?cb=20200516151223',
        'holo_jp'),
    Talent(
        'noel',
        'Shirogane Noel',
        'https://static.wikia.nocookie.net/virtualyoutuber/images/7/7b/Shirogane_Noel_-_Profile_Picture.jpg/revision/latest/scale-to-width-down/100?cb=20210315012926',
        'holo_jp'),
    Talent(
        'marine',
        'Houshou Marine',
        'https://static.wikia.nocookie.net/virtualyoutuber/images/9/92/Houshou_Marine_-_Profile_Picture.jpg/revision/latest/scale-to-width-down/100?cb=20200825070426',
        'holo_jp'),
    Talent(
        'kanata',
        'Amane Kanata',
        'https://static.wikia.nocookie.net/virtualyoutuber/images/7/75/Amane_Kanata_-_Profile_Picture.jpg/revision/latest/scale-to-width-down/100?cb=20200516155224',
        'holo_jp'),
    Talent(
        'coco',
        'Kiryu Coco',
        'https://static.wikia.nocookie.net/virtualyoutuber/images/e/e5/Kiryu_Coco_-_Profile_Picture.jpg/revision/latest/scale-to-width-down/100?cb=20200909103958',
        'holo_jp'),
    Talent(
        'watame',
        'Tsunomaki Watame',
        'https://static.wikia.nocookie.net/virtualyoutuber/images/5/5f/Tsunomaki_Watame_-_Profile_Picture.jpg/revision/latest/scale-to-width-down/100?cb=20200516155612',
        'holo_jp'),
    Talent(
        'towa',
        'Tokoyami Towa',
        'https://static.wikia.nocookie.net/virtualyoutuber/images/6/64/Tokoyami_Towa_-_Profile_Picture.jpg/revision/latest/scale-to-width-down/100?cb=20200516155509',
        'holo_jp'),
    Talent(
        'luna',
        'Hinemori Luna',
        'https://static.wikia.nocookie.net/virtualyoutuber/images/7/78/Himemori_Luna_-_Profile_Picture.jpg/revision/latest/scale-to-width-down/100?cb=20210224092717',
        'holo_jp'),
    Talent(
        'lamy',
        'Yukihana Lamy',
        'https://static.wikia.nocookie.net/virtualyoutuber/images/2/2e/Yukihana_Lamy_-_Profile_Picture.png/revision/latest/scale-to-width-down/100?cb=20210202183936',
        'holo_jp'),
    Talent(
        'nene',
        'Momosuzu Nene',
        'https://static.wikia.nocookie.net/virtualyoutuber/images/c/c0/Momosuzu_Nene_-_Profile_Picture.png/revision/latest/scale-to-width-down/100?cb=20210211194504',
        'holo_jp'),
    Talent(
        'botan',
        'Shishiro Botan',
        'https://static.wikia.nocookie.net/virtualyoutuber/images/a/ae/Shishiro_Botan_-_Profile_Picture.jpg/revision/latest/scale-to-width-down/100?cb=20210212174643',
        'holo_jp'),
    Talent(
        'polka',
        'Omaru Polka',
        'https://static.wikia.nocookie.net/virtualyoutuber/images/3/36/Omaru_Polka_-_Profile_Picture.jpg/revision/latest/scale-to-width-down/100?cb=20210213032500',
        'holo_jp'),
    //HOLOSTARS
    Talent(
        'miyabi',
        'Hanasaki Miyabi',
        'https://static.wikia.nocookie.net/virtualyoutuber/images/7/77/Hanasaki_Miyabi_-_Profile_Picture.jpg/revision/latest/scale-to-width-down/80?cb=20200815110207',
        'holo_stars'),
    Talent(
        'izuru',
        'Kanade Izuru',
        'https://static.wikia.nocookie.net/virtualyoutuber/images/6/64/Kanade_Izuru_-_Profile_Picture.jpg/revision/latest/scale-to-width-down/80?cb=20200815110241',
        'holo_stars'),
    Talent(
        'arurandeisu',
        'Arurandeisu',
        'https://static.wikia.nocookie.net/virtualyoutuber/images/e/e9/Arurandeisu_-_Profile_Picture.jpg/revision/latest/scale-to-width-down/80?cb=20200815110140',
        'holo_stars'),
    Talent(
        'rikka',
        'Rikka',
        'https://static.wikia.nocookie.net/virtualyoutuber/images/8/8b/Rikka_-_Profile_Picture.jpg/revision/latest/scale-to-width-down/80?cb=20200815110304',
        'holo_stars'),
    Talent(
        'leda',
        'Astel Leda',
        'https://static.wikia.nocookie.net/virtualyoutuber/images/8/88/Astel_Leda_-_Profile_Picture.jpg/revision/latest/scale-to-width-down/130?cb=20200815110151',
        'holo_stars'),
    Talent(
        'temma',
        'Kishido Temma',
        'https://static.wikia.nocookie.net/virtualyoutuber/images/9/9b/Kishido_Temma_-_Profile_Picture.jpg/revision/latest/scale-to-width-down/130?cb=20200815110253',
        'holo_stars'),
    Talent(
        'roberu',
        'Yukoku Roberu',
        'https://static.wikia.nocookie.net/virtualyoutuber/images/8/84/Yukoku_Roberu_-_Profile_Picture.jpg/revision/latest/scale-to-width-down/130?cb=20200815110332',
        'holo_stars'),
    Talent(
        'shien',
        'Kageyama Shien',
        'https://static.wikia.nocookie.net/virtualyoutuber/images/7/70/Kageyama_Shien_-_Profile_Picture.jpg/revision/latest/scale-to-width-down/130?cb=20200905110617',
        'holo_stars'),
    Talent(
        'oga',
        'Aragami Oga',
        'https://static.wikia.nocookie.net/virtualyoutuber/images/2/2a/Aragami_Oga_-_Profile_Picture.jpg/revision/latest/scale-to-width-down/130?cb=20200815110130',
        'holo_stars'),
    //HOLO ID
    Talent(
        'risu',
        'Ayunda Risu',
        'https://static.wikia.nocookie.net/virtualyoutuber/images/a/ae/Ayunda_Risu_-_Profile_Picture.jpg/revision/latest/scale-to-width-down/122?cb=20201221005751',
        'holo_id'),
    Talent(
        'hoshinova',
        'Moona Hoshinova',
        'https://static.wikia.nocookie.net/virtualyoutuber/images/f/ff/Moona_Hoshinova_-_Profile_Picture.jpg/revision/latest/scale-to-width-down/130?cb=20200825072526',
        'holo_id'),
    Talent(
        'iofifteen',
        'Airani Iofifteen',
        'https://static.wikia.nocookie.net/virtualyoutuber/images/a/a3/Airani_Iofifteen_-_Profile_Picture.jpg/revision/latest/scale-to-width-down/130?cb=20200825070402',
        'holo_id'),
    Talent(
        'ollie',
        'Kureiji Ollie',
        'https://static.wikia.nocookie.net/virtualyoutuber/images/5/50/Kureiji_Ollie_-_Profile_Picture.png/revision/latest/scale-to-width-down/130?cb=20210202234906',
        'holo_id'),
    Talent(
        'melfissa',
        'Anya Melfissa',
        'https://static.wikia.nocookie.net/virtualyoutuber/images/a/a9/Anya_Melfissa_-_Profile_Picture.png/revision/latest/scale-to-width-down/130?cb=20210202234950',
        'holo_id'),
    Talent(
        'reine',
        'Pavolia Reine',
        'https://static.wikia.nocookie.net/virtualyoutuber/images/9/96/Pavolia_Reine_-_Profile_Picture.png/revision/latest/scale-to-width-down/130?cb=20210202235102',
        'holo_id'),
    //HOLO EN
    Talent(
        'calliope',
        'Mori Calliope',
        'https://static.wikia.nocookie.net/virtualyoutuber/images/3/30/Mori_Calliope_-_Profile_Picture.jpg/revision/latest/scale-to-width-down/100?cb=20210214142802',
        'holo_en'),
    Talent(
        'kiara',
        'Takanashi Kiara',
        'https://static.wikia.nocookie.net/virtualyoutuber/images/a/a5/Takanashi_Kiara_-_Profile_Picture.jpg/revision/latest/scale-to-width-down/100?cb=20210214142735',
        'holo_en'),
    Talent(
        'inanis',
        "Ninomae Ina'nis",
        'https://static.wikia.nocookie.net/virtualyoutuber/images/5/59/Ninomae_Inanis_-_Profile_Picture.jpg/revision/latest/scale-to-width-down/100?cb=20210214142831',
        'holo_en'),
    Talent(
        'gura',
        'Gawr Gura',
        'https://static.wikia.nocookie.net/virtualyoutuber/images/6/6a/Gawr_Gura_-_Profile_Picture.jpg/revision/latest/scale-to-width-down/100?cb=20210214142856',
        'holo_en'),
    Talent(
        'amelia',
        'Amelia Watson',
        'https://static.wikia.nocookie.net/virtualyoutuber/images/c/c5/Watson_Amelia_-_Profile_Picture.jpg/revision/latest/scale-to-width-down/100?cb=20210214142915',
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
            leading: Image.network(suggestionList[index].mImage),
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

  List<Talent> recentList = [Talent('gura', 'Gawr Gura', 'https://static.wikia.nocookie.net/virtualyoutuber/images/6/6a/Gawr_Gura_-_Profile_Picture.jpg/revision/latest/scale-to-width-down/100?cb=20210214142856', 'holo_en')];

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
            leading: Image.network(suggestionList[index].mImage),
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
                  leading: Image.network(_kTalentsFromBranch[index].mImage),
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
