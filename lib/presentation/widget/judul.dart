// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Widget Judul(String judul, String sub, tinggi, {num angka = 0}) {
  return Container(
    margin: EdgeInsets.only(bottom: tinggi * 0.02),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(judul,
            style: GoogleFonts.poppins(
                textStyle:
                    TextStyle(fontSize: 20, fontWeight: FontWeight.w600))),
        sub == "" && angka != 0 ? Row(children: [Icon(Icons.star, color: Colors.amberAccent), Text(angka.toString(), style: GoogleFonts.poppins(
                textStyle:
                    TextStyle(fontSize: 20, fontWeight: FontWeight.w600)))],)
        : Text(sub,
            style: GoogleFonts.poppins(
                textStyle: TextStyle(fontSize: 18, color: Colors.grey)))
      ],
    ),
  );
}
