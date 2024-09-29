

import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:think_back/injection.config.dart';

//este archivo inicializa la inyeccion de dependencias en  nuestro proyecto
//despues de crear este archivo hay que correr esta linea  'flutter packages pub run build_runner build' debe generar el archivo injection config
final locator = GetIt.instance;

@InjectableInit()
Future<void> configureDependecies() async => await locator.init();