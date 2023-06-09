import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:go_router/go_router.dart';
import 'package:image_labelling_app/routing/app_router.dart';

import '../constants/app_colors.dart';

class CommonFAB extends StatelessWidget {
  const CommonFAB({super.key, required this.bgColor, this.notOnHome = true});
  final Color bgColor;
  final bool notOnHome;
  @override
  Widget build(BuildContext context) {
    return SpeedDial(
      animatedIcon: AnimatedIcons.menu_close,
      backgroundColor: AppColors.white,
      foregroundColor: bgColor,
      activeBackgroundColor: bgColor,
      activeForegroundColor: AppColors.white,
      overlayColor: Colors.black,
      overlayOpacity: 0.3,
      spacing: 12,
      spaceBetweenChildren: 12,
      children: [
        SpeedDialChild(
          backgroundColor: AppColors.reddish,
          child: const Icon(
            Icons.home_outlined,
            color: AppColors.white,
          ),
          label: 'Home',
          visible: notOnHome,
          onTap: () => context.pushNamed(AppRoute.home.name),
        ),
        SpeedDialChild(
            backgroundColor: AppColors.bluish,
            child: const Icon(
              Icons.image_search_outlined,
              color: AppColors.white,
            ),
            label: 'Image Recognizer',
            onTap: () => context.pushNamed(AppRoute.recognizer.name)),
        SpeedDialChild(
          backgroundColor: AppColors.yellowish,
          child: const Icon(
            Icons.text_snippet_outlined,
            color: AppColors.white,
          ),
          label: 'Image to text',
          onTap: () => context.pushNamed(AppRoute.toText.name),
        ),
        SpeedDialChild(
          backgroundColor: AppColors.greenish,
          child: const Icon(
            Icons.emoji_emotions_outlined,
            color: AppColors.white,
          ),
          label: 'Emotion Recognition',
          onTap: () => context.pushNamed(AppRoute.emotional.name),
        )
      ],
    );
  }
}
