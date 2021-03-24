import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'vtuber_details.dart';


// TODO: Clean code, look into creating a common widget for building talents list
// TODO: Look how to add a sugestion list

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
        stream: FirebaseFirestore.instance
            .collection('talents')
            .orderBy("pos")
            .snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) return new Text('Loading...');

          final results = snapshot.data.docs.where((DocumentSnapshot a) => a
              .data()['talent_name']
              .toString()
              .toLowerCase()
              .contains(query.toLowerCase()));

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
          );
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

  Search();

  Stream<QuerySnapshot> recentList;

  //List<Talent> recentList = [Talent('gura', 'Gawr Gura', 'holo_en')];

  @override
  Widget buildSuggestions(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance
            .collection('talents')
            .orderBy("pos")
            .snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) return new Text('Loading...');

          final results = snapshot.data.docs.where((DocumentSnapshot a) => a
              .data()['talent_name']
              .toString()
              .toLowerCase()
              .contains(query.toLowerCase()));

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
          );
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



class ListScreen extends StatelessWidget {
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
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(4.0),
            child: TextField(
              onTap: () {
                showSearch(context: context, delegate: Search());
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
            stream: FirebaseFirestore.instance
                .collection('branches')
                .orderBy("pos")
                .snapshots(),
            builder: (context, snapshot) {
              if (!snapshot.hasData) return LinearProgressIndicator();
              return ListView(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                children: snapshot.data.docs
                    .map((data) => _branchListBuilder(context, data))
                    .toList(),
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
              border: Border.all(width: 2.0, color: Colors.grey),
              borderRadius: BorderRadius.all(Radius.circular(10.0)),
              color: Colors.blue,
            ),
            child: ListTile(
              onTap: () {
                // TODO: Display talents from branch
                Navigator.push(context, MaterialPageRoute(builder: (_) {
                  return VtuberList(
                      document.id.toString(),
                      document['branch_name'].toString().toUpperCase(),
                      context);
                }));
                print('${document['branch_name']} pressed, displaying talents');
              },
              title: Text(
                document['branch_name'].toString().toUpperCase(),
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

  VtuberList(this.branchName, this.realBranchName, this.mainContext);

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
              border: Border.all(width: 2.0, color: Colors.grey),
              borderRadius: BorderRadius.all(Radius.circular(10.0)),
              color: Colors.blue,
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
        // TODO: Add a builder for the horizontal list of FilterChips
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.all(4.0),
            ),
            FilterChip(
              padding: EdgeInsets.all(4.0),
              label: Text('all'),
              selected: true,
              onSelected: (bool value) {

              },
            ),
            Container(
              padding: EdgeInsets.all(4.0),
            ),
            FilterChip(
              padding: EdgeInsets.all(4.0),
              label: Text('gen 1'),
              onSelected: (bool value) {

              },
            )
          ],
        ),
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
            .orderBy("pos")
            .snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) return LinearProgressIndicator();
          return ListView(
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              children: snapshot.data.docs
                  .map((data) => _buildTalents(context, data))
                  .toList()
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
