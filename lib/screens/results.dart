import 'package:flutter/material.dart';
import 'home_page.dart';
import 'package:bmi_app/constants/constants.dart';
import 'package:bmi_app/widgets/smallCard.dart';

var bmi;

class Results extends StatelessWidget {
  const Results({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: Color(0xFF0A0E21),
        textTheme: TextTheme(
          bodyMedium: TextStyle(color: Colors.white, fontSize: 25),
        ),
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            "BMI CALCULATOR",
            style: TextStyle(color: Colors.white),
          ),
          centerTitle: true,
          backgroundColor: Color(0xFF0A0E21),
        ),
        body: Column(
          //crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              "Your Result",
              textAlign: TextAlign.center,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 50),
            ),
            Expanded(
              child: Row(
                children: [
                  SmallCard(
                    colour: activeCardColor,
                    containerChild: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          "Normal",
                          style: TextStyle(color: Colors.green),
                        ),
                        Text(
                          bmi.toString(),
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 90,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Container(
                width: double.infinity,
                height: 70,
                color: Color(0xFFea1555),
                margin: const EdgeInsets.only(bottom: 30, top: 15),
                child: Center(
                  child: const Text("RE-CALCULATE"),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
