part of 'user_details_bloc.dart';

abstract class UserDetailsEvent extends Equatable {
  const UserDetailsEvent();
}

class GetUserDetails extends UserDetailsEvent {
  @override
  List<Object?> get props => [];
}
