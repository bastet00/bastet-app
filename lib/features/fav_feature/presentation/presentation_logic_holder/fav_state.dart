part of 'fav_cubit.dart';

sealed class FavState extends Equatable {
  const FavState();
}

final class FavInitial extends FavState {
  @override
  List<Object> get props => [];
}

final class FavLoading extends FavState {
  @override
  List<Object> get props => [];
}
