import 'package:flutter/material.dart';

class CustomSearchIcon extends StatelessWidget {
  const CustomSearchIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      width: 40,
      decoration: BoxDecoration(
        color: Colors.grey.withOpacity(0.06),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Center(
          child: IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.search,
              ))),
    );
  }
}
