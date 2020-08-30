import 'package:bmi_flutter/Brain.dart';
import 'package:bmi_flutter/Result_page.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'Icon-Content.dart';
import 'Reusable_Content.dart';
import 'package:bmi_flutter/Result_page.dart';

const activecardcolor = Colors.indigo;
const inactivecolor = Colors.purple;
enum Gender {
  male,
  female,
}

class Calculator extends StatefulWidget {
  @override
  _CalculatorState createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  int height = 180;
  int weight = 60;
  int age=15;
  Gender selectedgender;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text('BMI Calculator'),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedgender = Gender.male;
                      });
                    },
                    child: ReusableCard(
                      clr: selectedgender == Gender.male
                          ? inactivecolor
                          : activecardcolor,
                      Cardchild: Iconcontent(
                        icon: FontAwesomeIcons.mars,
                        label: 'MALE',
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedgender = Gender.female;
                      });
                    },
                    child: ReusableCard(
                      clr: selectedgender == Gender.female
                          ? inactivecolor
                          : activecardcolor,
                      Cardchild: Iconcontent(
                        icon: FontAwesomeIcons.venus,
                        label: 'FEMALE',
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: ReusableCard(
                    clr: Colors.indigo,
                    Cardchild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'HEIGHT',
                          style: TextStyle(fontSize: 25.0),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.baseline,
                          textBaseline: TextBaseline.alphabetic,
                          children: <Widget>[
                            Text(
                              height.toString(),
                              style: TextStyle(
                                  fontSize: 25.0, color: Colors.white),
                            ),
                            Text(
                              'CM',
                              style: TextStyle(
                                  fontSize: 15.0, color: Colors.white),
                            ),
                          ],
                        ),
                        Slider(
                            value: height.toDouble(),
                            min: 100.0,
                            max: 220.0,
                            activeColor: Colors.white,
                            inactiveColor: Colors.grey,
                            onChanged: (double newValue) {
                              setState(() {
                                height = newValue.round();
                              });
                            })
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: GestureDetector(
                    child: ReusableCard(
                      clr: Colors.indigo,
                      Cardchild: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            'WEIGHT',
                            style: TextStyle(fontSize: 25, color: Colors.white),
                          ),
                          Text(
                            weight.toString(),
                            style: TextStyle(fontSize: 25, color: Colors.white),
                          ),

                          Row(
                            mainAxisAlignment: MainAxisAlignment.center ,
                            children: <Widget>[
                              FloatingActionButton(
                                heroTag: "btn1",
                                backgroundColor: Colors.black38,
                                child: Icon(Icons.add),
    onPressed: (){
    setState(() {
    weight++;
    });
    },
                              ),
                              SizedBox(
                                width: 10.0,
                              ),
                              FloatingActionButton(
                                heroTag: "btn3",
                                backgroundColor: Colors.black38,
                                child: Icon(Icons.minimize),
                                onPressed: (){
                                  setState(() {
                                    weight--;
                                  });
                                },
                              ),

                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    child: ReusableCard(
                      clr: Colors.indigo,

                      Cardchild: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            'AGE',
                            style: TextStyle(fontSize: 25, color: Colors.white),
                          ),
                          Text(
                            age.toString(),
                            style: TextStyle(fontSize: 25, color: Colors.white),
                          ),

                          Row(
                            mainAxisAlignment: MainAxisAlignment.center ,
                            children: <Widget>[
                              FloatingActionButton(
                                backgroundColor: Colors.black38,
                                child: Icon(Icons.add),
                                onPressed: (){
                                  setState(() {
                                    age++;
                                  });
                                },
                              ),
                              SizedBox(
                                width: 10.0,
                              ),
                              FloatingActionButton(
                                heroTag: "btn2",
                                backgroundColor: Colors.black38,
                                child: Icon(Icons.minimize),
                                onPressed: (){
                                  setState(() {
                                    age--;
                                  });
                                },
                              ),

                            ],
                          ),
                        ],
                      ),



                    ),
                  ),
                ),
              ],
            ),
          ),
          GestureDetector(

            onTap: (){

              Brain br =Brain(height: height,weight: weight);

              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Resultpage(

                  bmiResult: br.calculateBMI(),
                  resultText: br.getResult(),
                  interpretation: br.interpretation(),

                )),
              );
            },
            child: Container(
                    child:Center(
                     child: Text('CALCULATE',
                     style: TextStyle(fontSize: 25),),
                      ),

              color: Colors.green,
              margin: EdgeInsets.only(top: 10.0),

              width: double.infinity,
              height: 60.0,
            ),
          ),
        ],
      ),
    );
  }
}
