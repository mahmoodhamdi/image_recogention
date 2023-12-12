import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:image_recogention/widgets/custom_button.dart';

import '../main.dart';

class HomeView extends StatefulWidget {
  /// Default Constructor
  const HomeView({super.key});
  static const String id = "/home_view";
  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  bool isWorking = false;
  String result = "";
  late CameraController cameraController;
   CameraImage ?cameraImage;
  initCamera() {
    cameraController = CameraController(cameras![0], ResolutionPreset.max);
    cameraController.initialize().then((value) {
      if (!mounted) {
        return;
      }
      setState(() {
        cameraController.startImageStream((imagesFromStream) => {
              if (!isWorking)
                {
                  isWorking = true,
                  cameraImage = imagesFromStream,
                }
            });
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
              child: cameraImage == null
                  ? const Icon(
                      Icons.photo_camera_front_outlined,
                      size: 150,
                      color: Color(0xFFC6F432),
                    )
                  : AspectRatio(
                      aspectRatio: cameraController.value.aspectRatio,
                      child: CameraPreview(cameraController))),
          CustomButton(
            title: "access camera",
            onTap: () {
              initCamera();
            },
          ),
        ],
      ),
    );
  }
}
