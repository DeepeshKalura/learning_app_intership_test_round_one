import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ContainerWidget extends StatelessWidget {
  const ContainerWidget({
    super.key,
    required this.heroString,
    required this.path,
    required this.category,
    required this.date,
    required this.buttonText,
    required this.isButton,
    required this.colors,
    required this.isSvg,
    this.child,
  });
  final String heroString;
  final String path;
  final String category;
  final String date;
  final String buttonText;
  final bool isButton;
  final Color colors;
  final bool isSvg;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 295,
      width: 280,
      margin: const EdgeInsets.only(
        top: 24,
        left: 16,
      ),
      decoration: BoxDecoration(
        color: const Color.fromRGBO(235, 237, 240, 1),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: const Color.fromRGBO(235, 237, 240, 1),
          width: 1,
          style: BorderStyle.solid,
        ),
        boxShadow: const [
          BoxShadow(
            color: Color.fromRGBO(14, 68, 62, 0.08),
            blurRadius: 12.0,
            spreadRadius: 0.0,
            offset: Offset(0.0, 0.0),
          ),
        ],
      ),
      child: Column(
        children: [
          Stack(
            children: [
              Container(
                width: 280,
                height: 140,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: colors,
                ),
              ),
              if (isSvg)
                Center(
                    child: SvgPicture.asset(
                  path,
                  width: 140,
                  height: 140,
                  fit: BoxFit.cover,
                )),
              if (!isSvg)
                Image.asset(
                  path,
                  height: 140,
                  width: 280,
                  fit: BoxFit.cover,
                  alignment: Alignment.center,
                ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(
                  top: 16,
                  left: 12,
                ),
                child: Text(
                  category,
                  style: const TextStyle(
                    fontFamily: 'Inter',
                    fontSize: 12,
                    fontWeight: FontWeight.w700,
                    letterSpacing: -0.02,
                    color: Color.fromRGBO(89, 139, 237, 1),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  top: 8,
                  left: 12,
                  right: 12,
                ),
                child: Text(
                  heroString,
                  style: const TextStyle(
                    fontFamily: 'Inter',
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                    letterSpacing: -0.01,
                    color: Color.fromRGBO(0, 0, 0, 1),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 15,
                      left: 12,
                      bottom: 21,
                    ),
                    child: Text(
                      date,
                      style: const TextStyle(
                        fontFamily: 'Inter',
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        letterSpacing: -0.01,
                        color: Color.fromRGBO(109, 116, 122, 1),
                      ),
                    ),
                  ),
                  if (isButton)
                    Padding(
                      padding:
                          const EdgeInsets.only(top: 7, left: 100, right: 12),
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          foregroundColor:
                              const Color.fromRGBO(109, 116, 122, 1),
                          backgroundColor:
                              const Color.fromRGBO(235, 237, 240, 1),
                          minimumSize: const Size(62, 26),
                          alignment: Alignment.centerLeft,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                            side: const BorderSide(
                              width: 1,
                              color: Color.fromRGBO(89, 139, 237, 1),
                            ),
                          ),
                        ),
                        child: Text(
                          buttonText,
                          style: const TextStyle(
                            fontFamily: 'Inter',
                            fontStyle: FontStyle.normal,
                            fontWeight: FontWeight.w600,
                            fontSize: 12,
                            letterSpacing: -0.005,
                            color: Color.fromRGBO(89, 139, 237, 1),
                          ),
                        ),
                      ),
                    ),
                  if (!isButton)
                    Padding(
                      padding: const EdgeInsets.only(
                        top: 7,
                        right: 12,
                        left: 156,
                      ),
                      child: child,
                    ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
