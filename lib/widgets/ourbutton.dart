import 'package:rider/brand_colors.dart';
import 'package:flutter/material.dart';

class OurButton extends StatelessWidget {

  final String title;
  final Color color;
  final Function onPressed;

  OurButton({Key key, this.title, this.color, this.onPressed});

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
        child: Center(
          child: Text(
            title,
            style: TextStyle(fontSize: 18.0, fontFamily: 'Brand-Bold'),
          ),
        ),
      ),
    );
  }
}
