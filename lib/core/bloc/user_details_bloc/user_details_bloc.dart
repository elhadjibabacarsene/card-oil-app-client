import 'dart:async';
import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:card_oil/core/models/user_details_model.dart';
import 'package:equatable/equatable.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'user_details_event.dart';

part 'user_details_state.dart';

class UserDetailsBloc extends Bloc<UserDetailsEvent, UserDetailsState> {
  UserDetailsBloc() : super(UserDetailsInitial()) {

    on<GetUserDetails>((event, emit) async {
      emit(UserDetailsIsLoading());

      final SharedPreferences prefs = await SharedPreferences.getInstance();

      // check if user is logged in
      // get token by shared preferences
      final String? token = prefs.getString('token');

      if (token != null) {
        Map<String, dynamic> decodedToken = JwtDecoder.decode(token);
        final UserDetails userDetails =
            userDetailsFromJson(json.encode(decodedToken));
        emit(UserDetailsIsLoaded(userDetails: userDetails));
      } else {
        emit(UserDetailsIsNotLoaded());
      }
      // if yes, emit UserDetailsIsLoaded
      // if no, emit UserDetailsIsNotLoaded
    });
  }
}
