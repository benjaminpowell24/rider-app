import 'package:rider/brand_colors.dart';
import 'package:flutter/material.dart';

class AvailabilityButton extends StatelessWidget {

  final String title;
  final Color color;
  final Function onPressed;

  AvailabilityButton({Key key, this.title, this.color, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      onPressed: onPressed,
      shape: new RoundedRectangleBorder(
          borderRadius: new BorderRadius.circular(25)
      ),
      color: color,
      textColor: Colors.white,
      child: Container(
        height: 50.0,
        width: 200.0,
        child: Center(
          child: Text(
            title,
            style: TextStyle(fontSize: 20.0, fontFamily: 'Brand-Bold'),
          ),
        ),
      ),
    );
  }
}
