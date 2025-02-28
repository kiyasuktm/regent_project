import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Midtext extends StatelessWidget {
  const Midtext({super.key, required this.text, required this.clr});
  final String text;
  final Color clr;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: GoogleFonts.poppins(
          fontSize: 18, fontWeight: FontWeight.w400, color: clr),
    );
  }
}
