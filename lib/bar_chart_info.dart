import 'package:charts_flutter/flutter.dart' as charts;

/* class for the bar graph
   all data has to be in the format of
   (string, int, color) => (month, # of messages, color)
 */
class BarChartInfo {
  String month;
  int messages;
  final charts.Color color;

  BarChartInfo({
    required this.month,
    required this.messages,
    required this.color,
  });
}