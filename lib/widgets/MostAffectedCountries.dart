import 'package:flutter/material.dart';
import '../dataSource.dart';
import '../widgets/darkMode.dart' as global;

class MostAffectedPanel extends StatelessWidget {
    final List countryData;

    const MostAffectedPanel({Key key, this.countryData}) : super(key: key);

    @override
    Widget build(BuildContext context) {
        return Container(
            child: ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                    return Container(
                        margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                                Image.network(
                                    countryData[index]['countryInfo']['flag'],
                                    height: 25,
                                ),
                                SizedBox(
                                    width: 10,
                                ),
                                Text(
                                    countryData[index]['country'],
                                    style: TextStyle(fontWeight: FontWeight.bold, color: global.darkMode ? Colors.white : primaryBlack, fontSize: 15.0),
                                ),
                                SizedBox(
                                    width: 10,
                                ),
                                Text(
                                    'Deaths:' + countryData[index]['deaths'].toString(),
                                    style:
                                    TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
                                )
                            ],
                        ),
                    );
                },
                itemCount: 5,
            ),
        );
    }
}