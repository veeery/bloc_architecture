import 'package:bloc_architecture/pages/app_routes.dart';
import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  const HomeView

  ({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(onPressed: () async {
        Navigator.pushNamed(context, AppPages.friendList);
      }),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Home"),
          ],
        ),
      ),
    );
  }
}
