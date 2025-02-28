import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Bitext extends StatelessWidget {
  const Bitext({super.key, required this.text, required this.clr});
  final String text;
  final Color clr;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: GoogleFonts.poppins(
          fontSize: 58, fontWeight: FontWeight.w700, color: clr),
    );
  }
}
