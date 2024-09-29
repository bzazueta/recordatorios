
import 'dart:async';

import 'package:flutter/material.dart';

import '../../../../domain/uses_cases/auth/auth_usecases.dart';
import '../../../../domain/utils/resource.dart';
import '../../../utils/validation_item.dart';
import 'register_state.dart';


class RegisterViewModel extends ChangeNotifier {

  // ESTADO
  RegisterState _state = RegisterState();
  RegisterState get state => _state;

  StreamController<Resource> _responseController = StreamController<Resource>();
  Stream<Resource> get response => _responseController.stream;


  //INYECTAMOS DEPENDENCIAS
  AuthUseCases _authUseCases;
  RegisterViewModel(this._authUseCases);


  register() async {
    if (_state.isValid()) {
      _responseController.add(Loading());
      final data  = await _authUseCases.register.launch(_state.toUser()); // SUCCESS - ERROR
      _responseController.add(data);
    }
  }

  changePhone(String value) {
    _responseController.add(Init());
    final bool emailFormatValid =
    RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(value);

    if (value.isEmpty) {
      //enviamos el valor a estado
      _state = _state.copyWith(email: ValidationItem(error: 'Ingrese su celular'));
    }
    else if (value.length >= 10) {
      _state = _state.copyWith(email: ValidationItem(value: value, error: ''));
    }
    else {
      _state = _state.copyWith(email: ValidationItem(error: 'Al menos 10 caracteres'));
    }
    notifyListeners();
  }

  changeUsername(String value) {
    _responseController.add(Init());
    if (value.length >= 3) {
      _state = _state.copyWith(username: ValidationItem(value: value, error: ''));
    }
    else if(value.length == 0){
      _state = _state.copyWith(username: ValidationItem(value: value, error: ''));
    }
    else {
      _state = _state.copyWith(username: ValidationItem(error: 'Al menos 3 caracteres'));
    }
    notifyListeners();
  }

  changePassword(String value) {
    _responseController.add(Init());
    if (value.length >= 6) {
      _state = _state.copyWith(password: ValidationItem(value: value, error: ''));
    }
    else {
      _state = _state.copyWith(password: ValidationItem(error: 'Al menos 6 caracteres'));
    }
    notifyListeners();
  }

  changeConfirmPassword(String value) {
    _responseController.add(Init());
    if (value.length >= 6) {
      _state = _state.copyWith(confirmPassword: ValidationItem(value: value, error: ''));
    }
    else {
      _state = _state.copyWith(confirmPassword: ValidationItem(error: 'Al menos 6 caracteres'));
    }
    notifyListeners();
  }

}