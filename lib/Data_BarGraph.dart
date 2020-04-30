import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'data/Country.dart';

List<BarChartGroupData> setupBarGraphData(Country data) {
  int test=data.total_tested;
  int pos=data.total_positive;
  int rec=data.total_recovered;
  int dth=data.total_death;
  int act=pos-(rec+dth);


  BarChartRodData _bar1 = BarChartRodData(
    y: test.toDouble(),
    color: Colors.greenAccent,
    width: 50,
    borderRadius: BorderRadius.circular(1),
  );

  BarChartRodData _bar2 = BarChartRodData(
    y: pos.toDouble(),
    color: Colors.redAccent,
    width: 50,
    borderRadius: BorderRadius.circular(1),
  );

  BarChartRodData _bar3 = BarChartRodData(
    y: rec.toDouble(),
    color: Colors.blueAccent,
    width: 50,
    borderRadius: BorderRadius.circular(1),
  );

  BarChartRodData _bar4 = BarChartRodData(
    y: dth.toDouble(),
    color: Colors.redAccent,
    width: 50,
    borderRadius: BorderRadius.circular(1),
  );

  BarChartGroupData _g1 = BarChartGroupData(
    x: 1,
    barRods: [_bar1],
  );

  BarChartGroupData _g2 = BarChartGroupData(
    x: 2,
    barRods: [_bar2],
  );

  BarChartGroupData _g3 = BarChartGroupData(
    x: 3,
    barRods: [_bar3],
  );

  BarChartGroupData _g4 = BarChartGroupData(
    x: 4,
    barRods: [_bar4],
  );


  List<BarChartGroupData> _bargroups = [_g1, _g2,_g3,_g4];
  return _bargroups;
}