part of 'register_cubit.dart';

enum FormStatus {invalid, valid, validating, posting}

class RegisterFormState extends Equatable {
  final FormStatus formStatus;
  final Username username;
  final Email email;
  final Password password;
  final bool isValid;

  const RegisterFormState({
    this.password = const Password.pure(),
    this.username = const Username.pure(),
    this.email = const Email.pure(),
    this.isValid = false,
    this.formStatus = FormStatus.invalid,
  });

  RegisterFormState copyWith({
    FormStatus? formStatus,
    Username? username,
    Email? email,
    bool? isValid,
    Password? password,
  }) => RegisterFormState(
    email: email ?? this.email,
    formStatus: formStatus ?? this.formStatus,
    username: username ?? this.username,
    isValid: isValid ?? this.isValid,
    password: password ?? this.password,
  );


  @override
  List<Object?> get props => [formStatus, username, email, password, isValid];

}
