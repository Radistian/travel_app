// ignore_for_file: use_super_parameters

import 'package:flutter/material.dart';

class ReviewTile extends StatelessWidget {
  final String name;
  final double rating;
  final String review;
  final String time;

  const ReviewTile({
    Key? key,
    required this.name,
    required this.rating,
    required this.review,
    required this.time,
  }) : super(key: key);

  String getInitials(String name) {
    List<String> nameParts = name.split(" ");
    String initials = "";
    for (var part in nameParts) {
      if (part.isNotEmpty) {
        initials += part[0];
      }
    }
    return initials;
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        backgroundColor: Colors.yellow,
        child: Text(
          getInitials(name),
          style: TextStyle(color: Colors.black),
        ),
      ),
      title: Text(name),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: List.generate(
              5,
              (index) => Icon(
                Icons.star,
                color: Colors.yellow,
                size: 16,
              ),
            ),
          ),
          SizedBox(height: 5),
          Text(review),
        ],
      ),
      trailing: Text(time),
    );
  }
}