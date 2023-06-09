import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';

import '../constants/app_colors.dart';

class CommonFAB extends StatelessWidget {
  const CommonFAB({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SpeedDial(
      animatedIcon: AnimatedIcons.menu_close,
      backgroundColor: AppColors.white,
      foregroundColor: AppColors.reddish,
      activeBackgroundColor: AppColors.reddish,
      activeForegroundColor: AppColors.white,
      overlayColor: Colors.black,
      overlayOpacity: 0.3,
      spacing: 12,
      spaceBetweenChildren: 12,
      children: [
        SpeedDialChild(
            backgroundColor: AppColors.reddish,
            child: const Icon(
              Icons.image_search_outlined,
              color: AppColors.white,
            ),
            label: 'Home'),
        SpeedDialChild(
            backgroundColor: AppColors.bluish,
            child: const Icon(
              Icons.image_search_outlined,
              color: AppColors.white,
            ),
            label: 'Image Recognizer'),
        SpeedDialChild(
            backgroundColor: AppColors.yellowish,
            child: const Icon(
              Icons.text_snippet_outlined,
              color: AppColors.white,
            ),
            label: 'Image to text'),
        SpeedDialChild(
            backgroundColor: AppColors.greenish,
            child: const Icon(
              Icons.emoji_emotions_outlined,
              color: AppColors.white,
            ),
            label: 'Emotion Recognition')
      ],
    );
  }
}
