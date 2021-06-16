import 'package:flutter/material.dart';

Widget tabItem(String label, IconData icon) {
    return Tab(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [Icon(icon), Text(label)],
      )
    );
  }