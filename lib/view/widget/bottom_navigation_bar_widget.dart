import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BottomNavigationBarWidget extends StatelessWidget {
  const BottomNavigationBarWidget({super.key});
  static const items = <Widget>[];
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      selectedItemColor: Colors.blue,
      currentIndex: 0,
      elevation: 1,
      items: [
        BottomNavigationBarItem(
          icon: SvgPicture.asset("assets/icon/home_icon.svg"),
          label: "home",
        ),
        BottomNavigationBarItem(
          icon: SvgPicture.asset("assets/icon/learn_icon_b.svg"),
          label: 'learn',
        ),
        BottomNavigationBarItem(
          icon: SvgPicture.asset("assets/icon/hub_icon.svg"),
          label: "Hub",
        ),
        BottomNavigationBarItem(
          icon: SvgPicture.asset("assets/icon/chat_icon_b.svg"),
          label: "chat",
        ),
        BottomNavigationBarItem(
          icon: Image.asset("assets/icon/profile_icon.png"),
          label: "Profile",
        ),
      ],
    );
  }
}
