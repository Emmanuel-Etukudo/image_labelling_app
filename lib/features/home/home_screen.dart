import 'package:flutter/material.dart';
import 'package:image_labelling_app/constants/app_colors.dart';

import '../../common_widgets/common_fab.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: AppColors.reddish,
      floatingActionButton: CommonFAB(
        bgColor: AppColors.reddish,
        notOnHome: false,
      ),
    );
  }
}
