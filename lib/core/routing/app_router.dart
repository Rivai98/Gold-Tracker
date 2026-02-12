import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:goldy/core/presentation/home_screen.dart';
import 'package:goldy/core/routing/app_routes.dart';
import 'package:goldy/features/data/repo/gold_repo.dart';
import 'package:goldy/features/presentation/screens/gold_screen.dart';
import 'package:goldy/features/presentation/view_model/gold_cubit/gold_cubit.dart';

class AppRouter {
  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.homeScreen:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => HomeScreen(),
        );
      case AppRoutes.goldScreen:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => BlocProvider(
            create: (context) {
              return GoldCubit(GoldRepo())..getGoldPrice();
            },
            child: GoldScreen(),
          ),
        );
      default:
        return MaterialPageRoute(
          builder: (_) =>
              const Scaffold(body: Center(child: Text('No Route Found'))),
        );
    }
  }
}
