import 'package:flutter/material.dart';
import 'package:image_labelling_app/common_widgets/common_fab.dart';
import 'package:image_labelling_app/constants/app_colors.dart';

class EmotionalRecognition extends StatefulWidget {
  const EmotionalRecognition({super.key});

  @override
  State<EmotionalRecognition> createState() => _EmotionalRecognitionState();
}

class _EmotionalRecognitionState extends State<EmotionalRecognition> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: AppColors.greenish,
      floatingActionButton: CommonFAB(bgColor: AppColors.greenish),
    );
  }
}
