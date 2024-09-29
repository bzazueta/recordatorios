

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';
import 'package:think_back/src/core/constants.dart';

import '../../domain/models/user_data.dart';
import '../../domain/repository/auth_repository.dart';
import '../../domain/utils/resource.dart';


@Injectable(as: AuthRepository)//para injectar este archivo en llas clases
class AuthRepositoryImpl implements AuthRepository {
  FirebaseAuth _firebaseAuth;
  CollectionReference usersRef;
  ///constructor injecta dependencias firebaseAuth para usarla en el login
  AuthRepositoryImpl(
       this._firebaseAuth,
      @Named(USERS) this.usersRef
  );

  @override
  Future<Resource> login ({required String email, required String password}) async {
    try
    {
      UserCredential data = await _firebaseAuth.signInWithEmailAndPassword(email: email, password: password);
      return Success(data);
    }on FirebaseAuthException catch(e)
    {
      return Error(e.message ?? 'Error desconocido');
    }
  }

  @override
  Future<void> logout() async{
   await _firebaseAuth.signOut();
  }

  @override
  // TODO: implement user
  User? get user => _firebaseAuth.currentUser;///obtenemos el usuario logueado de firebase

  @override
  Future<Resource> register(UserData user) async{
    try
    {
      //registramos el usuario en firebase
      UserCredential data = await _firebaseAuth.createUserWithEmailAndPassword(
          email: user.email,
          password: user.password);
           user.password = "";
          user.id = data.user?.uid ?? '';//obtenemos el id del usuario regsitrado
          print('user.id: ${user.id.toString()}');
          await usersRef.doc(user.id.toString()).set(user.toJson());//se guardan lod datos del usuario en firestore en un documento
      return Success(data);
    }on FirebaseAuthException catch(e)
    {
      print('errror: ${e.message}');
      return Error(e.message ?? 'Error desconocido');
    }on FirebaseException catch(e1)
    {
      print('error: ${e1.message}');
      return Error(e1.message ?? 'Error desconocido');
    }
  }
  
  // FirebaseAuth _firebaseAuth;
  // //CollectionReference _usersRef;
  //
  // AuthRepositoryImpl(
  //   this._firebaseAuth,
  //   @Named(USERS) this._usersRef
  // );
  //
  // @override
  // Future<Resource> login({required String email, required String password}) async {
  //   try {
  //     UserCredential data = await _firebaseAuth.signInWithEmailAndPassword(email: email, password: password);
  //     return Success(data);
  //   } on FirebaseAuthException catch(e) {
  //     return Error(e.message ?? 'Error desconocido');
  //   }
  // }
  //
  // @override
  // Future<Resource> register(UserData user) async {
  //   try {
  //     UserCredential data = await _firebaseAuth.createUserWithEmailAndPassword(
  //       email: user.email,
  //       password: user.password
  //     );
  //     // user.password = "";
  //     user.id = data.user?.uid ?? '';
  //
  //     await _usersRef.doc(user.id).set(user.toJson());
  //     return Success(data);
  //   } on FirebaseAuthException catch(e) {
  //     return Error(e.message ?? "Error desconocido");
  //   }
  // }
  //
  // @override
  // User? get user => _firebaseAuth.currentUser;
  //
  // @override
  // Future<void> logout() async {
  //   await _firebaseAuth.signOut();
  // }

}