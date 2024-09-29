import 'dart:io';
import 'package:path/path.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:injectable/injectable.dart';
import 'package:think_back/src/domain/models/user_data.dart';
import 'package:think_back/src/domain/repository/users_repository.dart';
import 'package:think_back/src/domain/utils/resource.dart';

import '../../core/constants.dart';

@Injectable(as: UsersRepository)
class UsersRepositoryImpl implements UsersRepository{

  CollectionReference _usersRef;
  Reference _usersStorageRef; ///firebase storage

  UsersRepositoryImpl(
      @Named(USERS) this._usersRef,
      @Named(USERS) this._usersStorageRef
      );

  @override
  Stream<Resource<UserData>> getUserById(String id) {
    try {
      final data = _usersRef.doc(id).snapshots(includeMetadataChanges: true);///obtenemos el documento de firebase
      ///catseamos la data del docuemto a Success para retonar el estado.
      ///debe retornar tipo de datos Stream
      ///a as Map<String, dynamic>)
      final dataMap = data.map((doc) => Success(UserData.fromJson(doc.data() as Map<String, dynamic>)));
      return dataMap;
    } on FirebaseException catch (e) {
    throw Error(e.message ?? 'Error desconocido');
    }
  }

  @override
  Future<UserData> getUserByIdOnce(String id) async{
    try {//obtenemos la infromacion una sola vez
      final document = await _usersRef.doc(id).get();///le pasamos el id y nos trae un solo registro
      if (document.exists) {///data contiene informacion
        UserData userData = UserData.fromJson(document.data() as Map<String, dynamic>);///creamos un user data json to userdata
        return userData;
      }
      return UserData();
    } on FirebaseException catch (e) {
      throw Error(e.message ?? 'Error desconocido');
    }
  }

  @override
  Future<Resource<String>> updateWithImage(UserData userData, File image) async {
    try {
      String name = basename(image.path);
      ///objeto TaskSnapshot para subir la imagen a firebase storage
      TaskSnapshot uploadTask = await _usersStorageRef.child(name).putFile(image, SettableMetadata(
        contentType: 'image/png',
      ));
      ///obtenemos la url de la imagen guardada
      String url = await uploadTask.ref.getDownloadURL();
      ///mapeamos datos
      Map<String, dynamic> map = {
        'username': userData.username,
        'email': userData.email,
        'image': url,
      };
      ///actualizamos o complementamos datos del usuario y le pasamos el id
      final data = await _usersRef.doc(userData.id).update(map);
      return Success('El usuario se ha actualizado correctamente');
    } on FirebaseException catch (e) {
      return Error(e.message ?? 'Error desconocido');
    }
  }

  @override
  Future<Resource<String>> updateWithoutImage(UserData userData) async{
    try {
      Map<String, dynamic> map = {
        'username': userData.username,
        'email': userData.email,
        'image': userData.image,
      };
      final data = await _usersRef.doc(userData.id).update(map);
      return Success('El usuario se ha actualizado correctamente');
    } on FirebaseException catch (e) {
      return Error(e.message ?? 'Error desconocido');
    }

  }

}