import 'package:flutter/material.dart';

class InitPage extends StatefulWidget {
  const InitPage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<InitPage> createState() => _InitPageState();
}

class _InitPageState extends State<InitPage> {
  String loadingString = "";
  int steps = 0;
  bool enablebutton = false;
  bool loadingdata = true;

  @override
  void initState() {
    moveToMainScreen();
    super.initState();
  }

  moveToMainScreen() async {
    await Future.delayed(const Duration(seconds: 1));
    print('ready in 2...');
    await Future.delayed(const Duration(seconds: 1));

    print('go!');
    Navigator.pushNamedAndRemoveUntil(
        context, 'home', ModalRoute.withName('home'));
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Builder(
        builder: (context) {
          final double height = MediaQuery.of(context).size.height;
          return Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/splash.png'),
                fit: BoxFit.fill,
              ),
              // shape: BoxShape.circle,
            ),
            width: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                loadingdata
                    ? CircularProgressIndicator()
                    : SizedBox(
                        height: 0,
                      ),
                SizedBox(
                  height: 30,
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
