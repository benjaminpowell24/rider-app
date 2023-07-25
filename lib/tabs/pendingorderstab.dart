import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class OrderList extends StatefulWidget {
  @override
  _OrderListState createState() => _OrderListState();

}

class _OrderListState extends State<OrderList> {

  Future getUserData() async {
    var response = await http.get(Uri.https('jsonplaceholder.typicode.com', 'users'));
    var jsonData = jsonDecode(response.body);
    List<Item> items = [];

    for(var u in jsonData){
      Item item  = Item(expandedValue: u['expandedValue'], headerValue:  u['headerValue'], isExpanded: false);
      items.add(item);
    }
    print(items.length);
  }

  List<Item> _data = generateItems(10);

  Widget _buildListPanel(){
    return ExpansionPanelList(
      expansionCallback: (int index, bool isExpanded){
        setState(() {
          _data[index].isExpanded = !isExpanded;
        });
      },
      children: _data.map<ExpansionPanel>((Item item){
        return ExpansionPanel(
            headerBuilder: (BuildContext context, bool isExpanded){
              return ListTile(
                title: Text(item.headerValue),
              );
            },
            body: ListTile(
              title: Text(getUserData().toString()),
              subtitle: Text('To Accept this Order, Mark the Order'),
              trailing: Icon(Icons.add_circle_outline),
              onTap: (){
                setState(() {
                  _data.removeWhere((currentItem) => item == currentItem);
                });
              },
            ),
            isExpanded: item.isExpanded
        );
      }).toList(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pending Order List'),
      ),
      body: SingleChildScrollView(
        child: Container(
          child: _buildListPanel(),
        ),
      ),
    );
  }
}



class Item{
  String expandedValue;
  String headerValue;
  bool isExpanded;

  Item({this.expandedValue, this.headerValue, this.isExpanded = false});
}

List<Item> generateItems(int numberOfItems){
  return List.generate(numberOfItems, (index) {
    return Item(
      headerValue: 'Panel $index',
      expandedValue: 'This is Order Number $index',
    );
  });
}