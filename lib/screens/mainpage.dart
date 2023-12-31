import 'package:flutter/material.dart';
import 'package:rider/brand_colors.dart';
import 'package:rider/tabs/earningstab.dart';
import 'package:rider/tabs/hometab.dart';
import 'package:rider/tabs/pendingorderstab.dart';
import 'package:rider/tabs/profiletab.dart';
import 'package:rider/tabs/ratingstab.dart';

 class MainPage extends StatefulWidget {
   static const String id = 'mainpage';
   @override
   _MainPageState createState() => _MainPageState();
 }

class _MainPageState extends State<MainPage> with SingleTickerProviderStateMixin{

   TabController tabController;
   int selectedIndex = 0;

   void onItemClicked (int index){
     setState(() {
       selectedIndex = index;
       tabController.index = selectedIndex;
     });
   }

   @override
   void initState(){
     super.initState();
     tabController = TabController(length: 3, vsync: this);
   }

   @override
  void dispose() {
    // TODO: implement dispose
     tabController.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: TabBarView(
        physics: NeverScrollableScrollPhysics(),
        controller: tabController,
        children: <Widget>[
          HomeTab(),
          OrderList(),
          IndexPage(),
          // RatingsTab(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          // BottomNavigationBarItem(
          //   icon: Icon(Icons.credit_card),
          //   label: 'Earnings',
          // ),
          BottomNavigationBarItem(
            icon: Icon(Icons.motorcycle),
            label: 'Deliveries',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Account',
          ),
        ],
        currentIndex: selectedIndex,
        unselectedItemColor: BrandColors.colorIcon,
        selectedItemColor: BrandColors.colorOrange,
        showUnselectedLabels: true,
        selectedLabelStyle: TextStyle(fontSize: 12),
        type: BottomNavigationBarType.fixed,
        onTap: onItemClicked,
      ),
    );
  }
}