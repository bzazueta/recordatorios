import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:think_back/src/presentation/pages/posts/create/widget/posts_category.dart';

import '../../../../utils/show_select_image_dialog.dart';
import '../../../../widgets/defaul_textfield2.dart';
import '../../../../widgets/default_button.dart';
import '../../../../widgets/default_textfield.dart';
import '../posts_create_viewmodel.dart';

class PostCreateContent extends StatelessWidget {

  PostsCreateViewModel vm;
  PostCreateContent(this.vm);

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
                            context, vm.pickImage, vm.takePhoto);
                      },
                      child: vm.state.image != null
                          ? Image.file(
                              vm.state.image!,
                              width: double.infinity,
                              height: MediaQuery.of(context).size.height * 0.35,
                              fit: BoxFit.cover,
                            )
                          : Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  margin: const EdgeInsets.only(bottom: 10),
                                  child: Image.asset(
                                    'assets/img/gallery.png',
                                    height: 150,
                                    width: 150,
                                  ),
                                ),
                                const Text(
                                  'SELECCIONA UNA IMAGEN',
                                  style: TextStyle(
                                      fontSize: 22,
                                      fontWeight: FontWeight.bold),
                                )
                              ],
                            ),
                    ),
                    Container(
                      alignment: Alignment.topLeft,
                      margin: const EdgeInsets.only(top: 50, left: 15),
                      child: IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: const Icon(
                          Icons.arrow_back_ios,
                          size: 32,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              )),
          Container(
            margin: const EdgeInsets.only(left: 20, right: 20),
            child: DefaultTextField2(
                controller: vm.nameController,
                // initialValue: vm.state.name.value,
                label: 'Nombre del juego',
                icon: Icons.control_camera,
                error: vm.state.name.error,
                onChanged: (value) {
                  vm.changeName(value);
                }, color: Colors.black,
            ),
          ),
          Container(
            margin: const EdgeInsets.only(left: 20, right: 20),
            child: DefaultTextField2(
                controller: vm.descriptionController,
                // initialValue: vm.state.description.value,
                label: 'Description',
                icon: Icons.description,
                error: vm.state.description.error,
                onChanged: (value) {
                  vm.changeDescription(value);
                }, color: Colors.black,
            ),
          ),
          Container(
            margin: const EdgeInsets.only(left: 20, top: 15),
            child: const Text(
              'CATEGORIAS',
              style: TextStyle(
                  color: Colors.black,
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
            margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child:  Text(
              vm.state.error,
              style: const TextStyle(
                  color: Colors.red,
                  fontSize: 16
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(left: 20, right: 20, top: 10),
            child: DefaultButton(
                text: 'CREAR POST',
                onPressed: () {
                  vm.createPost();
                }
            ),
          )
        ],
      ),
    );
  }
}
