import 'package:covd/CardMaker.dart';
import 'package:flutter/material.dart';
import 'PieChartBuilder.dart';
import 'data/Country.dart';
import 'BarGraphBuilder.dart';
import 'loading.dart';

class HomePage extends StatefulWidget {

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Country nepData;
  Country data_nepal;
  World worldData;
  World data_world;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setupData();
  }

  setupData() async{
    nepData=Country();
    await nepData.getData();
    worldData=World();
    await worldData.getDataWorld();
    setState(() {
      data_nepal=nepData;
      data_world=worldData;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Nepal Covid-19 Tracker"),
        ),
        body: (data_nepal==null&&data_world==null)?loading():SingleChildScrollView(
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    PieChart_Nepal(data_nepal),
                  ],
                ),
                SizedBox(
                  height: 40,
                  child: Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Icon(Icons.keyboard_arrow_up),
                        Text("Nepal"),
                        Icon(Icons.keyboard_arrow_down),
                      ],
                    )
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Graph(data_nepal),
                  ],
                ),

                CardMaker(data_nepal),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text("Rest of the World"),
                    Icon(Icons.arrow_downward),
                  ],
                ),
                //for world data
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    PieChart_Nepal(data_world),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Graph(data_world),
                  ],
                ),
                CardMaker(data_world),
              ],
            ),
        ),
        floatingActionButton: FloatingActionButton(
          child: Tab(
            icon: Container(
              child: Image(
                image: AssetImage(
                  'assets/images/nepFlag.png',
                ),
                fit: BoxFit.cover,
              ),
              height: 35,
              width: 35,
            ),
          ),
          elevation: 20,
          onPressed: (){
            Navigator.of(context).pushReplacementNamed('/state');
          },
        ),

        bottomNavigationBar: BottomAppBar(
          notchMargin: 5,
          shape: CircularNotchedRectangle(),
          color: Colors.blueAccent,
          child: Container(
            height: 50,
          )
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        ),
    );
  }
}

