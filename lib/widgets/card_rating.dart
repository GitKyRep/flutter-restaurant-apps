import 'package:flutter/material.dart';

class CardRating extends StatelessWidget {
  final int index;
  final int rating;

  const CardRating({Key? key, required this.index, required this.rating})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: (index <= rating)
          ? Icon(
              Icons.star,
              size: 20,
              color: Colors.orange,
            )
          : Icon(
              Icons.star_border,
              size: 20,
            ),
    );
  }
}
