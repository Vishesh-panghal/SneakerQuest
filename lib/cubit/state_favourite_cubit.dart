part of 'favourite_cubit.dart';

@immutable
sealed class FavouriteCubitState {}

final class FavouriteCubitInitial extends FavouriteCubitState {}

final class FavouriteCubitLiked extends FavouriteCubitState {}

final class FavouriteCubitDislike extends FavouriteCubitState {}
