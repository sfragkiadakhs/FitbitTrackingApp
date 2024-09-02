import 'package:flutter/material.dart';

class MainDrawer extends StatelessWidget {

  //builder για το ListTile
  Widget buildListTile(String title, IconData icon, Function pageHandler) {
    return ListTile(
      leading: Icon(
        icon,
        size: 26,
      ),
      title: Text(
        title,
        style: TextStyle(
          fontWeight: FontWeight.bold,
        ),
      ),
      onTap: pageHandler,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            height: 130,
            width: double.infinity,
            padding: EdgeInsets.all(20),
            alignment: Alignment.centerLeft,
            color: Colors.indigo, //χρωμα του header του drawer
            // decoration:BoxDecoration(color:Colors.blue), διαφορετικος τροπος να περασουμε χρωμα
            child: Text(
              "Health",
              style: TextStyle(
                fontWeight: FontWeight.w900,
                fontSize: 30,
              ),
            ),
          ),
          buildListTile("Home", Icons.home, () {
            Navigator.of(context).pushNamed('/'); //η συναρτηση που περναμε στον pageHandler
          }),
  
          SizedBox( height: 10), //για να αφησουμε ενα κενο
  
          buildListTile("Heartrate", Icons.local_fire_department, () {
            Navigator.of(context).pushNamed('/heart_rate'); //η συναρτηση που περναμε στον pageHandler
          }),
  
          buildListTile("Steps", Icons.directions_walk, () {
            Navigator.of(context).pushNamed('/steps'); //η συναρτηση που περναμε στον pageHandler
          }),
  
          buildListTile("Sleep", Icons.bedtime, () {
            Navigator.of(context).pushNamed('/sleep'); //η συναρτηση που περναμε στον pageHandler
          }),
  
          buildListTile("Demographics", Icons.person, () {
            Navigator.of(context).pushNamed('/profile'); //η συναρτηση που περναμε στον pageHandler
          }),
        ],
      ),
    );
  }
}
