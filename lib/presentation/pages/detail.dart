// ignore_for_file: sized_box_for_whitespace

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:travel_app/core/models/model.dart';
import 'package:travel_app/presentation/widget/gallery.dart';
import 'package:travel_app/presentation/widget/judul.dart';
import 'package:travel_app/presentation/widget/kategori.dart';
import 'package:travel_app/presentation/widget/review.dart';
import 'package:travel_app/presentation/widget/wisata.dart';




class DetailPage extends StatefulWidget {
  final DetailWisata data;
  const DetailPage({required this.data});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    var tinggi = MediaQuery.of(context).size.height;
    var lebar = MediaQuery.of(context).size.width;
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          title: Text('Detail Wisata'),
          centerTitle: true,
          actions: [
            IconButton(
              icon: Icon(Icons.favorite),
              onPressed: () {
                // Add filter action here
              },
            ),
          ],
        ),
        body: Container(
          padding: EdgeInsets.all(20),
          child: SingleChildScrollView(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                Wisata(widget.data.gambarwisata, widget.data.namawisata,
                    widget.data.lokasiwisata, widget.data.ratingWisata.toString(), tinggi, lebar, context, true ),
                Container(
                    margin: EdgeInsets.only(top: 20),
                    child: Judul("What's Included?", "", tinggi)),
                Container(
                    margin: EdgeInsets.only(bottom: tinggi * 0.03),
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Wrap(spacing: 20, children: [
                        Kategori("Flight", "assets/img/page1.jpg", lebar),
                        Kategori("Hotel", "assets/img/page1.jpg", lebar),
                        Kategori("Transportation", "assets/img/page1.jpg", lebar),
                        Kategori("Eat", "assets/img/page1.jpg", lebar),
                      ]),
                    )),
                Container(
                    margin: EdgeInsets.only(top: 20),
                    child: Judul("About Trip", "", tinggi)),
                Container(
                  margin: EdgeInsets.only(top: 10),
                  child: Text(
                    widget.data.deskripsi,
                    style: TextStyle(fontSize: 16),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 20),
                  child: Judul("Gallery Photo", "", tinggi),
                ),
                Container(
                  margin: EdgeInsets.only(top: 10),
                  height: 150,
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        BuildGalleryPhoto("assets/img/page1.jpg"),
                        BuildGalleryPhoto("assets/img/page2.jpg"),
                        BuildGalleryPhoto("assets/img/page3.jpg"),
                      ],
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 20),
                  child: Judul("Review (99)", "", tinggi, angka: 4.8),
                ),
                Container(
                  margin: EdgeInsets.only(top: 10),
                  child: Column(
                    children: [
                      ReviewTile(
                        name: "Alice Brown",
                        rating: 5.0,
                        review: "Amazing place! Had a great time.",
                        time: "2 hours ago",
                      ),
                      ReviewTile(
                        name: "Charlie Davis",
                        rating: 4.5,
                        review: "Beautiful scenery and friendly staff.",
                        time: "1 day ago",
                      ),
                      // Add more ReviewTile widgets as needed
                    ],
                  ),
                ),
              ])),
        ),
        bottomNavigationBar: BottomAppBar(
          color: Colors.white,
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            height: 60,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '\$750.00 / Person',
                  style: GoogleFonts.poppins(
                      textStyle:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
                ),
                Container(
                  width: lebar * 0.4,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.yellow,
                      padding: EdgeInsets.symmetric(vertical: 15),
                    ),
                    onPressed: () {
                      // Add booking action here
                    },
                    child: Text(
                      'Booking',
                      style: GoogleFonts.poppins(
                          textStyle: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.bold)),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}