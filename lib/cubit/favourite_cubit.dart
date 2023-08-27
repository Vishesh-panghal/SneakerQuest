import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../Data/constants.dart';

part 'state_favourite_cubit.dart';

class FavouriteCubitCubit extends Cubit<List<ShoeItem>> {
  FavouriteCubitCubit() : super(FavouriteCubitInitial() as List<ShoeItem>);

  void addToFav(ShoeItem shoe) {
    emit(state..add(shoe));
  }

  void removeToFav(ShoeItem shoe) {
    emit(state..remove(shoe));
  }
}
