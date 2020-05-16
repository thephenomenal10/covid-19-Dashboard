import 'dart:convert';

import 'package:flutter/material.dart';
import '../dataSource.dart';
import '../widgets/darkMode.dart' as global;
import 'package:http/http.dart' as http;


class IndiaStats extends StatefulWidget {
  @override
  _IndiaStatsState createState() => _IndiaStatsState();
}

class _IndiaStatsState extends State<IndiaStats> {


    Map indiaData;

    fetchCountryData() async {
        http.Response response =
        await http.get('https://corona.lmao.ninja/v2/countries/India');
        setState(() {
            indiaData = json.decode(response.body);
        });
    }

    @override
    void initState() {
        // TODO: implement initState
        fetchCountryData();
        super.initState();
    }


  @override
  Widget build(BuildContext context) {
      return Container(
          height: 250.0,
          margin: EdgeInsets.symmetric(horizontal: 10.0,vertical: 10.0),
          decoration: BoxDecoration(
              color: global.darkMode ? primaryBlack : Colors.white,
              borderRadius: BorderRadius.circular(2.0),
              boxShadow:  [
                  BoxShadow(color: Colors.red.shade200, blurRadius: 20.0, offset: Offset(0,10)),
              ]
          ),

          child: Row(
              children: <Widget>[
                  Container(
                      width: 120,
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                              Text(indiaData['country'].toString(),
                                  style:  new TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: global.darkMode ? Colors.white : primaryBlack,
                                      fontSize: 30.0
                                  ),),
                              Image.network(indiaData['countryInfo']['flag'], height: 90.0, width: 100.0,)
                          ],
                      ),
                  ),
                  SizedBox(width: MediaQuery.of(context).size.width/4,),
                  Expanded(
                      child: Container(
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: <Widget>[
                                  Text('CONFIRMED: '+ indiaData['cases'].toString(),
                                      style: new TextStyle(color: Colors.blue, fontWeight: FontWeight.bold, fontSize: 20.0),
                                  ),

                                  Text('RECOVERED: '+ indiaData['recovered'].toString(),
                                      style: new TextStyle(color: Colors.grey, fontWeight: FontWeight.bold, fontSize: 20.0),

                                  ),
                                  Text('TODAY CASES: '+ indiaData['todayCases'].toString(),
                                      style: new TextStyle(color: Colors.tealAccent.shade200, fontWeight: FontWeight.bold, fontSize: 20.0),

                                  ),
                                  Text('TODAY DEATH: '+ indiaData['todayDeaths'].toString(),
                                      style: new TextStyle(color: Colors.orange, fontWeight: FontWeight.bold, fontSize: 20.0),

                                  ),
                                  Text('ACTIVE: '+ indiaData['active'].toString(),
                                      style: new TextStyle(color: Colors.green, fontWeight: FontWeight.bold, fontSize: 20.0),

                                  ),
                                  Text('DEATH: '+ indiaData['deaths'].toString(),
                                      style: new TextStyle(color: Colors.red, fontWeight: FontWeight.bold, fontSize: 20.0),

                                  ),

                              ],
                          ),
                      )
                  ),
              ],
          ),
      );
  }
}

