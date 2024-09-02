import 'dart:convert';
import 'package:flutter/material.dart';
import 'main_drawer.dart';


class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile>{

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:Text("Profile")
      ),
      drawer: MainDrawer(), //o drawer μου
      body:Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Expanded( 
            child: FutureBuilder(
              future: DefaultAssetBundle //χρησιμοποιω  future για να δηλωσω οτι θα ειναι διαθεσιμο,στο μελλον
                  .of(context)
                  .loadString('data_repo/profile.json'),
              builder: (context, snapshot) { //κραταει ενα snapshot της τωρινης καταστασης του future
                // Decode the JSON
                var loadedData = json.decode(snapshot.data.toString());//το snapshot.data δινει τα δεδομενα του future ,δηλαδη τα data του json αρχειου
                return  Scaffold(
                  body: Container(
                    child:Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Center(
                          child: ClipOval(
                            child:Image.network(loadedData['user']['avatar']),
                          ),
                        ),
                        Center(
                          child: Text( loadedData['user']['displayName']+'\n'+loadedData['user']['dateOfBirth'],
                            style: TextStyle(
                              fontSize: 24,
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              }
            ),
          ),
        ],
      )
      
    );
  }
}