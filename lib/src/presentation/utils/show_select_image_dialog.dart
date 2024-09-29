import 'package:flutter/material.dart';

showSelectImageDialog(BuildContext context, Function() pickImage, Function() takePhoto) {

  return showDialog(
    context: context, 
    builder: (BuildContext context) => AlertDialog(
      title: Text('Selecciona una opcion'),
      actions: [
        ElevatedButton(
          onPressed: () { 
            Navigator.pop(context);
            pickImage(); 
          }, 
          child: const Text(
            'Galeria',
            style: TextStyle(
              color: Colors.black
            ),
          )
        ),
        ElevatedButton(
          onPressed: () { 
            Navigator.pop(context);
            takePhoto(); 
          }, 
          child: const Text(
            'Camara',
            style: TextStyle(
              color: Colors.black
            ),
          )
        ),
      ],
    ));
  
}