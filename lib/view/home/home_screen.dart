import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../controller/get_call_controller.dart';
import '../../model/lesson_model.dart';
import '../../model/program_model.dart';
import '../widget/bottom_navigation_bar_widget.dart';
import 'widget/button_widget.dart';
import 'widget/container_widget.dart';
import 'widget/view_all_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final GetCallController getCallController = GetCallController();
  ProgramModel? programModel;
  LessonModel? lessonModel;

  @override
  void initState() {
    super.initState();
    getIntialData();
  }

  void getIntialData() async {
    programModel = await getCallController.getProgram();
    lessonModel = await getCallController.getLessons();
  }

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
              Padding(
                padding: const EdgeInsets.only(
                  left: 16,
                  top: 24,
                  right: 16,
                  bottom: 24,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Programs For You",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        fontFamily: "Lora",
                        letterSpacing: -1,
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ViewAllWidget(
                                isProgram: true, programModel: programModel),
                          ),
                        );
                      },
                      child: RichText(
                        text: const TextSpan(
                          children: [
                            TextSpan(
                              text: 'View all ',
                              style: TextStyle(
                                color: Color.fromRGBO(109, 116, 122, 1),
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                                fontFamily: 'Inter',
                                letterSpacing: -0.1,
                              ),
                            ),
                            WidgetSpan(
                              child: Icon(
                                Icons.arrow_forward,
                                color: Color.fromRGBO(109, 116, 122, 1),
                                size: 12,
                              ),
                              baseline: TextBaseline.alphabetic,
                              alignment: PlaceholderAlignment.middle,
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
              ConstrainedBox(
                constraints: const BoxConstraints(
                  maxHeight: 300,
                  maxWidth: 1000,
                ),
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: const [
                    ContainerWidget(
                      isSvg: true,
                      path: "assets/picture/mummy_picture.svg",
                      category: "Lifestyle",
                      buttonText: "Book",
                      date: "16 lesson",
                      heroString: "A complete guide for your new born baby",
                      isButton: false,
                      colors: Color.fromRGBO(221, 227, 194, 1),
                    ),
                    ContainerWidget(
                      isSvg: false,
                      path: "assets/picture/parents_picture.png",
                      category: "Working Parents",
                      buttonText: "Book",
                      date: "12 lesson",
                      heroString: "Understanding of human behaviour",
                      isButton: false,
                      colors: Color.fromRGBO(221, 227, 194, 1),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 16,
                  top: 24,
                  right: 16,
                  bottom: 24,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Event and Experiences",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        fontFamily: "Lora",
                        letterSpacing: -1,
                      ),
                    ),
                    RichText(
                      text: const TextSpan(
                        children: [
                          TextSpan(
                            text: 'View all ',
                            style: TextStyle(
                              color: Color.fromRGBO(109, 116, 122, 1),
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                              fontFamily: 'Inter',
                              letterSpacing: -0.1,
                            ),
                          ),
                          WidgetSpan(
                            child: Icon(
                              Icons.arrow_forward,
                              color: Color.fromRGBO(109, 116, 122, 1),
                              size: 12,
                            ),
                            baseline: TextBaseline.alphabetic,
                            alignment: PlaceholderAlignment.middle,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              ConstrainedBox(
                constraints: const BoxConstraints(
                  maxHeight: 300,
                  maxWidth: 1000,
                ),
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: const [
                    ContainerWidget(
                      isSvg: false,
                      path: "assets/picture/yoga_women_picture.png",
                      category: "Lifestyle",
                      buttonText: "Book",
                      date: "13 Feb, Sunday",
                      heroString: "A complete guide for your new born baby",
                      isButton: true,
                      colors: Color.fromRGBO(221, 227, 194, 1),
                    ),
                    ContainerWidget(
                      isSvg: false,
                      path: "assets/picture/yoga_women_picture.png",
                      category: "Working Parents",
                      buttonText: "Book",
                      date: "12 lesson",
                      heroString: "Understanding of human behaviour",
                      isButton: true,
                      colors: Color.fromRGBO(221, 227, 194, 1),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 16,
                  top: 24,
                  right: 16,
                  bottom: 24,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Lessons For You",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        fontFamily: "Lora",
                        letterSpacing: -1,
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ViewAllWidget(
                              isProgram: false,
                              lessonModel: lessonModel,
                            ),
                          ),
                        );
                      },
                      child: RichText(
                        text: const TextSpan(
                          children: [
                            TextSpan(
                              text: 'View all ',
                              style: TextStyle(
                                color: Color.fromRGBO(109, 116, 122, 1),
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                                fontFamily: 'Inter',
                                letterSpacing: -0.1,
                              ),
                            ),
                            WidgetSpan(
                              child: Icon(
                                Icons.arrow_forward,
                                color: Color.fromRGBO(109, 116, 122, 1),
                                size: 12,
                              ),
                              baseline: TextBaseline.alphabetic,
                              alignment: PlaceholderAlignment.middle,
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
              ConstrainedBox(
                constraints: const BoxConstraints(
                  maxHeight: 300,
                  maxWidth: 1000,
                ),
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    ContainerWidget(
                      isSvg: false,
                      path: "assets/picture/yoga_women_picture.png",
                      category: "Lifestyle",
                      buttonText: "Book",
                      date: "3 minutes",
                      heroString: "A complete guide for your new born baby",
                      isButton: false,
                      colors: const Color.fromRGBO(221, 227, 194, 1),
                      child: SvgPicture.asset(
                        "assets/icon/lock_icon.svg",
                        height: 20,
                        width: 20,
                      ),
                    ),
                    ContainerWidget(
                      isSvg: false,
                      path: "assets/picture/yoga_women_picture.png",
                      category: "Working Parents",
                      buttonText: "Book",
                      date: "1 minutes",
                      heroString: "Understanding of human behaviour",
                      isButton: false,
                      colors: const Color.fromRGBO(221, 227, 194, 1),
                      child: SvgPicture.asset(
                        "assets/icon/lock_icon.svg",
                        height: 20,
                        width: 20,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: const BottomNavigationBarWidget(),
      ),
    );
  }
}
