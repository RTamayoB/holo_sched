import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:youtube_api/youtube_api.dart';

class DetailsScreen extends StatefulWidget {
  final String documentId;
  CollectionReference instance;

  DetailsScreen(this.documentId) {
    instance = FirebaseFirestore.instance.collection("talents");
  }

  static String apikey = "AIzaSyAAGYafmHBIAUCj70UtnehUDzCFGJH02WE";

  @override
  _DetailsScreenState createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  final HeroController _heroController = HeroController();

  YoutubeAPI ytAPI = YoutubeAPI(DetailsScreen.apikey, type: 'video');

  List<YT_API> ytResult = [];

  callAPI() async {
    String query = "Memes de Amogus";
    ytResult = await ytAPI.channel("UCoSrY_IQQVpmIRZ9Xf-y93g");
    ytResult = await ytAPI.nextPage();
    setState(() {});
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    callAPI();
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
      body: FutureBuilder(
          future: widget.instance.doc(widget.documentId).get(),
          builder:
              (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
            if (snapshot.hasError) {
              return Text("Something went wrong");
            }

            if (snapshot.connectionState == ConnectionState.done) {
              Map<String, dynamic> data = snapshot.data.data();
              return Column(children: [
                //Talent Data
                Column(
                  children: [
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        SizedBox(
                          width: 10,
                        ),
                        Expanded(
                          flex: 1,
                          child: Hero(
                            tag: snapshot.data.id,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(50.0),
                              child: Image.asset(
                                  'assets/talents/${snapshot.data.id}.jpg'),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Expanded(
                          flex: 2,
                          child: Text(
                            data['talent_name'],
                            style: Theme.of(context).textTheme.headline5,
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: IconButton(
                              icon: Icon(Icons.star_border), onPressed: () {}),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: 10,
                        ),
                        Expanded(
                          child: Text(
                              'Vtuber Description: Lorem Ipsum sjsffddsfdfs dfds fsdfsdd dddddddddddddd ddddd dddd dddddd ddddddd dd dsssssssssssssssssss'),
                        ),
                        Column(
                          children: [
                            Row(
                              children: [
                                Icon(Icons.not_started_outlined),
                                Text('Youtube')
                              ],
                            ),
                            Row(
                              children: [
                                Icon(Icons.not_started_outlined),
                                Text('Twitter')
                              ],
                            ),
                          ],
                        )
                      ],
                    ),
                  ],
                ),
                //Tab Column
                // TODO: Add tab navigation to see archive and live videos
                Column(
                  children: [
                    ListView.builder(
                      shrinkWrap: true,
                      itemCount: ytResult.length,
                      itemBuilder: (_, int index) => listItem(index),
                    ),
                  ],
                ),
              ]);
            }

            return Container();
          }),
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

  Widget listItem(index) {
    return new Card(
      child: new Container(
        margin: EdgeInsets.symmetric(vertical: 7.0),
        padding: EdgeInsets.all(12.0),
        child: new Row(
          children: <Widget>[
            new Image.network(
              ytResult[index].thumbnail['default']['url'],
            ),
            new Padding(padding: EdgeInsets.only(right: 20.0)),
            new Expanded(
                child: new Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                  new Text(
                    ytResult[index].title,
                    softWrap: true,
                    style: TextStyle(fontSize: 18.0),
                  ),
                  new Padding(padding: EdgeInsets.only(bottom: 1.5)),
                ]))
          ],
        ),
      ),
    );
  }
}
