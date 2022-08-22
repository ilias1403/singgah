import 'package:daniel/screen/dashboard/main_dashboard.dart';
import 'package:daniel/screen/login/login_v.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class NavBar extends StatelessWidget {
  const NavBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const UserAccountsDrawerHeader(
            accountName: Text('~ilias~'),
            accountEmail: Text('daniel@gmail.com'),
            currentAccountPicture: CircleAvatar(
              backgroundImage: NetworkImage(
                'https://i.pinimg.com/564x/9e/8a/88/9e8a88e1ea1fa25810134f8d4d269a5d.jpg',
              ),
            ),
            decoration: BoxDecoration(
              color: Colors.blue,
              image: DecorationImage(
                image: NetworkImage(
                  'https://i.pinimg.com/564x/24/6f/64/246f64632f048e0c18b52700614d1349.jpg',
                ),
                fit: BoxFit.cover,
              ),
            ),
          ),
          ListTile(
            leading: Icon(Icons.home),
            title: Text('Home'),
            onTap: () {
              Get.to(() => const HomePage());
            },
          ),
          // ListTile(
          //   leading: Icon(Icons.favorite),
          //   title: Text('Liked'),
          //   onTap: () {
          //     // Get.to(() => const HomePage());
          //     print('Liked');
          //   },
          // ),
          ListTile(
            leading: Icon(Icons.logout),
            title: Text('Logout'),
            onTap: () {
              logout;
              // Get.to(() => const HomePage());
              print('logout');
            },
          ),
        ],
      ),
    );
  }

  void logout() async {
    // logout from the server ...

    SharedPreferences localStorage = await SharedPreferences.getInstance();
    localStorage.remove('user');
    localStorage.remove('token');
    print('logout');
    Get.to(() => const MyLogin());
  }
}
