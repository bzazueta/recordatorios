import 'package:flutter/material.dart';

class DefaultButton extends StatelessWidget {

  String text;
  IconData icon;
  Color color;
  Function() onPressed;

  DefaultButton({
    required this.text,
    required this.onPressed,
    this.icon = Icons.arrow_forward_ios,
    this.color = Colors.amber
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(            
      onPressed: onPressed,   
      style: ElevatedButton.styleFrom(
        backgroundColor: color,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15)
        )
      ),              
      child: Stack(
        children: [
          Container(
            height: 50,
            alignment: Alignment.center,
            child: Text(
              text,
              style: TextStyle(
                fontSize: 17,
                color: Colors.black
              ),
            )
          ),
          Container(
            height: 50,
            alignment: Alignment.centerRight,
            child: CircleAvatar(
              radius: 15,
              backgroundColor: Colors.black,
              child: Icon(
                icon,
                color: Colors.white,
              ),
            ),
          )
        ],
      )
    );
  }
}