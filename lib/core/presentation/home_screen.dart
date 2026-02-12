import 'package:flutter/material.dart';
import 'package:goldy/core/constants/app_colors.dart';
import 'package:goldy/core/constants/app_strings.dart';
import 'package:goldy/core/routing/app_routes.dart';
import 'package:goldy/core/widgets/custom_button.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      appBar: AppBar(
        backgroundColor: AppColors.subColor,
        title: Text(
          AppStrings.appTitle,
          style: Theme.of(context).textTheme.titleLarge!.copyWith(
            fontWeight: FontWeight.bold,
            color: AppColors.goldColor,
            fontSize: 36.0,
          ),
        ),
        centerTitle: true,
      ),
      body: Container(
        width: size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,

          children: [
            CustomButton(
              onPressed: () =>
                  Navigator.of(context).pushNamed(AppRoutes.goldScreen),
              textButton: AppStrings.gold,
              textButtonColor: AppColors.primaryColor,
              backColor: AppColors.goldColor,
            ),
            const SizedBox(height: 20.0),
            CustomButton(
              onPressed: () {},
              textButton: AppStrings.silver,
              textButtonColor: AppColors.primaryColor,
              backColor: AppColors.seliverColor,
            ),
          ],
        ),
      ),
    );
  }
}
