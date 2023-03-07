import 'package:bmi_app/calculator_brain.dart';
import 'package:flutter/material.dart';
import 'package:bmi_app/widgets/smallCard.dart';
import 'package:bmi_app/widgets/iconContent.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:bmi_app/constants/constants.dart';
import 'results.dart';
import 'results.dart';

const Color cardTextColor = Colors.grey;
//slider initial value
double sliderValue = 120;
int weight = 60, age = 15;

enum Gender { male, female }

Gender? selectedGender;

class homePage extends StatefulWidget {
  const homePage({Key? key}) : super(key: key);

  @override
  State<homePage> createState() => _homePageState();
}

class _homePageState extends State<homePage> {
  //1-male2 female

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
                      colour: selectedGender == Gender.male
                          ? activeCardColor
                          : inActiveCardColour,
                      containerChild: IconContent(
                        iconImage: FontAwesomeIcons.mars,
                        iconText: "MALE",
                      ),
                    ),
                    onTap: () {
                      setState(() {
                        selectedGender = Gender.male;
                      });
                    },
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    child: SmallCard(
                      colour: selectedGender == Gender.female
                          ? activeCardColor
                          : inActiveCardColour,
                      containerChild: IconContent(
                        iconImage: FontAwesomeIcons.venus,
                        iconText: "FEMALE",
                      ),
                    ),
                    onTap: () {
                      setState(
                        () {
                          selectedGender = Gender.female;
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
                  colour: activeCardColour,
                  containerChild: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "HEIGHT",
                        style: TextStyle(color: cardTextColor),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.baseline,
                        textBaseline: TextBaseline.alphabetic,
                        children: [
                          Text(sliderValue.toString(), style: cardNumberStyle),
                          Text(
                            "cm",
                            style: TextStyle(color: cardTextColor),
                          )
                        ],
                      ),
                      Slider(
                        activeColor: Color(0xFFea1555),
                        value: sliderValue,
                        min: 120,
                        max: 220,
                        divisions: 100,
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
                SmallCard(
                  colour: activeCardColour,
                  containerChild: Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "WEIGHT",
                          style: TextStyle(color: cardTextColor),
                        ),
                        Text(
                          weight.toString(),
                          style: cardNumberStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            FloatingActionButton(
                              onPressed: () {
                                setState(() {
                                  weight--;
                                });
                              },
                              backgroundColor: Color(0xff4c4f5e),
                              child: Icon(
                                Icons.remove,
                                color: Colors.white,
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            FloatingActionButton(
                              onPressed: () {
                                setState(() {
                                  weight++;
                                });
                              },
                              backgroundColor: Color(0xff4c4f5e),
                              child: Icon(
                                Icons.add,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                SmallCard(
                  colour: activeCardColour,
                  containerChild: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "AGE",
                        style: TextStyle(
                          color: Colors.grey,
                        ),
                      ),
                      Text(
                        age.toString(),
                        style: cardNumberStyle,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          FloatingActionButton(
                            onPressed: () {
                              setState(() {
                                age--;
                              });
                            },
                            backgroundColor: Color(0xff4c4f5e),
                            child: Icon(
                              Icons.remove,
                              color: Colors.white,
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          FloatingActionButton(
                            backgroundColor: Color(0xff4c4f5e),
                            child: Icon(
                              Icons.add,
                              color: Colors.white,
                            ),
                            onPressed: () {
                              setState(() {
                                age++;
                              });
                            },
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
          GestureDetector(
            onTap: () {
              CalculatorBrain calc =
                  CalculatorBrain(height: sliderValue, weight: weight);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Results(
                    bmi: calc.calculateBmi(),
                    resultText: calc.getResult(),
                    resultInterpretation: calc.getInterpretation(),
                  ),
                ),
              );
            },
            child: Container(
              width: double.infinity,
              height: 70,
              color: Color(0xFFea1555),
              margin: const EdgeInsets.only(top: 15),
              child: Center(
                child: const Text("CALCULATE"),
              ),
            ),
          )
        ],
      ),
    );
  }
}
