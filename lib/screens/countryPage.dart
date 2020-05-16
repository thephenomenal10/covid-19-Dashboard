import 'dart:convert';

import 'package:covid19/screens/Search.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../dataSource.dart';
import '../widgets/darkMode.dart' as global;

class CountryPage extends StatefulWidget {
  @override
  _CountryPageState createState() => _CountryPageState();
}

class _CountryPageState extends State<CountryPage> {
  List countryWiseData;

  fetchCountryWideData() async {
    http.Response response =
        await http.get('https://corona.lmao.ninja/v2/countries?sort=cases');
    setState(() {
      countryWiseData = json.decode(response.body);
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    fetchCountryWideData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: new AppBar(
          title: new Text(
            "Country Stats",
            style: TextStyle(color: Colors.white),
          ),
          centerTitle: true,
            actions: <Widget>[
                IconButton(icon: Icon(Icons.search),onPressed: (){

                    showSearch(context: context, delegate: Search(countryWiseData));

                },)
            ],
        ),
        body: countryWiseData == null
            ? Center(child: CircularProgressIndicator())
            : ListView.builder(
                itemBuilder: (context, index) {
                  return Container(
                      height: 130.0,
                      margin: EdgeInsets.symmetric(horizontal: 10.0,vertical: 10.0),
                      decoration: BoxDecoration(
                          color: global.darkMode ? primaryBlack : Colors.white,
                          borderRadius: BorderRadius.circular(10.0),
                          boxShadow:  [
                              BoxShadow(color: Colors.grey.shade400, blurRadius: 10.0, offset: Offset(0,10)),
                          ]
                      ),
                      child: Row(
                          children: <Widget>[
                              Container(
                                  width: 100,
//                                  margin: EdgeInsets.symmetric(horizontal: 10.0),
                                  child: Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: <Widget>[
                                          Text(countryWiseData[index]['country'],
                                              style:  new TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  color: global.darkMode ? Colors.white : primaryBlack,
                                              ),),
                                          Image.network(countryWiseData[index]['countryInfo']['flag'], height: 50.0, width: 60.0,)
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
                                                Text('CONFIRMED: '+ countryWiseData[index]['cases'].toString(),
                                                    style: new TextStyle(color: Colors.blue, fontWeight: FontWeight.bold, fontSize: 20.0),
                                                ),

                                                Text('RECOVERED: '+ countryWiseData[index]['recovered'].toString(),
                                                    style: new TextStyle(color: Colors.grey, fontWeight: FontWeight.bold, fontSize: 20.0),

                                                ),
                                                Text('ACTIVE: '+ countryWiseData[index]['active'].toString(),
                                                    style: new TextStyle(color: Colors.green, fontWeight: FontWeight.bold, fontSize: 20.0),

                                                ),
                                                Text('DEATH: '+ countryWiseData[index]['deaths'].toString(),
                                                    style: new TextStyle(color: Colors.red, fontWeight: FontWeight.bold, fontSize: 20.0),

                                                ),
                                            ],
                                        ),
                                    )
                                ),
                          ],
                      ),
                  );
                },
                itemCount:
                    countryWiseData == null ? 0 : countryWiseData.length));
  }
}
