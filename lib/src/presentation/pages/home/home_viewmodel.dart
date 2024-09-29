import 'package:flutter/foundation.dart';

import '../../../domain/uses_cases/auth/auth_usecases.dart';

class HomeViewModel extends ChangeNotifier {

  AuthUseCases _authUseCases;
  
  int _currentIndex = 0;///almacena el valor de la pantalla a utilizar
  int get currentIndex => _currentIndex;


  HomeViewModel(this._authUseCases);

  set currentIndex(int index) {
    _currentIndex = index;
    notifyListeners();
  }

  logout() async{
    await _authUseCases.logout.launch();
  }

}