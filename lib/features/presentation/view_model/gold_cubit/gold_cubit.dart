import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:goldy/features/data/models/gold_model.dart';
import 'package:goldy/features/data/repo/gold_repo.dart';

part 'gold_state.dart';

class GoldCubit extends Cubit<GoldState> {
  final GoldRepo goldRepo;
  GoldCubit(this.goldRepo) : super(GoldInitial());

  DateTime? _lastFetchTime;

  Future<void> getGoldPrice() async {
    // Prevent fetching more than once every 60 seconds
    if (_lastFetchTime != null &&
        DateTime.now().difference(_lastFetchTime!).inSeconds < 60) {
      if (state is GoldLoaded) return; // Already have data, don't show loading
    }

    emit(GoldLoading());
    final res = await goldRepo.getGold();
    res.fold(
      (error) {
        emit(GoldError(message: error));
      },
      (goldModel) {
        _lastFetchTime = DateTime.now();
        emit(GoldLoaded(goldModel: goldModel));
      },
    );
  }
}
