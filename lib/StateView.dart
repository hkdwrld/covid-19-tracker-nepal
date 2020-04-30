import 'package:covd/loading.dart';
import 'package:flutter/material.dart';
import 'data/Province.dart';
import 'BarGraphBuilder.dart';
import 'CardMaker.dart';

class StateView extends StatefulWidget {
  @override
  _StateViewState createState() => _StateViewState();
}

class _StateViewState extends State<StateView> {
  ProvinceData provinceData;
  ProvinceData data_Province;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setupData();
  }

  setupData() async{
    provinceData=ProvinceData();
    await provinceData.getDataProvince();
    setState(() {
      data_Province=provinceData;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Province Data"),
        ),
        body:Container(
            child: data_Province==null?loading():new ListView.builder(
                itemCount: data_Province.states.length,
                itemBuilder: (BuildContext ctxt, int index) {
                  return listItemBuilder(data_Province.states[index]);
                }
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
          backgroundColor: Colors.blue,
          onPressed: (){
            Navigator.of(context).pushReplacementNamed('/');
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

  Widget listItemBuilder(state){
    return Container(
      margin: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Center(
            child: Text(
                state.name,
              style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color:Colors.blue),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Graph(state),
            ],
          ),
          CardMaker(state),
          SizedBox(height: 20,),
        ],
      ),
    );
  }
}

