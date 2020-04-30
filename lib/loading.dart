import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

Widget loading(){
  return Container(
    child: Center(
      child: SpinKitWave(
        color: Colors.blue,
        type: SpinKitWaveType.center,
      ),
    ),
  );
}