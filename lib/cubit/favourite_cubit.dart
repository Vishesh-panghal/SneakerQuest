import 'package:SneakerQuest/cubit/fav_state.dart';
import 'package:bloc/bloc.dart';

import '../Data/constants.dart';

class FavouriteCubitCubit extends Cubit<FavDB> {
  // initial state:-
 FavouriteCubitCubit():super(FavDB( fav: []));

 //Add:-

 void addToFav({required ShoeItem shoe})
 {
  List<ShoeItem> currList = state.fav;
  currList.add(shoe);
  emit(FavDB(fav: currList));
 }
 void removeFromFav({required ShoeItem shoe})
 {
  List<ShoeItem> currList = state.fav;
  currList.remove(shoe);
  emit(FavDB(fav: currList));
 }
}
