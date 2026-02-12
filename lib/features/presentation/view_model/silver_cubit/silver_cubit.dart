import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:goldy/features/data/models/silver_model.dart';
import 'package:goldy/features/data/repo/silver_repo.dart';

part 'silver_state.dart';

class SilverCubit extends Cubit<SilverState> {
  final SilverRepo silverRepo;
  SilverCubit(this.silverRepo) : super(SilverInitial());

  Future<void> getSilverData() async {
    emit(SilverLoading());
    final res = await silverRepo.getSilver();
    res.fold(
      (error) => emit(SilverError(message: error)),
      (silverModel) => emit(SilverLoaded(silverModel: silverModel)),
    );
  }
}
