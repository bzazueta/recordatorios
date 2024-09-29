import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:provider/provider.dart';

import '../../../../widgets/default_button.dart';
import '../../../../widgets/default_textfield.dart';
import '../register_viewmodel.dart';

class RegisterContent extends StatelessWidget {
  RegisterViewModel vm;
  RegisterContent(this.vm, {super.key});
  @override
  Widget build(BuildContext context) {
    //instanciamos viewmodel
    return Container(
      color: Colors.white,
      child: Column(
        children: [
          ClipPath(
            clipper: WaveClipperTwo(),
            child: Container(
              height: MediaQuery.of(context).size.height * 0.20,
              color: Colors.amber,
              child: Row(
                children: [
                  GestureDetector(
                    onTap:(){},// _con.finish, //_con.openDrawer,
                    child: Container(
                        margin: EdgeInsets.only(left: 0, top: 5),
                        alignment: Alignment.centerLeft,
                        child: IconButton(
                            onPressed: (){
                              Navigator.pop(context!);
                            },//_con.finish,
                            //_con.openDrawer,iconSize: 30,
                            icon: Icon(Icons.arrow_back_ios_new_outlined),
                            color: Colors
                                .black) //Image.asset('assets/img/menu.png', width: 20, height: 20),
                        ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(left: 15,top:15),
            child: const Text('Crea Tu Cuenta',
              style: TextStyle(fontSize: 24),
            ),
          ),
          Container(
            child: GestureDetector(
              onTap: (){},//_con.showAlertDialog,//,
              child: Container(
                color: Colors.white10,
                height: 75,
                child: const CircleAvatar(
                  backgroundImage: //_con.imagen != null && _con.imagen != 'sin imagen' && _con.imagen != ''
                                   //? NetworkImage(_con.imagen!) :
                  AssetImage('assets/img/user_image.png') as ImageProvider,
                  radius: 40,
                  backgroundColor: Colors.white,
                ),
              ),
            ),
          ),
          //Spacer(),
          SizedBox(height: 15,),
          Container(
            //height: 45,
            margin: EdgeInsets.symmetric(horizontal: 50, vertical: 5),
            decoration: BoxDecoration(
                color: Colors.amber.shade50,
                borderRadius: BorderRadius.circular(10)),
            child: TextField(
              //controller:con.nombreController,
              onChanged: (value){
                //pasamos el valor tecleado por el usuario al viewmodel
                 vm.changeUsername(value);
              },
              //keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                  hintText: 'Nombre Usuario',
                  errorText: vm.state.username.error,//pasamos el error del estado al textfields
                  errorStyle: TextStyle(height: 0),
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.all(15),
                  hintStyle: TextStyle(color: Colors.amber[800]),
                  prefixIcon: Icon(
                    Icons.person_sharp,
                    color: Colors.amber[800],
                  )
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 50, vertical: 5),
            decoration: BoxDecoration(
                color: Colors.amber.shade50,
                borderRadius: BorderRadius.circular(10)),
            child: TextField(
              //controller:con.nombreController,
              onChanged: (value){
                //pasamos el valor tecleado por el usuario al viewmodel
                vm.changePhone(value);
              },
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                  hintText: 'Correo',
                  errorText: vm.state.email.error,//pasamos el error del estado al textfields
                  errorStyle: TextStyle(height: 0),
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.all(15),
                  hintStyle: TextStyle(color: Colors.amber[800]),
                  prefixIcon: Icon(
                    Icons.person_sharp,
                    color: Colors.amber[800],
                  )),
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 50, vertical: 5),
            decoration: BoxDecoration(
                color: Colors.amber.shade50,
                borderRadius: BorderRadius.circular(10)),
            child: TextField(
              //controller:con.nombreController,
              onChanged: (value){
                //pasamos el valor tecleado por el usuario al viewmodel
                vm.changePassword(value);
              },
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                  hintText: 'Contraseña',
                  errorText: vm.state.password.error,//pasamos el error del estado al textfields
                  errorStyle: TextStyle(height: 0),
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.all(15),
                  hintStyle: TextStyle(color: Colors.amber[800]),
                  prefixIcon: Icon(
                    Icons.person_sharp,
                    color: Colors.amber[800],
                  )),
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 50, vertical: 5),
            decoration: BoxDecoration(
                color: Colors.amber.shade50,
                borderRadius: BorderRadius.circular(10)),
            child: TextField(
              //controller:con.nombreController,
              onChanged: (value){
                //pasamos el valor tecleado por el usuario al viewmodel
                vm.changeConfirmPassword(value);
              },
              obscureText: true,
              //keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                  hintText: 'Repetir Contraseña',
                  errorText: vm.state.confirmPassword.error,//pasamos el error del estado al textfields
                  errorStyle: TextStyle(height: 0),
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.all(15),
                  hintStyle: TextStyle(color: Colors.amber[800]),
                  prefixIcon: Icon(
                    Icons.person_sharp,
                    color: Colors.amber[800],
                  )),
            ),
          ),
          Container(
            width: double.infinity,
            margin: const EdgeInsets.only(left: 50, right: 50,top: 30,bottom: 20),
           // padding: const EdgeInsets.symmetric(vertical: 15),
            child: ElevatedButton(
              onPressed: (){
                vm.register();//se ejecuta el metodo register del viewmodel
              },//_con.editarPerfil,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.amber[800],
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                //primary: MyColor.primaryColor,
                // shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                // textStyle: TextStyle(fontSize: 30,
                //     fontWeight: FontWeight.bold)
              ),
              // _con.isEnable ? _con.createAsunto : (){print('pressed');},//devolon _con.register,// //delivery con.registerDelivery
              child: const Text('Crear Cuenta',
                  style: TextStyle(color: Colors.black),),
            ),
          ),
        ],
      ),
    );
  }
}
