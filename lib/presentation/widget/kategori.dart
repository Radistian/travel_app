// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Widget Kategori(String name, String img, lebar) {
  return Container(
    padding: EdgeInsets.all(10),
    decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(20)),
    child: Row(
      children: [
        Container(
            margin: EdgeInsets.only(right: lebar * 0.01),
            child: Image.network(img, width: 20, height: 20)),
        Text(name,
            style: GoogleFonts.poppins(
                textStyle:
                    TextStyle(fontSize: 20, fontWeight: FontWeight.w600))),
      ],
    ),
  );
}
