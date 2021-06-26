part of 'user_bloc.dart';

@immutable
abstract class UserState {}

class UserInitial extends UserState {}

class UserLoaded extends UserState {
  final User model;
  UserLoaded(this.model);
}

class UserError extends UserState {
  final CatchException message;
  UserError(this.message);
}
