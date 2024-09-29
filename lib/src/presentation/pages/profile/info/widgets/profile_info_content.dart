import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';

import '../../../../../../injection.dart';
import '../../../../../../main.dart';
import '../../../../../domain/models/user_data.dart';
import '../../../../../domain/uses_cases/auth/auth_usecases.dart';
import '../../../../widgets/default_button.dart';
import '../profile_info_viewmodel.dart';


class ProfileInfoContent extends StatelessWidget {
  
  UserData userData;
  ProfileInfoViewModel vm;

  ProfileInfoContent(this.vm, this.userData);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          children: [
            ClipPath(
              clipper: DiagonalPathClipperTwo(),
              child: Image.asset(
                'assets/img/background.jpg', 
                height: 300,
                width: double.infinity, 
                fit: BoxFit.cover,
                colorBlendMode: BlendMode.darken,
                color: Colors.black38,
              ),
            ),            
            Column(              
              children: [
                Container(
                  margin: const EdgeInsets.only(top: 60, bottom: 80),
                  width: double.infinity,
                  child: const Text(
                    'Perfil de usuario',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                      fontWeight: FontWeight.bold
                    ),                  
                    textAlign: TextAlign.center,
                  ),
                ),
                CircleAvatar(
                  radius: 80,
                  backgroundColor: Colors.white,
                   backgroundImage: userData.image.isNotEmpty
                   ? NetworkImage(userData.image)
                   : const AssetImage(
                    'assets/img/user_image.png',                  
                  ) as ImageProvider,
                )                
              ],
            )
          ],
        ),
        Container(
          margin: const EdgeInsets.only(top: 40),
          child:  Text(
            userData.username,
            style: const TextStyle(
              color: Colors.black,
              fontSize: 22,
              fontWeight: FontWeight.bold
            ),
          ),
        ),
        Container(
          margin: const EdgeInsets.only(top: 5),
          child:  Text(
            userData.email,
            style: const TextStyle(
              color: Colors.amber,
              fontSize: 17
            ),
          ),
        ),
        const Spacer(),
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 40),
          child: DefaultButton(
            onPressed: () {
              Navigator.pushNamed(
                context,
                'profile/update',
                arguments: userData
              );
            },
            text: 'Editar datos',
            icon: Icons.edit,
            color: Colors.white,

          ),
        ),
        Container(
          margin: const EdgeInsets.only(left: 40, right: 40, top: 20, bottom: 50),
          child: DefaultButton(
            text: 'Cerrar sesion',
            onPressed: () async {
              await vm.logout();
              //Navigator.pushNamedAndRemoveUntil(context, 'login', (route) => false);
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => MyApp(locator<AuthUseCases>()),),
                (route) => false
              );
            },
            icon: Icons.power_settings_new,
          ),
        ),
        
      ],
    );
  }
}