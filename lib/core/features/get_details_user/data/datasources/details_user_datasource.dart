

import 'package:card_oil/core/features/get_details_user/domain/entities/user.dart';

abstract class DetailsUserDataSource {
  Future<User> getDetailsUser();
}