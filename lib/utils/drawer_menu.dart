import 'package:flutter/material.dart';

Widget customDrawerList(
    {required String text, required Icon icon, required VoidCallback onTap}) {
  return Padding(
    padding: const EdgeInsets.only(left: 14,right: 14,top: 6,bottom: 6),
    child: InkWell(
      onTap: onTap,
      child: Container(
        height: 28,
        child: Row(
          children: [
            icon,
            SizedBox(width: 14),
            Text(
              text,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    ),
  );
}
