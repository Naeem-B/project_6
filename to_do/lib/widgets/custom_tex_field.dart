import 'package:flutter/material.dart';

class Custom_text_field extends StatelessWidget {
  Custom_text_field({
    super.key,
    required this.hint, 
  });
  dynamic hint;


  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
          fillColor: Color(0xffffffff),
          hintText: hint,
          filled: true,
          
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
          )),
    );
  }
}
