import 'package:flutter/material.dart';

class Postscategory extends StatelessWidget {

  String value;
  String groupValue;
  Function(String value) onChanged;
  String imagePath;

  Postscategory({
    required this.value,
    required this.groupValue,
    required this.onChanged,
    required this.imagePath,    
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 5, top: 15),
      child: Row(
        children: [
          Radio(              
            value: value, 
            groupValue: groupValue, 
            activeColor: Colors.amber,
            onChanged: (value) {
              onChanged(value ?? '');
            }
          ),
          Container(
            width: 130,
            child: Text(
              value,
              style: const TextStyle(
                color: Colors.black,
                fontSize: 17
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(left: 25),
            child: Image.asset(
              'assets/img/icon_pc.png',
              width: 40,
              height: 40,
              color: Colors.black,
            ) ,
          )
        ],
      ),
    );
}
}