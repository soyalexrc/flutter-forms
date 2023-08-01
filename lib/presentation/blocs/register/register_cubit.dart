import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterFormState> {
  RegisterCubit() : super(const RegisterFormState());

  void usernameChanged(String value) {
    emit(state.copyWidth(
      username: value,
    ));
  }

  void emailChanged(String value) {
    emit(state.copyWidth(
      email: value,
    ));
  }

  void passwordChanged(String value) {
    emit(state.copyWidth(
      password: value,
    ));
  }

  void onSubmit() {
    print('submit: $state');
  }

}
