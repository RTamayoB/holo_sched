import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'vtuber_details.dart';

// TODO: Clean code

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
        close(context, null);
        //Navigator.pop(context);
      },
    );
  }

  String selectedResult;

  @override
  Widget buildResults(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance.collection('talents').snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) return new Text('Loading...');

          final results = snapshot.data.docs.where((DocumentSnapshot a) =>
              a.data()['talent_name'].toString().toLowerCase().contains(query.toLowerCase()));

          return ListView(
            children: results
                .map((data) => Container(
                      decoration: BoxDecoration(
                        border: Border.all(width: 2.0, color: Colors.grey),
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      ),
                      child: ListTile(
                        leading: Image.asset('assets/talents/${data.id}.jpg'),
                        title: Text(data.data()['talent_name']),
                        trailing: IconButton(
                          icon: Icon(Icons.star_border),
                          onPressed: () {},
                        ),
                        onTap: () {
                          Navigator.of(context, rootNavigator: true).push(
                            MaterialPageRoute(
                                builder: (context) => VtuberDetails()),
                          );
                        },
                      ),
                    ))
                .toList(),
            /*results.map<Widget>((a) => Text(a.data()['talent_name'])).toList()*/
          );

          Widget buildTalents(BuildContext context, DocumentSnapshot document) {
            return Container(
              decoration: BoxDecoration(
                border: Border.all(width: 2.0, color: Colors.grey),
                borderRadius: BorderRadius.all(Radius.circular(10.0)),
              ),
              child: ListTile(
                leading: Image.asset('assets/talents/${document.id}.jpg'),
                title: Text(document['talent_name']),
                trailing: IconButton(
                  icon: Icon(Icons.star_border),
                  onPressed: () {},
                ),
                onTap: () {
                  Navigator.of(context, rootNavigator: true).push(
                    MaterialPageRoute(builder: (context) => VtuberDetails()),
                  );
                },
              ),
            );
          }
        });
    /*
    Stream<QuerySnapshot> suggestionList;
    //List<Talent> suggestionList = [];
    query.isEmpty
        ? suggestionList = recentList
        : suggestionList.
        : suggestionList.addAll(listExample.where(
            (element) => element.mTalentName.toLowerCase().contains(query),
          ));

    return TalentBuilder();*/
  }

  final Stream<QuerySnapshot> listExample;

  Search(this.listExample);

  Stream<QuerySnapshot> recentList;

  //List<Talent> recentList = [Talent('gura', 'Gawr Gura', 'holo_en')];

  @override
  Widget buildSuggestions(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance.collection('talents').snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) return new Text('Loading...');

          final results = snapshot.data.docs.where((DocumentSnapshot a) =>
              a.data()['talent_name'].toString().toLowerCase().contains(query.toLowerCase()));

          return ListView(
            children: results
                .map((data) => Container(
                      decoration: BoxDecoration(
                        border: Border.all(width: 2.0, color: Colors.grey),
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      ),
                      child: ListTile(
                        leading: Image.asset('assets/talents/${data.id}.jpg'),
                        title: Text(data.data()['talent_name']),
                        trailing: IconButton(
                          icon: Icon(Icons.star_border),
                          onPressed: () {},
                        ),
                        onTap: () {
                          Navigator.of(context, rootNavigator: true).push(
                            MaterialPageRoute(
                                builder: (context) => VtuberDetails()),
                          );
                        },
                      ),
                    ))
                .toList(),
            /*results.map<Widget>((a) => Text(a.data()['talent_name'])).toList()*/
          );

          Widget buildTalents(BuildContext context, DocumentSnapshot document) {
            return Container(
              decoration: BoxDecoration(
                border: Border.all(width: 2.0, color: Colors.grey),
                borderRadius: BorderRadius.all(Radius.circular(10.0)),
              ),
              child: ListTile(
                leading: Image.asset('assets/talents/${document.id}.jpg'),
                title: Text(document['talent_name']),
                trailing: IconButton(
                  icon: Icon(Icons.star_border),
                  onPressed: () {},
                ),
                onTap: () {
                  Navigator.of(context, rootNavigator: true).push(
                    MaterialPageRoute(builder: (context) => VtuberDetails()),
                  );
                },
              ),
            );
          }
        });

    /*
    List<Talent> suggestionList = [];
    query.isEmpty
        ? suggestionList = recentList
        : suggestionList.addAll(listExample.where(
            (element) => element.mTalentName.toLowerCase().contains(query),
          ));

    return TalentBuilder();*/
  }
}

class ListScreen extends StatefulWidget {
  @override
  _ListScreenState createState() => _ListScreenState();
}

class _ListScreenState extends State<ListScreen> {
  HeroController _heroController = HeroController();

  var d = FirebaseFirestore.instance.collection('talents').snapshots();

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
                showSearch(context: context, delegate: Search(d));
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
                  builder: (_) => BranchList(),
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

class BranchList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Expanded(
        child: StreamBuilder<QuerySnapshot>(
            stream:
                FirebaseFirestore.instance.collection('branches').snapshots(),
            builder: (context, snapshot) {
              if (!snapshot.hasData) return LinearProgressIndicator();
              return ListView(
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  children: snapshot.data.docs
                      .map((data) => _branchListBuilder(context, data))
                      .toList()
                  //itemCount: snapshot.data.docs,
                  //itemBuilder: (context, index) => _branchListBuilder(context, snapshot.data.documents[index]),
                  );
            }),
      ),
    ]);
  }

  Widget _branchListBuilder(BuildContext context, DocumentSnapshot document) {
    return Column(
      children: [
        Hero(
          tag: document.id,
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
                  return VtuberList(
                      document.id, document['branch_name'], context, document);
                }));
                print('${document['branch_name']} pressed, displaying talents');
              },
              title: Text(
                document['branch_name'],
                style: Theme.of(context).textTheme.headline5,
              ),
              trailing: Icon(
                Icons.arrow_drop_down,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class VtuberList extends StatefulWidget {
  final String branchName;
  final String realBranchName;
  final BuildContext mainContext;
  final DocumentSnapshot document;

  VtuberList(
      this.branchName, this.realBranchName, this.mainContext, this.document);

  @override
  _VtuberListState createState() => _VtuberListState();
}

class _VtuberListState extends State<VtuberList> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Hero(
          tag: widget.branchName,
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
                  return BranchList();
                }));
              },
              title: Text(
                widget.realBranchName,
                style: Theme.of(context).textTheme.headline5,
              ),
              trailing: Icon(
                Icons.arrow_drop_down,
              ),
            ),
          ),
        ),
        Text('Tags go here'),
        Expanded(
          child: TalentBuilder(widget.branchName),
        ),
      ],
    );
  }
}

class TalentBuilder extends StatelessWidget {
  final String branchName;

  TalentBuilder(this.branchName);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance
            .collection('talents')
            .where("branch_id", isEqualTo: branchName)
            .orderBy("gen_id")
            .snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) return LinearProgressIndicator();
          return ListView(
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              children: snapshot.data.docs
                  .map((data) => _buildTalents(context, data))
                  .toList()
              //itemCount: snapshot.data.docs,
              //itemBuilder: (context, index) => _branchListBuilder(context, snapshot.data.documents[index]),
              );
        });
  }

  Widget _buildTalents(BuildContext context, DocumentSnapshot document) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(width: 2.0, color: Colors.grey),
        borderRadius: BorderRadius.all(Radius.circular(10.0)),
      ),
      child: ListTile(
        leading: Image.asset('assets/talents/${document.id}.jpg'),
        title: Text(document['talent_name']),
        trailing: IconButton(
          icon: Icon(Icons.star_border),
          onPressed: () {},
        ),
        onTap: () {
          Navigator.of(context, rootNavigator: true).push(
            MaterialPageRoute(builder: (context) => VtuberDetails()),
          );
        },
      ),
    );
  }
}
