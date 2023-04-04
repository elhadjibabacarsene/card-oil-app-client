part of 'user_details_bloc.dart';

abstract class UserDetailsState extends Equatable {
  const UserDetailsState();
}

class UserDetailsInitial extends UserDetailsState {
  @override
  List<Object> get props => [];
}

class UserDetailsIsLoading extends UserDetailsState {
  @override
  // TODO: implement props
  List<Object?> get props => [];

}

class UserDetailsIsLoaded extends UserDetailsState {
  final UserDetails userDetails;

  const UserDetailsIsLoaded({required this.userDetails});


  @override
  // TODO: implement props
  List<Object?> get props => [userDetails];
}

class UserDetailsIsNotLoaded extends UserDetailsState {


  @override
  // TODO: implement props
  List<Object?> get props => [];
}
