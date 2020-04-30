import 'package:covd/HomePage.dart';
import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'Data_PieChart.dart';
import 'data/Country.dart';
import 'Data_PieChart.dart';

class PieChart_Nepal extends StatefulWidget {
  final Country data;
  const PieChart_Nepal(this.data);

  @override
  _PieChart_NepalState createState() => _PieChart_NepalState();
}

class _PieChart_NepalState extends State<PieChart_Nepal> {
  List<PieChartSectionData> _sections=[];
  dynamic data;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    data=widget.data;
    _sections=setupChartData(data, -1);
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      width: 300,
      child: AspectRatio(
        aspectRatio: 1,
        child: _sections.length>0?PieChart(
            PieChartData(
              sections: _sections,
              centerSpaceRadius: 40,
              borderData: FlBorderData(show: false),
              pieTouchData: PieTouchData(
                  touchCallback: (pieTouchResponse){
                    setState(() {
                      if (pieTouchResponse.touchInput is FlLongPressEnd ||
                          pieTouchResponse.touchInput is FlPanEnd) {
                      }
                      else {
                        int touched_section = pieTouchResponse.touchedSectionIndex;
                        print(touched_section);
                        _sections=setupChartData(data,touched_section);
                      }
                    });
                  }
              ),
            ),
          ):Text("No Data"),
      ),
    );
  }
}

