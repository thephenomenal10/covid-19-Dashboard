import 'package:flutter/material.dart';

class StatusPanel extends StatelessWidget {

    final Color panelColor;
    final Color textColor;
    final String title;
    final String count;

  const StatusPanel({Key key, this.panelColor, this.textColor, this.title, this.count}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.all(8),
        height: 80,
        width: MediaQuery.of(context).size.width/2,
        decoration: BoxDecoration(
            color: panelColor,
            borderRadius: BorderRadius.circular(4.0)
        ),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
                new Text(title,
                style: new TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    color: textColor

                ),
                ),
                new Text(count,
                    style: new TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        color: textColor

                    ),
                )
            ],
        ),
    );
  }
}
