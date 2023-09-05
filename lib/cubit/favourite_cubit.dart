// ignore_for_file: depend_on_referenced_packages

import 'package:bloc/bloc.dart';

import 'package:SneakerQuest/cubit/fav_state.dart';

import '../Data/constants.dart';

class FavouriteCubitCubit extends Cubit<FavDB> {
  // initial state:-
  FavouriteCubitCubit() : super(FavDB(fav: []));

  //Add:-

  void addToFav({required ShoeItem shoe}) {
    // it create copy of current list
    List<ShoeItem> currList = List.from(state.fav);
    currList.add(shoe); // Add the new shoe to the list
    emit(FavDB(fav: currList)); // Emit the updated state
  }

  void removeFromFav({required ShoeItem shoe}) {
    List<ShoeItem> currList = List.from(state.fav);
    currList.removeWhere((element) => element.name == shoe.name); // Remove the specified shoe from the list
    emit(FavDB(fav: currList)); // Emit the updated state
  }
}
