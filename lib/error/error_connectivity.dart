import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:daniel/screen/dashboard/main_dashboard.dart';
import 'package:daniel/screen/login/login_v.dart';
import 'package:daniel/screen/splashscreen/splashscreen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ErrorConnectivity extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ErrorConnectivityState();
  }
}

class _ErrorConnectivityState extends State<ErrorConnectivity> {
  final Connectivity _connectivity = Connectivity();
  bool _isInternet = false;
  @override
  void initState() {
    super.initState();
  }

  check_connection() async {
    var result = await _connectivity.checkConnectivity();
    if (result == ConnectivityResult.mobile ||
        result == ConnectivityResult.wifi) {
      setState(() {
        _isInternet = true;
      });
    }
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
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                '~𝙨𝙞𝙣𝙜𝙜𝙖𝙝~',
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 40,
                    letterSpacing: 2,
                    color: Color.fromARGB(255, 255, 255, 255),
                    fontFamily: 'Anton',
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                'Unable to load posts right now',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 14,
                  color: Color.fromARGB(255, 255, 255, 255),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              OutlinedButton(
                onPressed: () {
                  // _isInternet ? Get.to(MyLogin()) : Get.to(ErrorConnectivity());
                  _isInternet == true
                      ? Get.to(SplashScreen())
                      : check_connection();
                  print('is internet: $_isInternet');
                },
                style: ButtonStyle(
                  shape: MaterialStateProperty.all(RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0))),
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Colors.purple),
                ),
                child: const Text(
                  'Try again',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 14,
                    color: Color.fromARGB(255, 255, 255, 255),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
