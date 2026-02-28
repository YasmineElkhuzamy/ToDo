import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:untitled/ThirdScreen.dart';

class CustomTextFormField extends StatelessWidget
{
  const CustomTextFormField({
    super.key,
    required this. Controller,
    required this .hint,
    required this. title,
    required this. maxlines, this.validator,

});

   final TextEditingController Controller;
   final String hint;
  final String title;
  final FormFieldValidator<String>? validator;
  final int maxlines;
  @override
  Widget build(BuildContext context) {
    return
      Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
        Text(title,
            style: GoogleFonts.poppins(color: Colors.black,fontSize: 16,fontWeight: FontWeight.w500)
          ),
        const SizedBox(height: 15),
        TextFormField(maxLines: maxlines,
          validator: validator,
          controller: Controller,
          style:TextStyle(color: Colors.black),
            decoration:  InputDecoration(focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(16),
                borderSide: BorderSide(color: Colors.black12)),border:
            OutlineInputBorder(borderRadius: BorderRadius.circular(16)),
                filled: true,fillColor: Colors.white12,hintText:hint,hintStyle: TextStyle(color: Colors.black26)),
        )

      ],);

  }
}