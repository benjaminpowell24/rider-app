import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:rider/theme/colors.dart';
import 'package:http/http.dart' as http;

import '../OrderDetailsPage.dart';



class IndexPage extends StatefulWidget {
  @override
  _IndexPageState createState() => _IndexPageState();
}

class _IndexPageState extends State<IndexPage> {

  List orders = [];
  bool isLoading = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    this.fetchUser();
  }


  fetchUser() async {
    var url = "https://ext.easyprimemall.com/API/api/orders_read_all_api.php";
    var response = await http.get(url);
    if(response.statusCode == 200){
      var items = json.decode(response.body)['body'];
      setState(() {
        orders = items;
      });
      print(items);
    }else{
      setState(() {
        orders = [];
      });
    }
  }

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
        itemCount: orders.length,
        itemBuilder: (context, index){
      return getCard(orders[index]);
    });
  }

  Widget getCard(index){
    var buyername = index['shipping_name'];
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Card(
        child: ListTile(
          title: Row(
            children: <Widget>[
              Container(
                width: 60,
                height: 60,
                decoration: BoxDecoration(
                  color: primary,
                  borderRadius: BorderRadius.circular(60/2),
                  image: DecorationImage(
                        fit: BoxFit.cover,
                        image:
                          NetworkImage("https://cdn.fastly.picmonkey.com/contentful/h6goo9gw1hh6/2sNZtFAWOdP1lmQ33VwRN3/24e953b920a9cd0ff2e1d587742a2472/1-intro-photo-final.jpg?w=800&q=70"),
                  ),
                ),
              ),
              SizedBox(width: 20,),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(buyername.toString(), style: TextStyle(fontSize: 17),),
                  SizedBox(height: 15,),
                  Text("Winfred Adrah", style: TextStyle(color: Colors.grey),),
                ],
              ),

            ],
          ),
          onTap: (){
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => OrderDetailsPage(buyername.toString()),
              ),
            );
          },
        ),
      ),
    );
  }
}

