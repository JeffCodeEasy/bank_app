import 'package:flutter/material.dart';

class SectionBotons extends StatelessWidget {
  const SectionBotons({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 7, 38, 83),
              borderRadius: BorderRadius.circular(20),
            ),
            padding: const EdgeInsets.symmetric(
              horizontal: 25,
              vertical: 8,
            ),
            child: const Text(
              'All',
              style: TextStyle(fontSize: 15, color: Colors.white),
            ),
          ),
          const SizedBox(width: 15),
          Container(
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 209, 207, 207),
              borderRadius: BorderRadius.circular(20),
            ),
            padding: const EdgeInsets.symmetric(
              horizontal: 25,
              vertical: 8,
            ),
            child: const Text(
              'Income',
              style: TextStyle(fontSize: 15),
            ),
          ),
          const SizedBox(width: 15),
          Container(
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 209, 207, 207),
              borderRadius: BorderRadius.circular(20),
            ),
            padding: const EdgeInsets.symmetric(
              horizontal: 10,
              vertical: 8,
            ),
            child: const Text(
              'Outcome',
              style: TextStyle(fontSize: 15),
            ),
          ),
        ],
      ),
    );
  }
}
