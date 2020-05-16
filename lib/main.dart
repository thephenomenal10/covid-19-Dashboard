import 'package:covid19/dataSource.dart';
import 'package:covid19/screens/HomePage.dart';
import 'package:flutter/material.dart';

void main () {
    runApp(
        MaterialApp(
            title: "",
            home: Home(),
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
                fontFamily: 'Circular',
                primaryColor: primaryBlack,
            ),
        )
    );
}