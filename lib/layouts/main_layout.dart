import 'package:flutter/material.dart';
import 'package:onigiri_app/modules/bottom_nav/container/bootom_nav.dart';
import 'package:onigiri_app/common/screens/root_screen.dart';


class MainLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _createAppBar(),
      body: RootScreen(),
      bottomNavigationBar: BottomNav(),
    );
  }

  AppBar _createAppBar() {
    return AppBar(
      title: Text('Onigiri'),
    );
  }
}