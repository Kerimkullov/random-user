import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:random_user/helper/catch_exceptions.dart';
import 'package:random_user/logic/model/user_model.dart';
import 'package:random_user/logic/repository/repository.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  UserBloc(this.repository) : super(UserInitial());
  UserRepository repository = UserRepository();

  @override
  Stream<UserState> mapEventToState(
    UserEvent event,
  ) async* {
    if (event is GetUserEvent) {
      yield UserInitial();
      try {
        User user = await repository.getUser();
        yield UserLoaded(user);
      } catch (e) {
        yield UserError(CatchException.catchError(e));
      }
    }
  }
}
