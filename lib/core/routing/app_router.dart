import 'package:flutter/material.dart';
import 'package:goldy/core/presentation/home_screen.dart';
import 'package:goldy/core/routing/app_routes.dart';

class AppRouter {
  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.homeScreen:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => HomeScreen(),
        );

      default: 
        
        return MaterialPageRoute(
          builder: (_) =>
              const Scaffold(body: Center(child: Text('No Route Found'))),
        );
    }
  }
}
