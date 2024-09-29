


import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../../../domain/uses_cases/auth/auth_usecases.dart';
import '../../../../domain/utils/resource.dart';
import '../../../utils/validation_item.dart';
import 'login_state.dart';

class LoginViewModel extends ChangeNotifier {

  //states
  LoginState _state = LoginState();

  StreamController<Resource> _responseController = StreamController<Resource>();///se agrega un stream controller para que maneje los estados
  Stream<Resource> get response => _responseController.stream;

  //getters
  LoginState get state => _state;
  AuthUseCases _authUseCases;

  LoginViewModel(this._authUseCases){
    // final user = this._authUseCases.getUser.userSession;
    // if(user != null)
    // {
    //   responseState = Success(user);
    // }
    // print('user session: ${_authUseCases.getUser.userSession}');
  }//constructor inyectamos dependencias

   //setter
  void changeEmail(String value){
    _responseController.add(Init());///regresamos el responseController a su valor inicial
    final bool emailFormatValid =
    RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(value);

    if (!emailFormatValid) {
      _state = _state.copyWith(email: ValidationItem(error: 'No es un email'));
    }
    //  if (value.length == 10 ) {
    //   _state = _state.copyWith(email: ValidationItem(value: value, error: ''));
    // }
    else {
     // _state = _state.copyWith(email: ValidationItem(error: 'Al menos 6 caracteres'));
      _state = _state.copyWith(email: ValidationItem(value: value, error: ''));
    }
    notifyListeners();
  }

  changePassword(String value) {
    _responseController.add(Init());///regresamos el responseController a su valor inicial
    if (value.length >= 6) {
      _state = _state.copyWith(password: ValidationItem(value: value, error: ''));
    }
    else {
      _state = _state.copyWith(password: ValidationItem(error: 'Al menos 6 caracteres'));
    }
    notifyListeners();
  }

  void login() async
  {
    if (state.isValid()) {
      _responseController.add(Loading());
      final data  = await _authUseCases.login.launch(
          email: _state.email.value,
          password: _state.password.value
      ); // SUCCESS - ERROR
      _responseController.add(data);
    }
    // if (state.isValid()){
    //   responseState= Loading();//esperando la respuesta
    //   notifyListeners();
    //   responseState = await _authUseCases.login.launch(
    //       email: _state.email.value,
    //       password: _state.password.value
    //   );
    //   notifyListeners();//refresca la pantalla login_page cada vez que se ejecuta
    //   //final data = await _firebaseAuth.signInWithEmailAndPassword(email: _state.email.value, password: _state.password.value);
    //   print('email ${_state.email.value}');
    //   print('pasw ${_state.password.value}');
    //   print('data ${responseState}');
    // }
  }

  //regresa el estado a su forma inicial
  // resetStateResponse(){
  //   responseState = Init();
  //   notifyListeners();
  // }

}