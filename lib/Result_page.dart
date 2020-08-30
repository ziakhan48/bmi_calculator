import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:bmi_flutter/Reusable_Content.dart';

class Resultpage extends StatelessWidget {
  Resultpage({@required this.bmiResult,@required this.interpretation,@required this.resultText});

  final String bmiResult;
  final String interpretation;
  final String resultText;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),

      ),body: Column(
         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Expanded(

          child: Container(
padding: EdgeInsets.all(15),
alignment: Alignment.center,
color: Colors.white,
            child: Text(
              'Your Result',style: TextStyle(fontSize: 40.0,color: Colors.black),
            ),
          ),
        ),
        Expanded(
          flex: 6,
          child: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text(resultText
                    ,style: TextStyle(fontSize: 40.0,color: Colors.white),),

                   Text(
                    bmiResult
                     ,style: TextStyle(fontSize: 40.0,color: Colors.white),
                  ),


                  Text(interpretation,
                    style: TextStyle(fontSize: 30.0,color: Colors.black),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            color: Colors.black38,
          ),




        ),
        GestureDetector(
          onTap: (){
            Navigator.pop(context);
              
    },
            
            
          
          child: Container(

            child:Center(

              child: Text('RE-CALCULATE',

                style: TextStyle(fontSize: 25),
              ),
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
