import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Widget Wisata(String img, String name, String place, String rating, tinggi,
    lebar, context , bool status) {
  return InkWell(
    onTap: () {},
    child: Stack(
      children: [
        Container(
          height: tinggi * 0.35,
          width: lebar * 0.45,
          decoration: BoxDecoration(
              image: DecorationImage(image: NetworkImage(img), fit: BoxFit.cover),
              borderRadius: BorderRadius.circular(20)),
        ),
        Container(
          height: tinggi * 0.35,
          width: lebar * 0.45,
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  colors: [Colors.transparent, Colors.black26],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter),
              borderRadius: BorderRadius.circular(20)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                margin: EdgeInsets.only(top: 10, right: 10),
                alignment: Alignment.topRight,
                child: CircleAvatar(
                  backgroundColor: Colors.white,
                  child: Icon(
                    Icons.favorite,
                    color: Colors.grey,
                    size: 20,
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: EdgeInsets.only(bottom: 10),
                      child: Text(name,
                          style: GoogleFonts.poppins(
                              textStyle: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.white))),
                    ),
                    Container(
                      margin: EdgeInsets.only(bottom: 10),
                      child: Row(
                        children: [
                          Container(
                              margin: EdgeInsets.only(right: 3),
                              child: Icon(Icons.place_outlined,
                                  color: Colors.white)),
                          Expanded(
                            child: Text(place,
                                style: GoogleFonts.poppins(
                                    textStyle: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w300,
                                        color: Colors.white))),
                          )
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(bottom: 10),
                      child: Wrap(
                        spacing: 5,
                        children: [
                          Icon(Icons.star,
                              color: Color.fromARGB(255, 252, 210, 64),
                              size: 20),
                          Icon(Icons.star,
                              color: Color.fromARGB(255, 252, 210, 64),
                              size: 20),
                          Icon(Icons.star,
                              color: Color.fromARGB(255, 252, 210, 64),
                              size: 20),
                          Icon(Icons.star,
                              color: Color.fromARGB(255, 252, 210, 64),
                              size: 20),
                          Icon(Icons.star, color: Colors.white, size: 20),
                          Text(rating,
                              style: GoogleFonts.poppins(
                                  textStyle: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w400,
                                      color: Colors.white)))
                        ],
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ],
    ),
  );
}