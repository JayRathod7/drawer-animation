import 'package:flutter/material.dart';
import 'package:flutter_animation/screen/first_page.dart';
import 'package:flutter_animation/utils/app_string.dart';
import 'package:flutter_animation/utils/drawer_menu.dart';

class MenuPage extends StatelessWidget {
  MenuPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: 250,
        decoration: BoxDecoration(
        borderRadius: const BorderRadius.only(
            topRight: Radius.circular(12),
            bottomRight: Radius.circular(12))),
        child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const SizedBox(height: 60),
        CircleAvatar(
          radius: 40,
          backgroundColor: Colors.black,
          child: CircleAvatar(
            backgroundColor: Colors.grey.shade50,
            radius: 36,
            child: const CircleAvatar(
              radius: 34,
              backgroundImage: const NetworkImage(AppString.image2),
            ),
          ),
        ),
        const SizedBox(height: 10),
        const Text(
          "Dead pool",
          style: TextStyle(
              color: Colors.black,
              fontSize: 30,
              fontWeight: FontWeight.w600),
        ),
        const SizedBox(height: 4),
        const Text(
          "Dead_pool_001",
          style: TextStyle(
              color: Colors.black,
              fontSize: 10,
              fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 12),
        const Divider(color: Colors.black),
        customDrawerList(
            text: "News Paper",
            icon: const Icon(
              Icons.newspaper_outlined,
            ),
            onTap: () {}),
        const Divider(color: Colors.black),
        customDrawerList(
            text: "Movie",
            icon: const Icon(
              Icons.movie_outlined,
            ),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const FirstPage()));
            }),
        const Divider(color: Colors.black),
        customDrawerList(
            text: "Book",
            icon: const Icon(
              Icons.menu_book_outlined,
            ),
            onTap: () {}),
        const Divider(color: Colors.black),
        customDrawerList(
            text: "Notification",
            icon: const Icon(
              Icons.notifications,
            ),
            onTap: () {}),
        const Divider(color: Colors.black),
        customDrawerList(
            text: "Profile",
            icon: const Icon(
              Icons.person_outlined,
            ),
            onTap: () {}),
        const Divider(color: Colors.black),
        customDrawerList(
            text: "Setting",
            icon: const Icon(
              Icons.settings,
            ),
            onTap: () {}),
        const Divider(color: Colors.black),
        customDrawerList(
            text: "Help",
            icon: const Icon(
              Icons.help,
            ),
            onTap: () {}),
        const Divider(color: Colors.black),
        const Text(
          "App Version",
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 2),
        const Text(
          "2.0.0",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        const Spacer(),
        const Text(
          "Your App is Updated",
          style: const TextStyle(fontWeight: FontWeight.w300),
        ),
        const SizedBox(height: 20),
      ],
        ),
      ),
    );
  }
}
