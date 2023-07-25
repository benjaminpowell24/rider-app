import 'package:flutter/material.dart';
import 'package:rider/theme/colors.dart';


class IndexPage extends StatefulWidget {
  @override
  _IndexPageState createState() => _IndexPageState();
}

class _IndexPageState extends State<IndexPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Listing Orders'),
      ),
      body: getBody(),
    );
  }
  Widget getBody(){
    return ListView.builder(
        itemBuilder: (context, index){
      return getCard();
    });
  }
  Widget getCard(){
    return Card(
      child: ListTile(
        title: Row(
          children: <Widget>[
            Container(
              width: 60,
              height: 60,
              decoration: BoxDecoration(
                color: primary,
                borderRadius: BorderRadius.circular(60/2),
              ),
            )
          ],
        ),
      ),
    );
  }
}
