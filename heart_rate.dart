import 'dart:convert';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/material.dart';

import './main_drawer.dart';

class HeartRate extends StatefulWidget {
  @override
  _HeartRateState createState() => _HeartRateState();
}

class _HeartRateState extends State<HeartRate>{

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title:Text("Heartrate")
        ),
        drawer: MainDrawer(),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Expanded( 
              child: FutureBuilder(
                future: DefaultAssetBundle.of(context).loadString('data_repo/heartrate.json'), //χρησιμοποιω  future για να δηλωσω οτι θα ειναι διαθεσιμο,στο μελλον
                builder: (context, snapshot) {  //κραταει ενα snapshot της τωρινης καταστασης του future
                  // Decode the JSON
                  var loadedData = json.decode(snapshot.data.toString()); //το snapshot.data δινει τα δεδομενα του future ,δηλαδη τα data του json αρχειου
                  return  SimpleBarChart.withSampleData(loadedData);
                }
              ),
            ),
          ],
        ),
      );
  }

}

class SimpleBarChart extends StatelessWidget {
  final List<charts.Series> seriesList;
  final bool animate;

  SimpleBarChart(this.seriesList, {this.animate});

  /// Creates a [BarChart] with sample data and no transition.
  factory SimpleBarChart.withSampleData(var loadedData) {
    return new SimpleBarChart(
      _createSampleData(loadedData),
      // Disable animations for image tests.
      animate: false,
    );
  }

  @override
  Widget build(BuildContext context) {
    return new charts.BarChart(
      seriesList,
      animate: animate,
    );
  }

  /// Create series list με τα δεδομενα απο το json αρχειο
  static List<charts.Series<HeartRateInfo, String>> _createSampleData(var loadedData) {
    final heartData = [
      new HeartRateInfo( loadedData['activities-heart'][0]['dateTime'].substring(5, 10), loadedData['activities-heart'][0]['heartRate']),
      new HeartRateInfo( loadedData['activities-heart'][1]['dateTime'].substring(5, 10), loadedData['activities-heart'][1]['heartRate']),
      new HeartRateInfo( loadedData['activities-heart'][2]['dateTime'].substring(5, 10), loadedData['activities-heart'][2]['heartRate']),
      new HeartRateInfo( loadedData['activities-heart'][3]['dateTime'].substring(5, 10), loadedData['activities-heart'][3]['heartRate']),
      new HeartRateInfo( loadedData['activities-heart'][4]['dateTime'].substring(5, 10), loadedData['activities-heart'][4]['heartRate']),
      new HeartRateInfo( loadedData['activities-heart'][5]['dateTime'].substring(5, 10), loadedData['activities-heart'][5]['heartRate']),
      new HeartRateInfo( loadedData['activities-heart'][6]['dateTime'].substring(5, 10), loadedData['activities-heart'][6]['heartRate']),
    ];

    return [
      new charts.Series<HeartRateInfo, String>(
        id: 'Heart rate',
        fillColorFn: (HeartRateInfo s, _) => charts.ColorUtil.fromDartColor(Colors.blueGrey),
        domainFn: (HeartRateInfo sales, _) => sales.dateTime,
        measureFn: (HeartRateInfo sales, _) => sales.pulses,
        data: heartData,
      )
    ];
  }
}
/// Sample HeartRateInfo data type.
class HeartRateInfo {
  final String dateTime;
  final int pulses;

  HeartRateInfo(this.dateTime, this.pulses);
}