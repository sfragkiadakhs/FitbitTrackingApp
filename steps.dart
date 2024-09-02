import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import './main_drawer.dart';


class Steps extends StatefulWidget {

@override
_StepsState createState() => _StepsState();
}

class _StepsState extends State<Steps>{

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:Text("Steps/Calories")
      ),
      drawer: MainDrawer(),
      body: Column(

        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Expanded( 
            child: FutureBuilder(
              future: 
                DefaultAssetBundle.of(context).loadString('data_repo/steps.json'),//χρησιμοποιω  future για να δηλωσω οτι θα ειναι διαθεσιμο,στο μελλον
                builder: (context, snapshot) { //κραταει ενα snapshot της τωρινης καταστασης του future
                  // Decode the JSON
                  var loadedData = json.decode(snapshot.data.toString()); //το snapshot.data δινει τα δεδομενα του future ,δηλαδη τα data του json αρχειου
                  return  GroupedBarChart.withSampleData(loadedData);
                }
            ),
          ),
        ],
      ),
    );
  }
    
}



class GroupedBarChart extends StatelessWidget {
  final List<charts.Series> seriesList;
  final bool animate;

  GroupedBarChart(this.seriesList, {this.animate});

  /// Creates a [TimeSeriesChart] with sample data and no transition.
  factory GroupedBarChart.withSampleData(var loadedData) {
    return new GroupedBarChart(
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
      barGroupingType: charts.BarGroupingType.grouped,
    );
  }
  /// Create series list με τα δεδομενα απο το json αρχειο
  static List<charts.Series<StepsInfo, String>> _createSampleData(var loadedData) {
    final stepData = [
      new StepsInfo( loadedData['activities'][0]['startTime'].substring(5, 10), loadedData['activities'][0]['steps']),
      new StepsInfo( loadedData['activities'][1]['startTime'].substring(5, 10), loadedData['activities'][1]['steps']),
      new StepsInfo( loadedData['activities'][2]['startTime'].substring(5, 10), loadedData['activities'][2]['steps']),
      new StepsInfo( loadedData['activities'][3]['startTime'].substring(5, 10), loadedData['activities'][3]['steps']),
      new StepsInfo( loadedData['activities'][4]['startTime'].substring(5, 10), loadedData['activities'][4]['steps']),
      new StepsInfo( loadedData['activities'][5]['startTime'].substring(5, 10), loadedData['activities'][5]['steps']),
      new StepsInfo( loadedData['activities'][6]['startTime'].substring(5, 10), loadedData['activities'][6]['steps']),
    ];

    final calorieData = [
      new StepsInfo( loadedData['activities'][0]['startTime'].substring(5, 10), loadedData['activities'][0]['calories']),
      new StepsInfo( loadedData['activities'][1]['startTime'].substring(5, 10), loadedData['activities'][1]['calories']),
      new StepsInfo( loadedData['activities'][2]['startTime'].substring(5, 10), loadedData['activities'][2]['calories']),
      new StepsInfo( loadedData['activities'][3]['startTime'].substring(5, 10), loadedData['activities'][3]['calories']),
      new StepsInfo( loadedData['activities'][4]['startTime'].substring(5, 10), loadedData['activities'][4]['calories']),
      new StepsInfo( loadedData['activities'][5]['startTime'].substring(5, 10), loadedData['activities'][5]['calories']),
      new StepsInfo( loadedData['activities'][6]['startTime'].substring(5, 10), loadedData['activities'][6]['calories']),
    ];

    return [
      new charts.Series<StepsInfo, String>(
        id: 'Steps',
        fillColorFn: (StepsInfo s, _) => charts.ColorUtil.fromDartColor(Colors.blue),
        domainFn: (StepsInfo sales, _) => sales.startTime,
        measureFn: (StepsInfo sales, _) => sales.info,
        data: stepData,
      ),
      new charts.Series<StepsInfo, String>(
        id: 'Calories',
        fillColorFn: (StepsInfo s, _) => charts.ColorUtil.fromDartColor(Colors.orange[300]),
        domainFn: (StepsInfo sales, _) => sales.startTime,
        measureFn: (StepsInfo sales, _) => sales.info,
        data: calorieData,
      ),
    ];
  }
}
/// Sample linear data type.
class StepsInfo {
  final String startTime;
  final int info;

  StepsInfo(this.startTime, this.info);
}