import 'dart:ui';

import 'package:flutter/material.dart';
import '../controllers/apiController.dart';
import 'ui.dart';
import 'dart:io';
import '../modals/datatypes.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  ApiController apiobj = ApiController();
  UI uiobj = UI();

  String loadingString = "";
  int steps = 0;
  HomeData homeData = HomeData(
      order_data: "0",
      total_user: "0",
      total_unseen_order: "0",
      total_unssen_emails: "0");

  @override
  void initState() {
    initSetup();
    // _chackUpdate();
    super.initState();
  }

  bool isDataAvailable = false;
  bool isloading = true;

  Future initSetup() async {
    setState(() {});
    Map<String, dynamic>? homeDataTemp =
        await apiobj.getDataFromServerMap("homeData");
    print(homeDataTemp);
    if (homeDataTemp != null) {
      setState(() {
        homeData = HomeData.fromJson(homeDataTemp);
        isloading = false;
      });
    }
  }

  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text("Woodlands Admin"),
      ),
      drawer: Drawer(
        backgroundColor: Colors.orangeAccent,
        // Add a ListView to the drawer. This ensures the user can scroll
        // through the options in the drawer if there isn't enough vertical
        // space to fit everything.
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,

          children: [
            Container(
              height: 40,
              color: Colors.white,
            ),
            Container(
              height: 210,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/menuheader.png'),
                  fit: BoxFit.cover,
                ),
                // shape: BoxShape.circle,
              ),
            ),

            // Image.asset("assets/sketch.png"),
            ListTile(
              contentPadding: EdgeInsets.only(top: 10, bottom: 10, left: 20),
              title:
                  const Text('Order Reports', style: TextStyle(fontSize: 20)),
              onTap: () {
                // Update the state of the app.
                // ...
                Navigator.pop(context);
                Navigator.pushNamed(context, 'orderReports');
              },
            ),
            ListTile(
              contentPadding: EdgeInsets.only(top: 10, bottom: 10, left: 20),
              title:
                  const Text('Clients Reports', style: TextStyle(fontSize: 20)),
              onTap: () {
                // Update the state of the app.
                // ...
                Navigator.pop(context);
              },
            ),
            ListTile(
              contentPadding: EdgeInsets.only(top: 10, bottom: 10, left: 20),
              title: const Text('System Log', style: TextStyle(fontSize: 20)),
              onTap: () {
                // Update the state of the app.
                // ...
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
      body: Builder(
        builder: (context) {
          final double height = MediaQuery.of(context).size.height;
          return Container(
            height: height,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/vegbackground.jpg'),
                fit: BoxFit.cover,
              ),
              // shape: BoxShape.circle,
            ),
            width: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset("assets/about-us.jpg"),

                SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    uiobj.countCard(
                        title: "Total Order(s)",
                        count: homeData.order_data,
                        loading: isloading,
                        width: (width) / 2),
                    uiobj.countCard(
                        title: "New Order(s)",
                        count: homeData.total_unseen_order,
                        loading: isloading,
                        width: (width) / 2),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    uiobj.countCard(
                        title: "Total Customer(s)",
                        count: homeData.total_user,
                        loading: isloading,
                        width: (width) / 2),
                    uiobj.countCard(
                        title: "Unseen Email(s)",
                        count: homeData.total_unssen_emails,
                        loading: isloading,
                        width: (width) / 2),
                  ],
                ),
                Container(
                  child: Text(loadingString),
                ),
                SizedBox(
                  height: 10,
                ),
                // ElevatedButton(
                //     onPressed: checkUpdateFunction, child: Text("Check Data"))
              ],
            ),
          );
        },
      ),
    );
  }
}
