import 'package:covid19/dataSource.dart';
import 'package:flutter/material.dart';
import '../widgets/darkMode.dart' as global;


class FAQScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

      return Scaffold(
          appBar: AppBar(
              title: new Text("FAQ'S"),
          ),
          backgroundColor: global.darkMode ? primaryBlack : Colors.white,
          body: new ListView.builder(
              shrinkWrap: true,
              itemCount: DataSource.questionAnswers.length,
              itemBuilder: (context, index) {
                    return ExpansionTile(
                        title: Text (DataSource.questionAnswers[index]['question'],
                            style: new TextStyle(
                                fontWeight: FontWeight.bold,
                                color: global.darkMode ? Colors.white : primaryBlack,
                            ),),
                        children: <Widget>[
                            Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Text(DataSource.questionAnswers[index]['answer'],
                                    style: new TextStyle(color: global.darkMode ? Colors.white : primaryBlack,),
                                ),
                            )
                        ],
                    );
              }
          ),
      );
  }
}
