import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';

import '../../../../../domain/models/post.dart';
import '../../../../utils/show_select_image_dialog.dart';
import '../../../../widgets/defaul_textfield2.dart';
import '../../../../widgets/default_button.dart';
import '../../../../widgets/default_textfield.dart';
import '../../create/widget/posts_category.dart';
import '../posts_update_viewmodel.dart';



class PostsUpdateContent extends StatelessWidget {

  PostsUpdateViewModel vm;
  Post postArg;

  PostsUpdateContent(this.vm, this.postArg);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipPath(
            clipper: WaveClipperTwo(),
            child: Container(
              height: MediaQuery.of(context).size.height * 0.35,
              color: Colors.amber,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  
                  GestureDetector(
                    onTap: () {
                      showSelectImageDialog(
                        context, 
                        vm.pickImage,
                        vm.takePhoto
                      );
                    },
                    child: vm.imageFile != null 
                    ? Image.file(
                      vm.imageFile!, 
                      width: double.infinity,
                      height: MediaQuery.of(context).size.height * 0.35,
                      fit: BoxFit.cover,
                    )
                    : vm.state.image.isNotEmpty 
                      ? Image.network(
                        vm.state.image, // URL
                        width: double.infinity,
                        height: MediaQuery.of(context).size.height * 0.35,
                        fit: BoxFit.cover,
                      )
                      :  Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            margin: EdgeInsets.only(bottom: 10),
                            child: Image.asset(
                              'assets/img/gallery.png',
                              height: 150,
                              width: 150,
                            ),
                          ),
                          Text(
                            'SELECCIONA UNA IMAGEN',
                            style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold
                            ),
                          )
                        ],
                      ),
                  ),
                  Container(
                    alignment: Alignment.topLeft,
                    margin: EdgeInsets.only(top: 50, left: 15),
                    child: IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      }, 
                      icon: Icon(
                        Icons.arrow_back_ios,
                        size: 32,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            )
          ),
          Container(
            margin: EdgeInsets.only(left: 20, right: 20),
            child: DefaultTextField2(
              initialValue: postArg.name,
              label: 'Nombre del juego', 
              icon: Icons.control_camera, 
              error: vm.state.name.error,
              onChanged: (value) {
                vm.changeName(value);
              }, color: Colors.black,
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 20, right: 20),
            child: DefaultTextField2(
              initialValue: postArg.description,
              label: 'Description', 
              icon: Icons.description, 
              error: 'vm.state.description.error',
              color: Colors.black,
              onChanged: (value) {
                vm.changeDescription(value);
              }
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 20, top: 15),
            child: Text(
              'CATEGORIAS',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold
              ),
            ),
          ),
          Postscategory(
            value: 'REUNION',
            groupValue: vm.state.category, 
            onChanged: (value) {
              vm.changeRadioCategory(value);
            }, 
            imagePath: 'assets/img/icon_pc.png'
          ),
          Postscategory(
            value: 'PAGOS',
            groupValue: vm.state.category, 
            onChanged: (value) {
              vm.changeRadioCategory(value);
            }, 
            imagePath: 'assets/img/icon_pc.png'
          ),
          Postscategory(
            value: 'EVENTOS',
            groupValue: vm.state.category, 
            onChanged: (value) {
              vm.changeRadioCategory(value);
            }, 
            imagePath: 'assets/img/icon_pc.png'
          ),
          Postscategory(
            value: 'PROMESAS',
            groupValue: vm.state.category, 
            onChanged: (value) {
              vm.changeRadioCategory(value);
            }, 
            imagePath: 'assets/img/icon_pc.png'
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Text(
              vm.state.error,
              style: TextStyle(
                color: Colors.red,
                fontSize: 16
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 20, right: 20, top: 10),
            child: DefaultButton(
              text: 'ACTUALIZAR POST', 
              onPressed: () {
                vm.updatePost();
              }
            ),
          )
        ],
      ),
    );
  }
}