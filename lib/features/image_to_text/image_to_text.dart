import 'package:flutter/material.dart';
import 'package:image_labelling_app/common_widgets/common_fab.dart';
import 'package:image_labelling_app/constants/app_colors.dart';

class ImageToText extends StatefulWidget {
  const ImageToText({super.key});

  @override
  State<ImageToText> createState() => _ImageToTextState();
}

class _ImageToTextState extends State<ImageToText> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: AppColors.yellowish,
      floatingActionButton: CommonFAB(bgColor: AppColors.yellowish),
    );
  }
}
