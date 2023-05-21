part of 'get_details_user_bloc.dart';

abstract class GetDetailsUserEvent extends Equatable {
  const GetDetailsUserEvent();
}

class ToGetDetailsUser extends GetDetailsUserEvent {
  @override
  List<Object> get props => [];
}
