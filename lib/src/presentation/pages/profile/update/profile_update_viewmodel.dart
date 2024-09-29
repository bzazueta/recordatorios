import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../domain/models/user_data.dart';
import '../../../../domain/uses_cases/users/users_usecases.dart';
import '../../../../domain/utils/resource.dart';
import '../../../utils/validation_item.dart';
import 'profile_update_state.dart';


class ProfileUpdateViewModel extends ChangeNotifier {
  
  UsersUseCase _usersUseCase;

  ProfileUpdateState _state = ProfileUpdateState();
  ProfileUpdateState get state => _state; //devuelve lo que trae el estado del formulario

  Resource _response = Init();
  Resource get response => _response;

  File? _imageFile;
  File? get imageFile => _imageFile;

  ProfileUpdateViewModel(this._usersUseCase);

  update() async {
    if (_state.isValid()) {
      _response = Loading();
      notifyListeners(); // DIALOG ESPERAR
      if (_imageFile == null) {
        _response = await _usersUseCase.updateWithoutImage.launch(_state.toUser());
      }
      else {
        _response = await _usersUseCase.updateWithImage.launch(_state.toUser(), _imageFile!);
      }
      notifyListeners();
    }
  }

  Future<void> pickImage() async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      _imageFile = File(image.path);
      notifyListeners();
    }
  }

  Future<void> takePhoto() async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.camera);
    if (image != null) {
      _imageFile = File(image.path);
      notifyListeners();
    }
  }


  loadData(UserData userData) {
    print('Argumentos: ${userData.toJson()}');
    _state = _state.copyWith(
      id: ValidationItem(value: userData.id),//pasamos los valores al ValidationItem
      username:  ValidationItem(value: userData.username),
      email:  ValidationItem(value: userData.email),
      image:  ValidationItem(value: userData.image),
    );
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      notifyListeners();
    });
  }

  changeUsername(String value) {
    if (value.length >= 3) {
      _state = _state.copyWith(username: ValidationItem(value: value, error: ''));
    }
    else {
      _state = _state.copyWith(username: ValidationItem(error: 'Al menos 3 caracteres'));
    }
    notifyListeners();
  }

  void changeEmail(String value){
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


  resetResponse() {
    _response = Init();
    notifyListeners();
  }

}