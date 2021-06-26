import 'package:random_user/logic/model/user_model.dart';
import 'package:random_user/logic/service/service.dart';

class UserRepository {
  ServiceApi _userProvider = ServiceApi();
  Future<User> getUser() => _userProvider.getUser();
}
