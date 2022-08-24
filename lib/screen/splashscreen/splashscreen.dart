import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:daniel/controller/user.dart';
import 'package:daniel/error/error_connectivity.dart';
import 'package:daniel/screen/dashboard/main_dashboard.dart';
import 'package:daniel/screen/login/login_v.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _SplashScreenState();
  }
}

class _SplashScreenState extends State<SplashScreen> {
  final Connectivity _connectivity = Connectivity();
  bool _isLoggedIn = false;

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/splashscreen/splashscreen_1.jpg'),
              fit: BoxFit.cover),
        ),
        child: Center(
            child: CircleAvatar(
          backgroundColor: Colors.white,
          radius: 106,
          child: CircleAvatar(
            radius: 100,
            backgroundImage: AssetImage('assets/icons/playstore.png'),
          ),
        )),
      ),
    );
  }

  void startTimer() {
    Timer(Duration(seconds: 3), () {
      navigateUser(); //It will redirect  after 3 seconds
    });
  }

  void navigateUser() async {
    var connectivityResult = await (_connectivity.checkConnectivity());
    if (connectivityResult == ConnectivityResult.none) {
      print('No internet');
      Navigator.pushReplacement(context,
          MaterialPageRoute(builder: (context) => ErrorConnectivity()));
    } else {
      print('ada internet');
      final deviceInfoPlugin = DeviceInfoPlugin();
      final deviceInfo = await deviceInfoPlugin.deviceInfo;
      final map = deviceInfo.toMap();
      var data = {
        'device_unique_id': map['id'],
      };
      var res = await UserController().checking_main_device_info(data);
      if (res['status'] == 'success' && res['user']['status'] == '1') {
        setState(() {
          _isLoggedIn = true;
        });
      }

      if (_isLoggedIn) {
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => HomePage()));
      } else {
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => MyLogin()));
      }
    }
  }
}
