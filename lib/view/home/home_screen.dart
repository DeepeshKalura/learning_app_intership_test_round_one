import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'widget/button_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          leading: Padding(
            padding: const EdgeInsets.only(left: 16),
            child: SvgPicture.asset('assets/icon/menu_icon.svg'),
          ),
          actions: [
            SvgPicture.asset('assets/icon/chat_icon.svg'),
            const SizedBox(width: 16),
            SvgPicture.asset('assets/icon/notification_icon.svg'),
            const SizedBox(width: 16),
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.only(
                  left: 16,
                  top: 24,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      "Hello Priya!",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                        fontFamily: "Lora",
                        letterSpacing: -1,
                      ),
                    ),
                    SizedBox(
                      height: 3,
                    ),
                    Text(
                      "What Do you want to learn today?",
                      style: TextStyle(
                        color: Color.fromRGBO(109, 116, 122, 1),
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        fontFamily: "Inter",
                        letterSpacing: -0.1,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.only(
                  left: 16,
                  top: 45,
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        ButtonWidget(
                          path: "assets/icon/program_icon.svg",
                          message: "Program",
                        ),
                        SizedBox(
                          width: 8,
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                            right: 16,
                          ),
                          child: ButtonWidget(
                            path: "assets/icon/help_icon.svg",
                            message: "Get help",
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        ButtonWidget(
                          path: "assets/icon/learn_icon.svg",
                          message: "Learn",
                        ),
                        SizedBox(
                          width: 8,
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                            right: 16,
                          ),
                          child: ButtonWidget(
                            path: "assets/icon/tracker_icon.svg",
                            message: "DD Tracker",
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
