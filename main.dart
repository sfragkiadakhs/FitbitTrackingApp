import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import './main_drawer.dart';
import './heart_rate.dart';
import './steps.dart';
import './profile.dart';
import './sleep.dart';
void main() {
  runApp(MaterialApp(
    title: "Drawer Menu",
    routes: {
      '/':(context)=>MyApp(),
      '/heart_rate':(context)=>HeartRate(),//route για το heart_rate
      '/steps':(context)=>Steps(), //route για τα steps
      '/profile':(context)=>Profile(), //route για το profil
      '/sleep':(context)=>Sleep(), //route για το sleep
    },));
}


class MyApp extends StatelessWidget {
   Widget myItems(BuildContext context,IconData icon, String heading, Color color,String route) {
    return Material(
      color: Colors.white,
      elevation: 14.0,
      shadowColor: Colors.grey,
      borderRadius: BorderRadius.circular(24.0),
      child:InkWell(
        onTap:(){
          Navigator.of(context).pushNamed(route);
        },
        child: Center(
          child: Padding(
            padding: EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        heading,
                        style: TextStyle(color: color, fontSize: 15.0),
                      ),
                    ),
                    Material(
                      color: color,
                      borderRadius: BorderRadius.circular(24.0),
                      child: Padding(
                        padding: EdgeInsets.all(16.0),
                        child: Icon(
                          icon,
                          color: Colors.white,
                          size:30.0
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      )
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:Text("Dashboard")
      ),
      drawer: MainDrawer(), // καλουμε ενα custom drawer 
      body: StaggeredGridView.count(
          crossAxisCount:2, //ο αριθμος των στηλων που θελουμε να καλυπτει το grid
          crossAxisSpacing:12.0, //η αποσταση μεταξυ των κουτιων στον οριζοντιο αξονα
          mainAxisSpacing:12.0, //η αποσταση μεταξυ των κουτιων στον καθετο αξονα
          padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
          children: [
            myItems(context,Icons.multiline_chart, "Heart Rate", Colors.orange,'/heart_rate'),
            myItems(context,Icons.pie_chart, "Steps", Colors.purple,'/steps'),
            myItems(context,Icons.person, "Me", Colors.blue,'/profile'),
            myItems(context,Icons.bedtime, "Sleep", Colors.green,'/sleep'),
          ],
          staggeredTiles: [
            //οσα αντικειμενα βαλαμε στο children τοσα πρεπει να βαλουμε και εδω
            StaggeredTile.extent(2, 240.0), //η πρωτη παραμετρος λεει ποσες στηλες να καλυπτει το tile/κουτι
            StaggeredTile.extent(1, 240.0), //δευτερη παραμετρος λεει το υψος τους tile/κουτιου
            StaggeredTile.extent(1, 120.0),
            StaggeredTile.extent(1, 120.0),
          ],
        ));
  }
}