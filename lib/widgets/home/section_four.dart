import 'package:flutter/material.dart';
import 'package:stunting_web/constants/utils.dart';

class SectionFour extends StatelessWidget {
  const SectionFour({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 450.0,
      child: Row(
        children: [
          Expanded(
            flex: 1,
            child: Padding(
              padding: const EdgeInsets.all(75),
              child: Text(
                InfoText.description[2],
                textAlign: TextAlign.justify,
                style: TextStyle(
                  fontSize: MediaQuery.of(context).size.width * 0.018,
                  color: Colors.black87,
                  height: 1.5,
                ),
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Align(
              alignment: Alignment.centerLeft,
              child: Image.asset(
                'assets/home2.png',
                width: MediaQuery.of(context).size.width * 0.5,
                height: MediaQuery.of(context).size.width * 0.5,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
