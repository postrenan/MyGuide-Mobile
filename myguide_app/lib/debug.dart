import 'package:flutter/material.dart';

import 'pages/login/login.dart';
import 'pages/login/create_account.dart';
import 'pages/login/recover_password.dart';
import 'pages/dashboard/dashboard.dart';
import 'pages/categories/categories.dart';
import 'pages/shops/shop_list.dart';
import 'pages/shops/shop_details.dart';
import 'pages/shops/shop_favorites.dart';
import 'pages/settings/settings.dart';

class Debug extends StatelessWidget {
  const Debug({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      title: const Text('PLACEHOLDER DASHBOARD'),
      centerTitle: true,
      backgroundColor: Colors.lightBlue
      ),
      body: Column(
        children: [
          ListTile(
            title: const Text(
              'Login',
              style: TextStyle(fontSize: 18)
            ),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (_) => const LoginScreen()));
            }
          ),
          
          const Divider(),

          ListTile(
            title: const Text(
              'Register',
              style: TextStyle(fontSize: 18)
            ),
            onTap: () {
              // TODO
            }
          ),
          
          const Divider(),

          ListTile(
            title: const Text(
              'Recover Password',
              style: TextStyle(fontSize: 18)
            ),
            onTap: () {
              // TODO
            }
          ),
          
          const Divider(),

          ListTile(
            title: const Text(
              'Dashboard',
              style: TextStyle(fontSize: 18)
            ),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (_) => const Dashboard()));
            }
          ),
          
          const Divider(),

          ListTile(
            title: const Text(
              'Categories',
              style: TextStyle(fontSize: 18)
            ),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (_) => const Categories()));
            }
          ),
          
          const Divider(),

          ListTile(
            title: const Text(
              'Local Shops',
              style: TextStyle(fontSize: 18)
            ),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (_) => const ShopList()));
            }
          ),
          
          const Divider(),

          ListTile(
            title: const Text(
              'Shop Details',
              style: TextStyle(fontSize: 18)
            ),
            onTap: () {
              //
            }
          ),
          
          const Divider(),

          ListTile(
            title: const Text(
              'Favorites',
              style: TextStyle(fontSize: 18)
            ),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (_) => const ShopFavorites()));
            }
          ),
          
          const Divider(),

          ListTile(
            title: const Text(
              'Settings',
              style: TextStyle(fontSize: 18)
            ),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (_) => const SettingMain()));
            }
          ),
          
          const Divider()

        ]
      )
    );
  }
}
