import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/route_manager.dart';
import 'package:startwarsapp/tools/bindings.dart';
import 'package:startwarsapp/view/home_page.dart';
import 'package:startwarsapp/view/widgets/splash_screen.dart';
import 'package:startwarsapp/viewmodels/home.viewmodel.dart';

void main() async {
  await WidgetsFlutterBinding.ensureInitialized();
/*   final homeController = Get.put(HomeViewModel());
  await homeController.fetchMovies(); */
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialBinding: Binding(),
      debugShowCheckedModeBanner: false,
      home: SafeArea(
        child: FutureBuilder(
          future: Get.put(HomeViewModel()).fetchMovies(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              return HomePage();
            } else {
              return SplashScreen();
            }
          },
        ),
      ),
    );
  }
}
