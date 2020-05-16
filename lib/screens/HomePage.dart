import 'dart:convert';

import 'package:covid19/dataSource.dart';
import 'package:covid19/screens/countryPage.dart';
import 'package:covid19/widgets/MostAffectedCountries.dart';
import 'package:covid19/widgets/WorldWidePannel.dart';
import 'package:covid19/widgets/indiaPannel.dart';
import 'package:covid19/widgets/infoWidget.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../widgets/darkMode.dart' as global;
import 'package:carousel_pro/carousel_pro.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Map worldWideData;

  fetchWorldWideData() async {
    http.Response response = await http.get('https://corona.lmao.ninja/v2/all');
    setState(() {
      worldWideData = json.decode(response.body);
      print(worldWideData);
    });
  }

  List countryData;

  fetchCountryWideData() async {
    http.Response response =
        await http.get('https://corona.lmao.ninja/v2/countries?sort=cases');
    setState(() {
      countryData = json.decode(response.body);
    });
  }

  @override
  void initState() {
    fetchWorldWideData();
    fetchCountryWideData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text("Covid 19 Tracker",  ),
        centerTitle: true,
        brightness:  Brightness.dark,
        actions: <Widget>[
          global.darkMode
          ? GestureDetector(
            onTap: () {

              setState(() {
                global.darkMode = false;
              });
            },
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 10.0),
              child: Icon(
                Icons.brightness_4,
                size: 35.0,
                color: Colors.white
              ),
            ),
          )
              : GestureDetector(
            onTap: () {

              setState(() {
                global.darkMode = true;
              });
            },
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 10.0),
              child: Icon(
                Icons.brightness_4,
                size: 35.0,
                color:  Colors.grey.shade500,
              ),
            ),
          )
        ],
      ),
      backgroundColor: global.darkMode ? primaryBlack : Colors.white,
      body: new SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[

            Container(
              height: 250,
              child: Carousel(
                boxFit: BoxFit.fitWidth,
                dotSize: 4.0,
                dotColor: Colors.white,
                autoplay: true,
                images: [
                  AssetImage("assets/1.jpg"),
                  AssetImage("assets/2.jpg"),
                  AssetImage("assets/3.jpg"),
                  AssetImage("assets/4.png"),
                  AssetImage("assets/5.jpg"),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 10.0, vertical: 20.0),
                  child: new Text(
                    "WorldWide",
                    style: new TextStyle(
                        fontSize: 22.0,
                        fontWeight: FontWeight.bold,
                      color: global.darkMode ? Colors.white : primaryBlack
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => CountryPage()));
                  },
                  child: Container(
                    padding: EdgeInsets.all(10.0),
                    margin: EdgeInsets.all(15.0),
                    decoration: BoxDecoration(
                      color: global.darkMode ? primaryBlack : Colors.white,
                      boxShadow:  [
                        BoxShadow(color: Colors.grey.shade200, blurRadius: 5.0, offset: Offset(0,10)),
                      ],
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: new Text(
                      "Regional",
                      style: new TextStyle(
                          color: global.darkMode ? Colors.white : primaryBlack,
                          fontWeight: FontWeight.bold,
                          fontSize: 16.0),
                    ),
                  ),
                )
              ],
            ),
            worldWideData == null
                ? Center(child: CircularProgressIndicator())
                : WorldWidePanel(
                    worldData: worldWideData,
                  ),

            Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: 10.0, vertical: 20.0),
              child: new Text(
                "India",
                style: new TextStyle(
                    fontSize: 22.0,
                    fontWeight: FontWeight.bold,
                    color: global.darkMode ? Colors.white : primaryBlack
                ),
              ),
            ),
            IndiaStats(),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
              child: new Text(
                "Most Affected Countries",
                style:
                    new TextStyle(fontSize: 22.0,
                        fontWeight: FontWeight.bold,
                      color: global.darkMode ? Colors.white : primaryBlack,
                    ),
              ),
            ),
            countryData == null
                ? Container()
                : MostAffectedPanel(countryData: countryData),

            Divider(
              thickness: 2.0,
              indent: 20.0,
              endIndent: 20.0,
              color: global.darkMode ? Colors.white24 : primaryBlack
            ),
            SizedBox(
              height: 10.0,
            ),
            InfoPanel(
              btnName: "FAQ'S",
              route: "",
            ),
            InfoPanel(
              btnName: "DONATE",
              route: "https://covid19responsefund.org/",
            ),
            InfoPanel(
              btnName: "MYTH BUSTER",
              route:
                  "https://www.who.int/emergencies/diseases/novel-coronavirus-2019/advice-for-public/myth-busters",
            ),
            SizedBox(
              height: 10.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  "WE ARE TOGETHER IN THIS FIGHT",
                  style: new TextStyle(
                      color: global.darkMode ? Colors.white : primaryBlack,
                      fontWeight: FontWeight.bold,
                      fontSize: 25.0),
                ),
              ],
            ),
            SizedBox(
              height: 10.0,
            ),
          ],
        ),
      ),
    );
  }
}
