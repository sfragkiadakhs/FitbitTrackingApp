import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'main_drawer.dart';


class Sleep extends StatefulWidget {
  @override
  _SleepState createState() => _SleepState();
}

class _SleepState extends State<Sleep>{
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
        title:Text("Sleep")
        ),
        drawer: MainDrawer(),
        body: Column(
          children: <Widget>[
            Expanded(
              child: FutureBuilder(
                future: DefaultAssetBundle.of(context).loadString('data_repo/sleep.json'), //χρησιμοποιω  future για να δηλωσω οτι θα ειναι διαθεσιμο,στο μελλον
                builder: (context, snapshot) { //κραταει ενα snapshot της τωρινης καταστασης του future
                  // Decode the JSON
                  var loadedData = json.decode(snapshot.data.toString());//το snapshot.data δινει τα δεδομενα του future ,δηλαδη τα data του json αρχειου
                  return  StackedAreaLineChart.withSampleData(loadedData);
                }
              ),
            ),
          ],
        ),
      );   
  }
}

class StackedAreaLineChart extends StatelessWidget {
  final List<charts.Series> seriesList;
  final bool animate;

  StackedAreaLineChart(this.seriesList, {this.animate});

  /// Creates a [LineChart] with sample data and no transition.
  factory StackedAreaLineChart.withSampleData(var loadedData) {
    return new StackedAreaLineChart(
      _createSampleData(loadedData),
      // Disable animations for image tests.
      animate: false,
    );
  }

  @override
  Widget build(BuildContext context) {
    return new charts.LineChart(seriesList,
        defaultRenderer:
            new charts.LineRendererConfig(includeArea: true, stacked: true),
        animate: animate);
  }

  /// Create series list με τα δεδομενα απο το json αρχειο
  static List<charts.Series<SleepInfo, int>> _createSampleData(var loadedData) {
    final sleepData = [
      new SleepInfo(1,loadedData['sleep'][0]['timeInBed'] as int ),
      new SleepInfo(2,loadedData['sleep'][1]['timeInBed'] as int ),
      new SleepInfo(3,loadedData['sleep'][2]['timeInBed'] as int ),
      new SleepInfo(4,loadedData['sleep'][3]['timeInBed'] as int ),
      new SleepInfo(5,loadedData['sleep'][4]['timeInBed'] as int ),
      new SleepInfo(6,loadedData['sleep'][5]['timeInBed'] as int ),
      new SleepInfo(7,loadedData['sleep'][6]['timeInBed'] as int )
    ];

    return [
      new charts.Series<SleepInfo, int>(
        id: 'Desktop',
        colorFn: (_, __) => charts.MaterialPalette.blue.shadeDefault,
        domainFn: (SleepInfo sleep, _) => sleep.day,
        measureFn: (SleepInfo sleep, _) => sleep.timeinBed,
        data: sleepData,
      )
    ];
  }
}

/// Sample SleepInfo data type.
class SleepInfo {
  final int day;
  final int timeinBed;
  SleepInfo(this.day, this.timeinBed);
}