
import 'package:flutter/material.dart';

import 'package:rickandmorty_app/app_router.dart';

void main() {
  runApp(RickAndMortyApp(appRouter: AppRouter()));
}

class RickAndMortyApp extends StatelessWidget {
  final AppRouter appRouter;

  const RickAndMortyApp({Key? key, required this.appRouter}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      onGenerateRoute: appRouter.generateRoute,
    );
  }
}
