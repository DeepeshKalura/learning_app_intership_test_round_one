import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ButtonWidget extends StatelessWidget {
  const ButtonWidget({
    super.key,
    required this.path,
    required this.message,
  });

  final String path;
  final String message;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 185,
      height: 48,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: const Color.fromRGBO(238, 243, 253, 1),
        border: Border.all(
          width: 1,
          color: const Color.fromRGBO(89, 139, 237, 1),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 26),
            child: SvgPicture.asset(
              path,
              width: 16,
              height: 18,
            ),
          ),
          const SizedBox(width: 18),
          Text(
            message,
            style: const TextStyle(
              color: Color.fromRGBO(89, 139, 237, 1),
              fontFamily: 'Inter',
              fontWeight: FontWeight.w600,
              fontSize: 14,
              height: 1.25,
              letterSpacing: -0.005,
            ),
          ),
        ],
      ),
    );
  }
}
