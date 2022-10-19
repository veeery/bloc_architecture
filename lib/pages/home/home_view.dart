import 'package:bloc_architecture/pages/app_routes.dart';
import 'package:bloc_architecture/widgets/loading/loading_card_profile.dart';
import 'package:bloc_architecture/widgets/loading/loading_list.dart';
import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          Navigator.pushNamed(context, AppPages.profile);
        }
      ),
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
