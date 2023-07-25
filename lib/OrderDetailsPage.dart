import 'package:flutter/material.dart';
import 'package:rider/pages/index.dart';

class OrderDetailsPage extends StatelessWidget {

  final String buyername;

  OrderDetailsPage(this.buyername);

  @override
  Widget build(BuildContext context) {
    // Use the Todo to create the UI.
    return Scaffold(
      appBar: AppBar(
        title: Text("Order Detail"),
      ),
      body: Column(
        children: [
          Text("$buyername"),
          ElevatedButton(
          )
        ]
      ),
    );
  }
}