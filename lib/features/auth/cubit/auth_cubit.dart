import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:proxvision/exceptions/api_exception.dart';
import 'package:proxvision/features/auth/model/user.dart';
import 'package:proxvision/features/auth/repository/auth_repository.dart';
import 'package:proxvision/routing/app_routing.dart';
import 'package:proxvision/services/navigator_service.dart';
import 'package:proxvision/utils/snackbar_utils.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit({required this.authRepository}) : super(const AuthState());

  AuthRepository authRepository;

  Future<void> initAuth() async {
    emit(state.copyWith(authenticationStatus: AuthStatus.loading));
    try {
      final user = await authRepository.getUser();
      if (user != null) {
        emit(state.copyWith(
          authenticationStatus: AuthStatus.success,
          user: user,
        ));
      } else {
        emit(state.copyWith(
          authenticationStatus: AuthStatus.failure,
        ));
      }
    } catch (e) {
      emit(state.copyWith(
        authenticationStatus: AuthStatus.failure,
        message: e.toString(),
      ));
    }
  }

  Future<void> signIn({
    required String email,
    required String password,
  }) async {
    emit(state.copyWith(loginStatus: AuthStatus.loading));
    try {
      User user = await authRepository.signIn(
        email: email,
        password: password,
      );

      NavigatorService.go(AppRouting.homePath);

      emit(state.copyWith(
        loginStatus: AuthStatus.success,
        user: user,
      ));
    } on ApiException catch (e) {
      SnackBarUtils.errorSnackBar(
        NavigatorService.navigatorKey.currentContext!,
        e.message,
      );
      emit(state.copyWith(
        loginStatus: AuthStatus.failure,
        message: e.message,
      ));
    } catch (e) {
      SnackBarUtils.errorSnackBar(
        NavigatorService.navigatorKey.currentContext!,
        'An error occurred. Please try again later.',
      );
      emit(state.copyWith(
        loginStatus: AuthStatus.failure,
        message: 'An error occurred. Please try again later.',
      ));
    }
  }

  Future<void> signUp({
    required String firstName,
    required String lastName,
    required String email,
    required String phone,
    required String password,
  }) async {
    emit(state.copyWith(signUpStatus: AuthStatus.loading));
    try {
      await authRepository.signUp(
        firstName: firstName,
        lastName: lastName,
        email: email,
        phone: phone,
        password: password,
      );

      NavigatorService.push(AppRouting.homePath);

      emit(state.copyWith(
        signUpStatus: AuthStatus.success,
        emailForConfirmation: email,
      ));
    } on ApiException catch (e) {
      SnackBarUtils.errorSnackBar(
        NavigatorService.navigatorKey.currentContext!,
        e.message,
      );
      emit(state.copyWith(
        signUpStatus: AuthStatus.failure,
        message: e.message,
      ));
    } catch (e) {
      SnackBarUtils.errorSnackBar(
        NavigatorService.navigatorKey.currentContext!,
        'An error occurred. Please try again later.',
      );
      emit(state.copyWith(
        signUpStatus: AuthStatus.failure,
        message: 'An error occurred. Please try again later.',
      ));
    }
  }
}
