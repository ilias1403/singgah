import 'package:daniel/screen/dashboard/main_dashboard.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
                'https://png.pngtree.com/png-clipart/20211011/ourlarge/pngtree-a-man-line-art-from-the-side-with-simple-water-drop-png-image_3977463.png',
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
          ListTile(
            leading: Icon(Icons.favorite),
            title: Text('Liked'),
            onTap: () {
              // Get.to(() => const HomePage());
              print('Liked');
            },
          ),
          ListTile(
            leading: Icon(Icons.logout),
            title: Text('Logout'),
            onTap: () {
              // Get.to(() => const HomePage());
              print('logout');
            },
          ),
        ],
      ),
    );
  }
}
