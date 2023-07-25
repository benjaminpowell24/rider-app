import 'package:flutter/material.dart';
import 'package:rider/brand_colors.dart';

class TaxiOnlineButton extends StatelessWidget {

  final String title;
  final Function onPressed;
  final Color color;

  TaxiOnlineButton(this.title, this.onPressed, this.color);

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
        // borderSide: BorderSide(color: color),
        // shape: new RoundedRectangleBorder(
        //   borderRadius: new BorderRadius.circular(25.0),
        // ),
        onPressed: onPressed,
        child: Container(
          height: 38.0,
          child: Center(
            child: Text(title,
            style: TextStyle(fontSize: 15.0, fontFamily: 'Brand-Color', color: BrandColors.colorOrange),),
          ),
        )
    );
  }
}
