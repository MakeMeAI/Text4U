import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'bar_chart_info.dart';

class Page2 extends StatelessWidget {
  Page2({Key? key}) : super(key:key);

  final List<BarChartInfo> data = [
    BarChartInfo(
      month: "Jan",
      messages: 10,
      color: charts.ColorUtil.fromDartColor(Colors.cyanAccent),
    ),
    BarChartInfo(
      month: "Feb",
      messages: 15,
      color: charts.ColorUtil.fromDartColor(Colors.cyanAccent),
    ),
    BarChartInfo(
      month: "Mar",
      messages: 20,
      color: charts.ColorUtil.fromDartColor(Colors.cyanAccent),
    ),
    BarChartInfo(
      month: "Apr",
      messages: 15,
      color: charts.ColorUtil.fromDartColor(Colors.cyanAccent),
    ),
    BarChartInfo(
      month: "May",
      messages: 5,
      color: charts.ColorUtil.fromDartColor(Colors.cyanAccent),
    ),
    BarChartInfo(
      month: "June",
      messages: 30,
      color: charts.ColorUtil.fromDartColor(Colors.cyanAccent),
    ),
    BarChartInfo(
      month: "July",
      messages: 25,
      color: charts.ColorUtil.fromDartColor(Colors.cyanAccent),
    ),
    BarChartInfo(
      month: "Aug",
      messages: 15,
      color: charts.ColorUtil.fromDartColor(Colors.cyanAccent),
    ),
    BarChartInfo(
      month: "Sept",
      messages: 20,
      color: charts.ColorUtil.fromDartColor(Colors.cyanAccent),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    List<charts.Series<BarChartInfo, String>> series = [
      charts.Series(
        id: "stats",
        data: data,
        domainFn: (BarChartInfo series, _) => series.month,
        measureFn: (BarChartInfo series, _) => series.messages,
        colorFn: (BarChartInfo series, _) => series.color,
      ),
    ];



    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        title: Text("Statistic"),
        backgroundColor: Colors.transparent,
        automaticallyImplyLeading: false,
        elevation: 0,
      ),
      body: Container (
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 30),
        child: charts.BarChart(
          series,
          animate: true,
        )
      ),
    );
  }
}