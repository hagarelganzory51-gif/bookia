class HomeState {}

class HomeStateInitial extends HomeState {}

class HomeStateLoading extends HomeState {}

class HomeStateSucces extends HomeState {
  String? message;

  HomeStateSucces({this.message});
}

class HomeStateError extends HomeState {
  final String message;
  HomeStateError({required this.message});
}
