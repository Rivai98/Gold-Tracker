import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:goldy/core/constants/app_colors.dart';
import 'package:goldy/core/constants/app_images.dart';
import 'package:goldy/core/constants/app_strings.dart';
import 'package:goldy/features/presentation/view_model/gold_cubit/gold_cubit.dart';

class GoldScreen extends StatelessWidget {
  const GoldScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      appBar: AppBar(
        backgroundColor: AppColors.subColor,
        centerTitle: true,
        title: Text(
          AppStrings.appTitle,
          style: Theme.of(context).textTheme.titleLarge!.copyWith(
            fontWeight: FontWeight.bold,
            color: AppColors.goldColor,
            fontSize: 36.0,
          ),
        ),
      ),
      body: BlocBuilder<GoldCubit, GoldState>(
        bloc: BlocProvider.of<GoldCubit>(context),
        builder: (context, state) {
          if (state is GoldLoading) {
            return Center(child: CircularProgressIndicator.adaptive());
          } else if (state is GoldError) {
            return Center(
              child: Text(
                state.message,
                style: Theme.of(context).textTheme.labelMedium!.copyWith(
                  fontWeight: FontWeight.bold,
                  color: AppColors.errorMesage,
                ),
              ),
            );
          } else if (state is GoldLoaded) {
            final goldModel = state.goldModel;
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(AppImagesP.goldImage),
                Text(
                  "${goldModel.price} USD",
                  style: Theme.of(context).textTheme.displayMedium!.copyWith(
                    fontWeight: FontWeight.bold,
                    color: AppColors.goldColor,
                  ),
                ),
              ],
            );
          } else {
            return Center(
              child: Text(
                "Something Went Wrong",
                style: Theme.of(context).textTheme.displayMedium!.copyWith(
                  fontWeight: FontWeight.bold,
                  color: AppColors.goldColor,
                ),
              ),
            );
          }
        },
      ),
    );
  }
}
