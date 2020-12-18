import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutternetworking/screens/MainScreen.dart';

class SplashScreen extends StatefulWidget {

  final Color backgroundColor = Colors.white;

  final TextStyle styleTextUnderTheLoader = TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold, color: Colors.black);

  @override
  _SplashScreenState createState() => _SplashScreenState();

}

class _SplashScreenState extends State<SplashScreen> with TickerProviderStateMixin {

  String _versionName = 'V1.0';
  final splashDelay = 5;

  AnimationController _controller;
  Animation<double> _animation;

  @override
  void initState() {
    super.initState();

    _loadWidget();

    _controller = AnimationController(
      duration: const Duration(seconds: 4),
      vsync: this,
    )..repeat(reverse: true);
    _animation = CurvedAnimation(
      parent: _controller,
      curve: Curves.fastOutSlowIn,
    );

  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  _loadWidget() async {
    var _duration = Duration(seconds: splashDelay);
    return Timer(_duration, navigationPage);
  }

  void navigationPage() {
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (BuildContext context) => MainScreen()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: InkWell(
        child: Stack(
          fit: StackFit.expand,
          children: <Widget>[
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Expanded(
                  flex: 7,
                  child: Container(
                  child: Center(
                    child: ScaleTransition(
                      scale: _animation,
                      child:  Padding(
                        padding: EdgeInsets.all(8.0),
                        child:  Image.asset(
                          'assets/images/android_ios.jpg',
                          height: 300,
                          width: 300,
                        ),
                      ),
                    ),
                  ),

                  ),
                ),
                Expanded(
                  child: Column(
                    children: <Widget>[
                      CircularProgressIndicator(),
                      Container(
                        height: 10,
                      ),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: <Widget>[
                            Spacer(),
                            Text(_versionName, style: TextStyle(color: Colors.blue), ),
                            Spacer(
                              flex: 4,
                            ),
                            Text('Network Sample', style: TextStyle(color: Colors.blue), ),
                            Spacer(),
                          ])
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}