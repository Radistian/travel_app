import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:travel_app/core/routing/app_route.dart';


class KutaBeachScreen extends StatefulWidget {
  @override
  State<KutaBeachScreen> createState() => _KutaBeachScreenState();
}

class _KutaBeachScreenState extends State<KutaBeachScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            'assets/img/page3.jpg',
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            fit: BoxFit.cover,
          ),
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Colors.black.withOpacity(0.3), Colors.black.withOpacity(0.8)],
              ),
            ),
          ),
          Positioned(
            top: 40,
            left: 20,
            child: IconButton(
              icon: Icon(Icons.arrow_back, color: Colors.white),
              onPressed: () => context.goNamed(Routes.home),
            ),
          ),
          Positioned(
            top: 40,
            right: 20,
            child: Icon(
              Icons.favorite,
              color: Colors.red,
              size: 30,
            ),
          ),
          Positioned(
            bottom: 0,
            child: Container(
              padding: EdgeInsets.all(20),
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.6),
                borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    "Kuta Beach",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 5),
                  Row(
                    children: [
                      Icon(Icons.location_on, color: Colors.white70, size: 16),
                      SizedBox(width: 5),
                      Text(
                        "Bali, Indonesia",
                        style: TextStyle(color: Colors.white70),
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  Text(
                    "Bali is an island in Indonesia known for its ...",
                    style: TextStyle(color: Colors.white70),
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Icon(Icons.star, color: Color(0xFFFCD240)),
                          SizedBox(width: 5),
                          Text(
                            "4.8",
                            style: TextStyle(color: Colors.white),
                          ),
                        ],
                      ),
                      Text(
                        "\$245.00 / Person",
                        style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  SizedBox(height: 15),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFFFCD240),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      minimumSize: Size(double.infinity, 50),
                    ),
                    onPressed: () {},
                    child: Text(
                      "Booking",
                      style: TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}