part of 'register_cubit.dart';

enum FormStatus {invalid, valid, validating, posting}

class RegisterFormState extends Equatable {
  final FormStatus formStatus;
  final String username;
  final String email;
  final String password;

  const RegisterFormState({
    this.password = '',
    this.username = '',
    this.email = '',
    this.formStatus = FormStatus.invalid,
  });

  RegisterFormState copyWidth({
    FormStatus? formStatus,
    String? username,
    String? email,
    String? password,
  }) => RegisterFormState(
    email: email ?? this.email,
    formStatus: formStatus ?? this.formStatus,
    username: username ?? this.username,
    password: password ?? this.password,
  );


  @override
  List<Object?> get props => [formStatus, username, email, password];

}
