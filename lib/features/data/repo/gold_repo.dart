import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:goldy/core/networking/api_constants.dart';
import 'package:goldy/core/networking/dio_helper.dart';
import 'package:goldy/features/data/models/gold_model.dart';
import 'package:goldy/features/data/models/silver_model.dart';

class GoldRepo {
  Future<Either<String, GoldModel>> getGold() async {
    try {
      final res = await DioHelper.getData(endPoint: ApiConstants.goldEndPoint);
      return right(GoldModel.fromJson(res.data));
    } on DioException catch (e) {
      if (e.response?.statusCode == 429) {
        return left("Too many requests. Please wait a moment and try again.");
      }
      return left(e.message ?? "An unexpected error occurred");
    } catch (e) {
      return left(e.toString());
    }
  }

  
}
