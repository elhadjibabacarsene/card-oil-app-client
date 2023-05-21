part of 'get_details_user_bloc.dart';

abstract class GetDetailsUserState extends Equatable {
  const GetDetailsUserState();
}

class GetDetailsUserInitial extends GetDetailsUserState {
  @override
  List<Object> get props => [];
}

class GetDetailsUserLoading extends GetDetailsUserState {
  @override
  List<Object> get props => [];
}

class GetDetailsUserLoaded extends GetDetailsUserState {
  final User user;

  const GetDetailsUserLoaded({required this.user});

  @override
  List<Object> get props => [user];
}

class GetDetailsUserError extends GetDetailsUserState {
  final String message;

  const GetDetailsUserError({required this.message});

  @override
  List<Object> get props => [message];
}

class UserUnAuthenticated extends GetDetailsUserState {
  @override
  List<Object> get props => [];
}
