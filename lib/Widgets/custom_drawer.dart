import 'package:flutter/material.dart';

class CustomDrawer extends StatefulWidget {
  const CustomDrawer({super.key});

  @override
  State<CustomDrawer> createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: MediaQuery.of(context).size.width,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              IconButton(
                icon: const Icon(Icons.close),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          ),
          Expanded(
            child: ListView(
              children: [
                ListTile(
                  title: const Text('Citizenship'),
                  onTap: () {},
                ),
                ListTile(
                  title: const Text('Residency'),
                  onTap: () {},
                ),
                ListTile(
                  title: const Text('Real Estate'),
                  onTap: () {},
                ),
                ListTile(
                  title: const Text('Investment'),
                  onTap: () {},
                ),
                ListTile(
                  title: const Text('Pre-Check'),
                  onTap: () {},
                ),
                ListTile(
                  title: const Text('Blog'),
                  onTap: () {},
                ),
                ListTile(
                  title: const Text('Contact Us'),
                  onTap: () {},
                ),
                ListTile(
                  title: const Text('About Us'),
                  onTap: () {},
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
