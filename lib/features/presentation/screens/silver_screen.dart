import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:goldy/core/constants/app_colors.dart';
import 'package:goldy/core/constants/app_images.dart';
import 'package:goldy/core/constants/app_strings.dart';
import 'package:goldy/features/presentation/view_model/silver_cubit/silver_cubit.dart';

class SilverScreen extends StatelessWidget {
  const SilverScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      appBar: AppBar(
        backgroundColor: AppColors.subColor,
        leading: IconButton(
          onPressed: () => Navigator.of(context).pop(),
          icon: Icon(
            Icons.chevron_left,
            color: AppColors.seliverColor,
            size: 36,
          ),
        ),
        centerTitle: true,
        title: Text(
          AppStrings.silverTitle,
          style: Theme.of(context).textTheme.titleLarge!.copyWith(
            fontWeight: FontWeight.bold,
            color: AppColors.seliverColor,
            fontSize: 36.0,
          ),
        ),
      ),
      body: BlocBuilder<SilverCubit, SilverState>(
        builder: (context, state) {
          if (state is SilverLoading) {
            return Center(child: CircularProgressIndicator.adaptive());
          } else if (state is SilverError) {
            return Center(
              child: Text(
                state.message,
                style: TextStyle(color: AppColors.errorMesage),
              ),
            );
          } else if (state is SilverLoaded) {
            final silverModel = state.silverModel;
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(AppImages.silverImage),
                  Text(
                    '${silverModel.price.toStringAsFixed(1)} USD',
                    style: Theme.of(context).textTheme.displayMedium!.copyWith(
                      fontWeight: FontWeight.bold,
                      color: AppColors.seliverColor,
                    ),
                  ),
                ],
              ),
            );
          } else {
            return Center(
              child: Text(
                "Someting Went Wrong",
                style: TextStyle(color: AppColors.errorMesage),
              ),
            );
          }
        },
      ),
    );
  }
}
