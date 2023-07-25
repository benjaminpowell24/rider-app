import 'package:flutter/material.dart';
import 'package:rider/brand_colors.dart';

class ConfirmSheet extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 15.0,
            spreadRadius: 0.5,
            offset: Offset(
              0.7,
              0.7,
            ),
          )
        ],
      ),
      height: 220,
      child: Column(
        children: <Widget>[

          SizedBox(height: 10,),

          Text(
            'GO ONLINE',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 22, fontFamily: 'Brand-Bold', color: BrandColors.colorText),
          ),

          SizedBox(height: 20,),

          Text(
            'GO ONLINE',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 22, fontFamily: 'Brand-Bold', color: BrandColors.colorText),
          ),

          Row(
            children: <Widget>[],
          )


        ],
      ),
    );
  }
}
