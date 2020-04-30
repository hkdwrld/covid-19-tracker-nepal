import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'data/Country.dart';
import 'Data_BarGraph.dart';

class Graph extends StatefulWidget {
  final Country data;
  const Graph(this.data);
  @override
  _GraphState createState() => _GraphState();
}

class _GraphState extends State<Graph> {
  List<BarChartGroupData> _bars=[];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _bars=setupBarGraphData(widget.data);
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 300,
      height: 200,
      child: AspectRatio(
        aspectRatio: 1.5,
        child: BarChart(
            BarChartData(
              borderData: FlBorderData(
                border: Border(bottom: BorderSide(color: Colors.black)),
              ),
              alignment: BarChartAlignment.center,
              barGroups: _bars,
              groupsSpace: 16,
              titlesData: FlTitlesData(
                show: true,
                leftTitles: SideTitles(
                  showTitles: false,
                ),
                bottomTitles: SideTitles(
                    showTitles: true,
                  getTitles: (double value){
                    switch(value.toInt()){
                      case 0:
                        return widget.data.total_tested>0?"tested\n"+widget.data.total_tested.toString():" ";

                      case 1:
                        return "positive\n"+widget.data.total_positive.toString();
                      case 2:
                        return "recovered\n"+widget.data.total_recovered.toString();
                      case 3:
                        return "deaths\n"+widget.data.total_death.toString();
                    }
                  }
                ),
              ),
            ),
          ),
        ),
    );
  }
}
