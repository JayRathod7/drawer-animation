import 'package:flutter/material.dart';
import 'package:flutter_animation/main.dart';
import 'package:flutter_animation/screen/first_page.dart';
import 'package:flutter_animation/screen/menu_page.dart';
import 'package:flutter_zoom_drawer/config.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ZoomDrawer(
        borderRadius: 50,
        shrinkMainScreen: false,
        menuScreenOverlayColor: Colors.black,
        drawerShadowsBackgroundColor: Colors.red,
        menuScreenWidth: MediaQuery.of(context).size.width,
        mainScreenAbsorbPointer: true,
        mainScreenTapClose: true,
        showShadow: true,
        shadowLayer1Color: Colors.grey.withOpacity(0.3),
        shadowLayer2Color: Colors.black.withOpacity(0.4),
        style: DrawerStyle.style1,
        openCurve: Curves.fastOutSlowIn,
        duration: Duration(milliseconds: 1000),
        mainScreen: FirstPage(),
        menuScreen: MenuPage(),
      ),
    );
  }
}

//
