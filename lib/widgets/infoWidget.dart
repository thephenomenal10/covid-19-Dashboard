import 'package:covid19/dataSource.dart';
import 'package:covid19/screens/faqScreen.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../widgets/darkMode.dart' as global ;


class InfoPanel extends StatefulWidget {

    final String btnName, route;

  const InfoPanel({Key key, this.btnName, this.route}) : super(key: key);


  @override
  _InfoPanelState createState() => _InfoPanelState();
}

class _InfoPanelState extends State<InfoPanel> {
  @override
  Widget build(BuildContext context) {
    return Container(

        padding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 10.0),
        margin: EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
        decoration: BoxDecoration(
            color: global.darkMode ? primaryBlack : Colors.white,
            boxShadow:  [
                BoxShadow(color: Colors.grey.shade300, blurRadius: 10.0, offset: Offset(0,10)),
            ],
            borderRadius: BorderRadius.circular(8.0),
        ),
        child: Column(
          children: <Widget>[
            GestureDetector(
                onTap: () {
                   widget.btnName == "FAQ'S" 
                   ? Navigator.push(context, MaterialPageRoute(builder: (context) => FAQScreen()))
                   :launch(widget.route);
                },
              child: Container(
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[

                        Text(widget.btnName,
                        style: new TextStyle(
                            color: global.darkMode ? Colors.white : primaryBlack,
                            fontWeight: FontWeight.bold,
                            fontSize: 20.0),
                        ),
                        Icon(Icons.arrow_forward, color: global.darkMode ? Colors.white : primaryBlack,)
                    ],
                ),
              ),
            ),
          ],
        ),
    );
  }
}
