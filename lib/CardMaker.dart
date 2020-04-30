import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget CardMaker(data){
  return Container(
    margin: EdgeInsets.symmetric(horizontal: 40,vertical: 30),
    child: Card(
      color: Colors.black12,
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Wrap(
            children: <Widget>[
              data.total_tested==0?SizedBox():Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Icon(Icons.fiber_manual_record,size: 10,),
                  SizedBox(width: 10,),
                  Text("Total Tested"),
                  SizedBox(width: 25,),
                  Text(data.total_tested.toString()),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Icon(Icons.fiber_manual_record,size: 10,),
                  SizedBox(width: 10,),
                  Text("Positive"),
                  SizedBox(width: 50,),
                  Text(data.total_positive.toString(),),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Icon(Icons.fiber_manual_record,size: 10,),
                  SizedBox(width: 10,),
                  Text("Recovered"),
                  SizedBox(width: 35,),
                  Text(data.total_recovered.toString()),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Icon(Icons.fiber_manual_record,size: 10,),
                  SizedBox(width: 10,),
                  Text("Death"),
                  SizedBox(width: 63,),
                  Text(data.total_death.toString()),
                ],
              ),
            ],
          ),
        ),
      ),
    ),
  );
}