
import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';

import '../../../../../domain/models/user_data.dart';
import '../../../../utils/show_select_image_dialog.dart';
import '../../../../widgets/defaul_textfield2.dart';
import '../../../../widgets/default_button.dart';
import '../../../../widgets/default_textfield.dart';
import '../profile_update_viewmodel.dart';


class ProfileUpdateContent extends StatefulWidget {

  UserData userData;
  ProfileUpdateViewModel vm;

  ProfileUpdateContent(this.vm,this.userData);

  @override
  State<ProfileUpdateContent> createState() => _ProfileUpdateContentState();
}

class _ProfileUpdateContentState extends State<ProfileUpdateContent> {

  @override
  void initState() {
    widget.vm.loadData(widget.userData); // mandamos llamarlo UNA VEZ como tipo on create onstart onresume en android
    super.initState();
  }

  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          children: [
            ClipPath(
              clipper: OvalBottomBorderClipper(),
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
                  margin: EdgeInsets.only(top: 60, bottom: 80),
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
                GestureDetector(
                  onTap: () {
                    showSelectImageDialog(
                        context,
                        widget.vm.pickImage,
                        widget.vm.takePhoto
                    );
                  },
                  child: CircleAvatar(
                    radius: 80,
                    backgroundColor: Colors.white,
                    backgroundImage: widget.vm.imageFile != null
                        ? FileImage(widget.vm.imageFile!)
                        : widget.userData.image.isNotEmpty
                        ? NetworkImage(widget.userData.image)
                        : AssetImage('assets/img/user_image.png') as ImageProvider,
                  ),
                ),
              ],
            ),
            Container(
              margin: EdgeInsets.only(top: 40, left: 20),
              child: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(
                    Icons.arrow_back_ios,
                    color: Colors.white,
                    size: 30,
                  )
              ),
            ),
          ],
        ),
        Expanded(
          child: Container(
            margin: const EdgeInsets.only(left: 30, right: 30, top: 50),
            child: DefaultTextField2(
              label: 'Nombre de usuario',
              initialValue: widget.vm.state.username.value,
              error: widget.vm.state.username.error,
              icon: Icons.person_2_outlined,
              onChanged: (value) {
                widget.vm.changeUsername(value);
              }, color: Colors.black,
            ),
          ),
        ),
        Expanded(
          child: Container(
            margin: EdgeInsets.only(left: 30, right: 30, top: 50),
            child: DefaultTextField2(
              label: 'email',
              initialValue: widget.vm.state.email.value,
              error: widget.vm.state.email.error,
              icon: Icons.person_2_outlined,
              onChanged: (value) {
                widget.vm.changeEmail(value);
              }, color: Colors.black,
            ),
          ),
        ),
        Spacer(),
        Container(
          margin: EdgeInsets.only(left: 40, right: 40, top: 20, bottom: 50),
          child: DefaultButton(
            text: 'Actualizar informacion',
            onPressed: () {
              widget.vm.update();
            },
            icon: Icons.edit,
          ),
        ),

      ],
    );
  }
}
