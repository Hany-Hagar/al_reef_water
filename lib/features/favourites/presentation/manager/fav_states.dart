sealed class FavState {}

class FavInitialState extends FavState {}

class FavLoading extends FavState {}

class FavSuccess extends FavState {}

class FavFailure extends FavState {
  final String message;
  FavFailure(this.message);
}
