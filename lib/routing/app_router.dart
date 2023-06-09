import 'package:go_router/go_router.dart';
import 'package:image_labelling_app/features/emotional_recognition/emotional_recognition.dart';
import 'package:image_labelling_app/features/home/home_screen.dart';
import 'package:image_labelling_app/features/image_recognition/image_recognition.dart';
import 'package:image_labelling_app/features/image_to_text/image_to_text.dart';

enum AppRoute {
  home,
  recognizer,
  toText,
  emotional,
}

final goRouter =
    GoRouter(initialLocation: '/', debugLogDiagnostics: false, routes: [
  GoRoute(
    path: '/',
    name: AppRoute.home.name,
    builder: (context, state) => const HomeScreen(),
    routes: [
      GoRoute(
        path: AppRoute.recognizer.name,
        name: AppRoute.recognizer.name,
        builder: (context, state) => const ImageRecognition(),
      ),
      GoRoute(
        path: AppRoute.toText.name,
        name: AppRoute.toText.name,
        builder: (context, state) => const ImageToText(),
      ),
      GoRoute(
        path: AppRoute.emotional.name,
        name: AppRoute.emotional.name,
        builder: (context, state) => const EmotionalRecognition(),
      ),
    ],
  ),
]);
