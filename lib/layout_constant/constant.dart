import 'package:flutter/material.dart';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

const kPrimaryColor=Color(0xff753d47);




//text_template


class text_template extends StatelessWidget {
  final String text;
  final Color color;
  final double size;

  const text_template({required this.text, required this.color, required this.size})
      ;
  @override
  Widget build(BuildContext context) {
    return Text(text, style: GoogleFonts.roboto(color: color, fontSize: size));
  }
}