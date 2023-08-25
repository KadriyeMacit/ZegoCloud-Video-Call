import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:video_call/models/user_model.dart';
import 'package:video_call/ui/login_page.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(color: Colors.pink),
            child: Text(
              'Hello World',
              style: TextStyle(color: Colors.white),
            ),
          ),
          ListTile(
            title: const Text('Sing out'),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const LoginPage()));
            },
            trailing: const Icon(Icons.exit_to_app_sharp),
          ),
        ],
      ),
    );
  }
}
