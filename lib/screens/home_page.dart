import 'package:flutter/material.dart';
import 'package:bmi_app/widgets/smallCard.dart';
import 'package:bmi_app/widgets/iconContent.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

const Color activeCardColour = Color(0XFF1D1F33);
const Color inActiveCardColour = Color(0XFF111328);
const Color cardTextColor = Colors.grey;
const Color activeCardColor = Color(0XFF1D1E33);
//slider initial value
double sliderValue = 0;

class homePage extends StatefulWidget {
  const homePage({Key? key}) : super(key: key);

  @override
  State<homePage> createState() => _homePageState();
}

class _homePageState extends State<homePage> {
  Color maleCardColor = inActiveCardColour;
  Color femaleCardColor = inActiveCardColour;
  //1-male2 female
  void changeColor(int gender) {
    if (gender == 1) {
      if (maleCardColor == inActiveCardColour) {
        maleCardColor = activeCardColor;
        femaleCardColor = inActiveCardColour;
      } else {
        maleCardColor = inActiveCardColour;
      }
    }
    if (gender == 2) {
      if (femaleCardColor == inActiveCardColour) {
        femaleCardColor = activeCardColor;
        maleCardColor = inActiveCardColour;
      } else {
        femaleCardColor = inActiveCardColour;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF0A0E21),
        title: Text("BMI CALCULATOR"),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    child: SmallCard(
                      colour: maleCardColor,
                      containerChild: IconContent(
                        iconImage: FontAwesomeIcons.mars,
                        iconText: "MALE",
                      ),
                    ),
                    onTap: () {
                      setState(() {
                        changeColor(1);
                      });
                    },
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    child: SmallCard(
                      colour: femaleCardColor,
                      containerChild: IconContent(
                        iconImage: FontAwesomeIcons.venus,
                        iconText: "FEMALE",
                      ),
                    ),
                    onTap: () {
                      setState(
                        () {
                          changeColor(2);
                        },
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              children: [
                SmallCard(
                  colour: inActiveCardColour,
                  containerChild: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "HEIGHT",
                        style: TextStyle(color: cardTextColor),
                      ),
                      Text(
                        sliderValue.toString(),
                        style: TextStyle(
                            fontSize: 55, fontWeight: FontWeight.bold),
                      ),
                      Slider(
                        value: sliderValue,
                        min: 0,
                        max: 500,
                        divisions: 1,
                        onChanged: (value) {
                          setState(() {
                            sliderValue = value;
                          });
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              children: [
                SmallCard(colour: inActiveCardColour),
                SmallCard(colour: inActiveCardColour),
              ],
            ),
          ),
          Container(
            width: double.infinity,
            height: 70,
            color: Color(0xFFea1555),
            margin: const EdgeInsets.only(top: 15),
            child: Center(
              child: const Text("Calculate"),
            ),
          )
        ],
      ),
    );
  }
}
