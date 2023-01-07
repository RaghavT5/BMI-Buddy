import 'package:flutter/material.dart';
import 'package:bmi_buddy/components/reusable_card.dart';
import 'package:bmi_buddy/components/icon_content.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:bmi_buddy/constants.dart';
import 'package:bmi_buddy/screens/results_screen.dart';
import 'package:bmi_buddy/components/bottom_button.dart';
import 'package:bmi_buddy/calculator_brain.dart';

// const bottomContainerHeight = 80.0;
// const activeCardColor = Color(0xFF1D1F33);
// const inactiveCardColor = Color(0xFF111328);
// const bottomContainerColor = Color(0xFFEB1555);

enum Sex { male, female }

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Sex selectedSex = Sex.female;
  int height = 180;
  int weight = 60;
  int age = 20;

  //Replaced with Ternary Operator
  // Color maleCardColor = inactiveCardColor;
  // Color femaleCardColor = inactiveCardColor;
  //
  // void updateColor(Sex selectedSex) {
  //   //male card was pressed
  //   if (selectedSex == Sex.male) {
  //     if (maleCardColor == inactiveCardColor) {
  //       maleCardColor = activeCardColor;
  //       femaleCardColor = inactiveCardColor;
  //     } else {
  //       maleCardColor = inactiveCardColor;
  //     }
  //   }
  //   //female card was pressed
  //   else {
  //     if (femaleCardColor == inactiveCardColor) {
  //       femaleCardColor = activeCardColor;
  //       maleCardColor = inactiveCardColor;
  //     } else {
  //       femaleCardColor = inactiveCardColor;
  //     }
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI Buddy'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: ReusableCard(
                    onPress: () {
                      setState(() {
                        selectedSex = Sex.male;
                      });
                    },
                    cardChild: IconContent(
                      cardIcon: FontAwesomeIcons.mars,
                      cardLabel: 'MALE',
                    ),
                    colour: selectedSex == Sex.male
                        ? kActiveCardColor
                        : kInactiveCardColor,
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    onPress: () {
                      setState(() {
                        selectedSex = Sex.female;
                      });
                    },
                    cardChild: IconContent(
                      cardIcon: FontAwesomeIcons.venus,
                      cardLabel: 'FEMALE',
                    ),
                    colour: selectedSex == Sex.female
                        ? kActiveCardColor
                        : kInactiveCardColor,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ReusableCard(
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'HEIGHT',
                    style: kLabelTextStyle,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: <Widget>[
                      Text(
                        height.toString(),
                        style: kNumberTextStyle,
                      ),
                      Text('cms', style: kLabelTextStyle)
                    ],
                  ),
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      thumbColor: Color(0xFFEB1555),
                      thumbShape:
                          RoundSliderThumbShape(enabledThumbRadius: 15.0),
                      overlayShape: RoundSliderOverlayShape(overlayRadius: 30),
                      activeTrackColor: Colors.white,
                      inactiveTrackColor: Color(0xFF8D8E98),
                      overlayColor: Color(0x31EB1555),
                    ),
                    child: Slider(
                      value: height.toDouble(),
                      onChanged: (double newValue) {
                        setState(() {
                          height = newValue.round();
                        });
                      },
                      min: 60,
                      max: 300,
                    ),
                  )
                ],
              ),
              colour: kActiveCardColor,
              onPress: () {},
            ),
          ),
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: ReusableCard(
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'WEIGHT',
                          style: kLabelTextStyle,
                        ),
                        Text(
                          weight.toString(),
                          style: kNumberTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            RoundIconButton(
                              icon: FontAwesomeIcons.minus,
                              onPressed: () {
                                setState(() {
                                  weight--;
                                });
                              },
                            ),
                            RoundIconButton(
                              icon: FontAwesomeIcons.plus,
                              onPressed: () {
                                setState(() {
                                  weight++;
                                });
                              },
                            )
                          ],
                        )
                      ],
                    ),
                    colour: kActiveCardColor,
                    onPress: () {},
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'AGE',
                          style: kLabelTextStyle,
                        ),
                        Text(
                          age.toString(),
                          style: kNumberTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            RoundIconButton(
                              icon: FontAwesomeIcons.minus,
                              onPressed: () {
                                setState(() {
                                  age--;
                                });
                              },
                            ),
                            RoundIconButton(
                              icon: FontAwesomeIcons.plus,
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
                    colour: kActiveCardColor,
                    onPress: () {},
                  ),
                ),
              ],
            ),
          ),
          BottomButton(
            buttonTitle: 'CALCULATE BMI',
            onTap: () {
              CalculatorBrain calc =
                  CalculatorBrain(height: height, weight: weight);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ResultsPage(
                    bmiResult: calc.calculateBMI(),
                    resultText: calc.getResult(),
                    interpretation: calc.getInterpretation(),
                  ),
                ),
              );
            },
          )
        ],
      ),
    );
  }
}

class RoundIconButton extends StatelessWidget {
  RoundIconButton({required this.icon, required this.onPressed});

  final IconData icon;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: onPressed,
      elevation: 6,
      focusElevation: 6,
      highlightElevation: 12,
      disabledElevation: 6,
      constraints: BoxConstraints.tightFor(
        width: 56.0,
        height: 56.0,
      ),
      shape: CircleBorder(),
      fillColor: Color(0xFF4C4F5E),
      child: Icon(icon),
    );
  }
}
