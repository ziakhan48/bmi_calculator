import 'package:flutter/material.dart';


class ReusableCard extends StatelessWidget {
  ReusableCard({ this.clr,this.Cardchild});
  final Widget Cardchild;
  final  Color clr;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Cardchild,
      margin: EdgeInsets.all(15.0),
      decoration: BoxDecoration(
          color: clr,
          borderRadius: BorderRadius.circular(12.0)
      ),


    );
  }
}