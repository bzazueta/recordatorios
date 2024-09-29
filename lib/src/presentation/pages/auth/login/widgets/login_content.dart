import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:think_back/src/presentation/widgets/defaul_textfield2.dart';

import '../../../../widgets/default_button.dart';
import '../../../../widgets/default_textfield.dart';
import '../login_viewmodel.dart';


class LoginContent extends StatelessWidget {

  TextEditingController phoneEditingController = TextEditingController();
  TextEditingController pswEditingController = TextEditingController();
  LoginViewModel vm;

  LoginContent(this.vm);

  @override
  Widget build(BuildContext context) {

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ClipPath(
          clipper: WaveClipperTwo(),
          child: Container(
            height: MediaQuery.of(context).size.height * 0.20,
            color: Colors.amber,
            child: Row(
              children: [

              ],
            ),
          ),
        ),
        Container(
          margin: const EdgeInsets.only(left: 15,top:15),
          child: const Text('Bienvenido',
            style: TextStyle(fontSize: 24),
          ),
        ),
        Container(
          margin: const EdgeInsets.only(left: 15),
          child: const Text('Empezemos',
              style: TextStyle(fontSize: 26,
                  fontWeight: FontWeight.bold)
          ),
        ),
        Spacer(),
        Container(
          margin: const EdgeInsets.only(left: 15),
          // child:  TextField(
          //     //controller: phoneEditingController,
          //     onChanged: (value){
          //        vm.changeEmail(value);//metodo del viewmodel
          //     },
          //     decoration: const InputDecoration(
          //         label: Text('Celular'),
          //         suffixIcon:  Icon(Icons.phone_android_outlined,
          //           color: Colors.black,)
          //     )),//
          child: DefaultTextField2(
            label:'Email',
            icon:Icons.phone_android_outlined,
            onChanged: (value) {
              vm.changeEmail(value);
            },
            error: vm.state.email.error,
            color: Colors.black,
          ),
        ),
        Container(
          margin: const EdgeInsets.only(left: 15),
          // child: TextField(
          //   controller: pswEditingController,
          //   decoration: const InputDecoration(
          //   label: Text('Contraseña'),
          //   suffixIcon:  Icon(Icons.lock_outline,
          //   color: Colors.black,)
          //   )),
          child: DefaultTextField2(
            label:'Contraseña',
            icon:Icons.lock_outline,
            onChanged: (value) {
            vm.changePassword(value);
            },
            error: vm.state.password.error,
            color: Colors.black,
          )
        ),
        Container(
          width: double.infinity,
          margin: const EdgeInsets.symmetric(horizontal: 15,vertical: 35),
          child: DefaultButton(text:'Iniciar Sesion', onPressed: (){
             // print(phoneEditingController.text);
             // print(pswEditingController.text);
            vm.login();
          }),
        ),
        Container(
            alignment: Alignment.center,
            margin: EdgeInsets.only(bottom: 40),
            child: GestureDetector(
              onTap: (){
                Navigator.pushNamed(context, 'register');
              },
              child: const Text('¿No tienes cuenta? registrate',
                style: TextStyle(
                    color: Colors.black
                ),),
            )
        )
      ],
    );
  }
}
