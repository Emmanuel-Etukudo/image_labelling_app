import 'package:flutter/material.dart';
import 'package:image_labelling_app/common_widgets/common_fab.dart';
import 'package:image_labelling_app/constants/app_colors.dart';

class ImageRecognition extends StatefulWidget {
  const ImageRecognition({super.key});

  @override
  State<ImageRecognition> createState() => _ImageRecognitionState();
}

class _ImageRecognitionState extends State<ImageRecognition> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: AppColors.bluish,
      floatingActionButton: CommonFAB(bgColor: AppColors.bluish),
    );
  }
}
