import 'dart:io';

import 'package:flutter/material.dart';
import 'package:google_mlkit_image_labeling/google_mlkit_image_labeling.dart';
import 'package:image_labelling_app/common_widgets/common_fab.dart';
import 'package:image_labelling_app/common_widgets/select_image_or_camera_button.dart';
import 'package:image_labelling_app/constants/app_colors.dart';
import 'package:image_picker/image_picker.dart';

class ImageRecognition extends StatefulWidget {
  const ImageRecognition({super.key});

  @override
  State<ImageRecognition> createState() => _ImageRecognitionState();
}

class _ImageRecognitionState extends State<ImageRecognition> {
  bool imageLabelChecking = false;

  XFile? imageFile;

  String imageLabel = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bluish,
      floatingActionButton: const CommonFAB(bgColor: AppColors.bluish),
      body: Center(
        child: SingleChildScrollView(
          child: Container(
              margin: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  if (imageLabelChecking) const CircularProgressIndicator(),
                  if (!imageLabelChecking && imageFile == null)
                    Container(
                      width: 300,
                      height: 300,
                      color: Colors.grey[300]!,
                    ),
                  if (imageFile != null)
                    Image.file(
                      File(imageFile!.path),
                    ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SelectImageOrCameraButton(
                        title: 'Gallery',
                        icon: Icons.image,
                        iconColor: AppColors.bluish,
                        textColor: AppColors.bluish,
                        onPressed: () {
                          getImage(ImageSource.gallery);
                        },
                      ),
                      SelectImageOrCameraButton(
                        title: 'Camera',
                        icon: Icons.camera_alt,
                        iconColor: AppColors.bluish,
                        textColor: AppColors.bluish,
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
                      padding: const EdgeInsets.all(16.0),
                      child: Text(
                        imageLabel,
                        style: const TextStyle(
                            fontSize: 20, color: AppColors.bluish),
                      ),
                    ),
                  )
                ],
              )),
        ),
      ),
    );
  }

  void getImage(ImageSource source) async {
    try {
      final pickedImage = await ImagePicker().pickImage(source: source);
      if (pickedImage != null) {
        imageLabelChecking = true;
        imageFile = pickedImage;
        setState(() {});
        getImageLabels(pickedImage);
      }
    } catch (e) {
      imageLabelChecking = false;
      imageFile = null;
      imageLabel = "Error occurred while getting image Label";
      setState(() {});
    }
  }

  void getImageLabels(XFile image) async {
    final inputImage = InputImage.fromFilePath(image.path);
    ImageLabeler imageLabeler =
        ImageLabeler(options: ImageLabelerOptions(confidenceThreshold: 0.75));
    List<ImageLabel> labels = await imageLabeler.processImage(inputImage);
    StringBuffer sb = StringBuffer();
    for (ImageLabel imgLabel in labels) {
      String lblText = imgLabel.label;
      double confidence = imgLabel.confidence;
      sb.write(lblText);
      sb.write(" : ");
      sb.write((confidence * 100).toStringAsFixed(2));
      sb.write("%\n");
    }
    imageLabeler.close();
    imageLabel = sb.toString();
    imageLabelChecking = false;
    setState(() {});
  }
}
