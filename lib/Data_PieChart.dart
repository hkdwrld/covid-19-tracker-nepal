import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'data/Country.dart';


List<PieChartSectionData> setupChartData(data,touched_section) {

  int test=data.total_tested;
  int pos=data.total_positive;
  int rec=data.total_recovered;
  int dth=data.total_death;
  int act=pos-(rec+dth);

  PieChartSectionData _item1=PieChartSectionData(
    color: Colors.orangeAccent,
    value: (act/pos)*360,
    title: "Active\n("+act.toString()+")",
    titleStyle: TextStyle(
      color: touched_section==0?Colors.black:Colors.white,
      fontSize: touched_section==0?12:8,
    ),
    radius: touched_section==0?60:40,
    showTitle: act>0?true:false,
  );

  PieChartSectionData _item2=PieChartSectionData(
    color: Colors.blueAccent,
    value: (rec/pos)*360,
    title: "Recovered\n("+rec.toString()+")",
    titleStyle: TextStyle(
      color: touched_section==1?Colors.black:Colors.white,
      fontSize: touched_section==1?12:8,
    ),
    radius: touched_section==1?60:40,
    showTitle: rec>0?true:false,
  );

  PieChartSectionData _item3=PieChartSectionData(
    color: Colors.redAccent,
    value: (dth/pos)*360,
    title: "Deaths\n("+dth.toString()+")",
    titleStyle: TextStyle(
      color: touched_section==2?Colors.black:Colors.white,
      fontSize: touched_section==2?12:8,
    ),
    radius: touched_section==2?60:40,
    showTitle: dth>0?true:false,
  );

  List<PieChartSectionData> _sections=[_item1,_item2,_item3];
  return _sections;
}