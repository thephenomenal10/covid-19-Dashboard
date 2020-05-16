import 'package:flutter/material.dart';

import 'StatusPanel.dart';

class WorldWidePanel extends StatelessWidget {

    final Map worldData;

  const WorldWidePanel({Key key, this.worldData}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Container(
     child: GridView(
         shrinkWrap: true,
         physics: NeverScrollableScrollPhysics(),
         gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, childAspectRatio: 2.0),
             children: <Widget>[
                 StatusPanel(
                     title: "Confirmed",
                     panelColor: Colors.blue.shade100,
                     textColor: Colors.blue,
                     count: worldData['cases'].toString(),
                 ),
                 StatusPanel(
                     title: "Active",
                     panelColor: Colors.green.shade100,
                     textColor: Colors.green,
                     count: worldData['active'].toString(),
                 ),
                 StatusPanel(
                     title: "Death",
                     panelColor: Colors.red.shade100,
                     textColor: Colors.red,
                     count: worldData['deaths'].toString(),
                 ),
                 StatusPanel(
                     title: "Recovered",
                     panelColor: Colors.grey.shade300,
                     textColor: Colors.grey,
                     count: worldData['recovered'].toString(),
                 ),
         ],
     ),
    );
  }
}
