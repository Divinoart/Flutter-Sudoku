import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:flutter/material.dart';
import 'package:splashscreen/splashscreen.dart';
import 'Styles.dart';
import 'main.dart';

class SplashScreenPage extends StatefulWidget {
  SplashScreenPage({Key key}) : super(key: key);

  @override
  _SplashScreenPageState createState() => _SplashScreenPageState();
}

class _SplashScreenPageState extends State<SplashScreenPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return new SplashScreen(
      seconds: 2,
      navigateAfterSeconds: FutureBuilder<RemoteConfig>(
        future: setupRemoteConfig(),
        builder: (BuildContext context, AsyncSnapshot<RemoteConfig> snapshot) {
          return snapshot.hasData
              ?
          HomePage(remoteConfig: snapshot.requireData)
          // Home(remoteConfig: snapshot.requireData)
              : Scaffold();
        },
      ),
      title: new Text(
        '\nSudoku',
        style: new TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 25.0,
            color: Styles.foregroundColor),
      ),
      image: new Image.asset('assets/icon/icon_foreground.png'),
      photoSize: 50,
      backgroundColor: Styles.primaryBackgroundColor,
      loaderColor: Styles.primaryColor,
      loadingText: Text(
        'VarunS2002',
        style: TextStyle(color: Colors.grey),
      ),
    );
  }
}

