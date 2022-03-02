import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:register_using_cubit/service/auth_service.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final GlobalKey<FormState> formKey;
  final TextEditingController emailController;
  final TextEditingController passwordController;

  bool isAuthFail = false;

  AuthCubit(this.formKey, this.emailController, this.passwordController)
      : super(AuthInitial());

  void usersLogin() async {
    if (formKey.currentState!.validate()) {
      await AuthRequestService.authRequestData(
        emailController.text,
        passwordController.text,
      ).then(
        (value) {
          if (value) {
            emit(AuthCompleted());
          }
        },
      );
    } else {
      isAuthFail = true;
      AuthValidateState(isAuthFail);
    }
  }
}
