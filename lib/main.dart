import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:image_recogention/views/home_view.dart';
import 'package:image_recogention/views/onboarding_view.dart';

   List<CameraDescription> ?cameras;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  cameras = await availableCameras();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData(
          fontFamily: "Circular Std'", scaffoldBackgroundColor: Colors.black),
      debugShowCheckedModeBanner: false,
      title: 'image recognition',
      getPages: [
        GetPage(
            name: HomeView.id,
            page: () => const HomeView()), // Add your pages here
        GetPage(name: OnboardingView.id, page: () => const OnboardingView()),
      ],
      initialRoute: HomeView.id,
    );
  }
}
