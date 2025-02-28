import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Smalltext extends StatelessWidget {
  const Smalltext({super.key, required this.text, required this.clr});
final String text;
final Color clr;


  @override
  Widget build(BuildContext context) {
    
    return Text(text,style: GoogleFonts.poppins(fontSize: 12,fontWeight: FontWeight.w500,color: clr),);
  }
}