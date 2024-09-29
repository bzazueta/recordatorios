import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:think_back/src/presentation/pages/posts/create/posts_create_state.dart';

import '../../../../domain/uses_cases/auth/auth_usecases.dart';
import '../../../../domain/uses_cases/post/posts_usecases.dart';
import '../../../../domain/utils/resource.dart';
import '../../../utils/validation_item.dart';

class PostsCreateViewModel extends ChangeNotifier {

  PostsCreateState _state = PostsCreateState();
  PostsCreateState get state => _state;///obtenemos el estado de la validacion del formulario

  File? _imageFile;
  File? get imageFile => _imageFile;

  AuthUseCases _authUseCases;
  PostsUseCases _postsUseCases;

  Resource _response = Init();
  Resource get response => _response;///obtenemos el estado de la peticion al repository

  TextEditingController nameController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

  PostsCreateViewModel(this._authUseCases,this._postsUseCases) {
    _state = _state.copyWith(idUser: _authUseCases.getUser.userSession?.uid ?? '');///obtenemos el id del inicio de sesion con firebase
  }

  createPost() async {
    if (_state.isValid()) {
      print('FORMULARIO VALIDO');
      _response = Loading();
      notifyListeners();
      _response = await _postsUseCases.create.launch(_state.toPost(), _state.image!);
      notifyListeners();
    }
    else {
      _state = _state.copyWith(error: 'Debes completar todos los campos');
      print('FORMULARIO NO VALIDO');
      notifyListeners();
    }
  }

  changeName(String value) {
    if (value.length >= 3) {
      _state = _state.copyWith(name: ValidationItem(value: value, error: ''));
    }
    else {
      _state = _state.copyWith(name: ValidationItem(error: 'Al menos 3 caracteres'));
    }
    notifyListeners();
  }

  changeDescription(String value) {
    if (value.length >= 6) {
      _state = _state.copyWith(description: ValidationItem(value: value, error: ''));
    }
    else {
      _state = _state.copyWith(description: ValidationItem(error: 'Al menos 6 caracteres'));
    }
    notifyListeners();
  }

  changeRadioCategory(String value) {
    _state = _state.copyWith(category: value);
    print('Radio: ${_state.category}');
    notifyListeners();
  }

  Future<void> pickImage() async {
    final ImagePicker picker = ImagePicker();    
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      _imageFile = File(image.path);
      _state = _state.copyWith(image: _imageFile);
      notifyListeners();
    }
  }

  Future<void> takePhoto() async {
    final ImagePicker picker = ImagePicker();    
    final XFile? image = await picker.pickImage(source: ImageSource.camera);
    if (image != null) {
      _imageFile = File(image.path);
      _state = _state.copyWith(image: _imageFile);///pasamos la imagen al state
      notifyListeners();
    }
  }

  resetResponse() {
    _response = Init();    
    notifyListeners();
  }

  resetState() {
    _state = PostsCreateState();///resetea el estado
    nameController.clear();///limpia los textfields
    descriptionController.clear();///limpia los textfields
    notifyListeners();///notifica a provider en post_page
  }

}