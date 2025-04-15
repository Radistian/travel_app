  // ignore_for_file: unused_element, non_constant_identifier_names

import 'package:flutter/material.dart';

Widget BuildGalleryPhoto(String imagePath) {
  return Container(
    margin: EdgeInsets.only(right: 10),
    width: 150,
    height: 150,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(10),
      image: DecorationImage(
        image: AssetImage(imagePath),
        fit: BoxFit.cover,
      ),
    ),
  );
}
