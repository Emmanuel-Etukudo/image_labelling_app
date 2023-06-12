import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_labelling_app/common_widgets/common_fab.dart';
import 'package:image_labelling_app/constants/app_colors.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tflite/tflite.dart';

import '../../common_widgets/select_image_or_camera_button.dart';

class EmotionalRecognition extends StatefulWidget {
  const EmotionalRecognition({super.key});

  @override
  State<EmotionalRecognition> createState() => _EmotionalRecognitionState();
}

class _EmotionalRecognitionState extends State<EmotionalRecognition> {
  @override
  void initState() {
    //loadModel();
    super.initState();
  }

  bool imageScanning = false;
  XFile? imageFile;
  String emotionResult = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.greenish,
      floatingActionButton: const CommonFAB(bgColor: AppColors.greenish),
      body: Center(
          child: SingleChildScrollView(
        child: Container(
            margin: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                if (imageScanning) const CircularProgressIndicator(),
                if (!imageScanning && imageFile == null)
                  Container(
                    width: 300,
                    height: 300,
                    color: Colors.grey[300]!,
                  ),
                if (imageFile != null) Image.file(File(imageFile!.path)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SelectImageOrCameraButton(
                        title: 'Gallery',
                        textColor: AppColors.greenish,
                        iconColor: AppColors.greenish,
                        onPressed: () {
                          getImage(ImageSource.gallery);
                        },
                        icon: Icons.image),
                    SelectImageOrCameraButton(
                      title: 'Camera',
                      icon: Icons.camera_alt,
                      iconColor: AppColors.greenish,
                      textColor: AppColors.greenish,
                      onPressed: () {
                        getImage(ImageSource.camera);
                      },
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Card(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      emotionResult,
                      style: const TextStyle(fontSize: 20),
                    ),
                  ),
                )
              ],
            )),
      )),
    );
  }

  void getImage(ImageSource source) async {
    try {
      final pickedImage = await ImagePicker().pickImage(source: source);
      if (pickedImage != null) {
        imageScanning = true;
        imageFile = pickedImage;
        setState(() {});
        loadModel();
        runModel(pickedImage);
        //getImageLabels(pickedImage);
      }
    } catch (e) {
      imageScanning = false;
      imageFile = null;
      emotionResult = "Error occurred while getting image Label";
      setState(() {});
    }
  }

  runModel(XFile image) async {
    var predictions = await Tflite.runModelOnImage(
        path: image.path,
        imageMean: 127.5,
        imageStd: 127.5,
        threshold: 0.1,
        numResults: 2);
    for (var element in predictions!) {
      setState(() {
        emotionResult = element['label'];
        imageScanning = false;
      });
    }
  }

  loadModel() async {
    await Tflite.loadModel(
        model: 'assets/model.tflite', labels: 'assets/labels.txt');
  }
}
