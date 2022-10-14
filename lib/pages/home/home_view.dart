import 'package:bloc_architecture/pages/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, AppPages.comic);
              },
              child: Container(
                width: 1.sw,
                height: 100.h,
                color: Colors.blue,
                child: const Center(child: Text("Go To Comic Page")),
              ),
            )
          ],
        ),
      ),
    );
  }
}
