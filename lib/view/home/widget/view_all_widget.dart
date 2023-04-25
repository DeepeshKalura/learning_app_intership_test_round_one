import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../model/lesson_model.dart';
import '../../../model/program_model.dart';

class ViewAllWidget extends StatelessWidget {
  const ViewAllWidget({
    super.key,
    this.isProgram = true,
    this.programModel,
    this.lessonModel,
  });
  final bool isProgram;
  final ProgramModel? programModel;
  final LessonModel? lessonModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
        iconTheme: const IconThemeData(
          color: Colors.black,
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          if (isProgram)
            const Padding(
              padding: EdgeInsets.only(
                left: 16,
                top: 24,
              ),
              child: Text(
                "Program",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                  fontFamily: "Lora",
                  letterSpacing: -1,
                ),
              ),
            )
          else
            const Padding(
              padding: EdgeInsets.only(
                left: 16,
                top: 24,
              ),
              child: Text(
                "Lesson",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                  fontFamily: "Lora",
                  letterSpacing: -1,
                ),
              ),
            ),
          if (isProgram)
            Container(
              padding: const EdgeInsets.only(left: 16, right: 16, top: 16),
              constraints: const BoxConstraints(maxHeight: 12000),
              height: MediaQuery.of(context).size.height * 0.8,
              child: SingleChildScrollView(
                child: ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: programModel?.items?.length ?? 0,
                  itemBuilder: (context, index) {
                    return ContainerUseWidget(
                      category:
                          programModel?.items![index].category ?? "Program",
                      date: programModel?.items![index].createdAt ??
                          "2022-11-05T07:20:49.474Z",
                      lesson:
                          programModel?.items![index].lesson.toString() ?? "64",
                      title: programModel?.items![index].name ??
                          "Ergonomic Concrete Car",
                    );
                  },
                ),
              ),
            )
          else
            Container(
              padding: const EdgeInsets.only(left: 16, right: 16, top: 16),
              constraints: const BoxConstraints(maxHeight: 12000),
              height: MediaQuery.of(context).size.height * 0.8,
              child: SingleChildScrollView(
                child: ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: lessonModel?.items?.length ?? 0,
                  itemBuilder: (context, index) {
                    return ContainerUseWidget(
                      category:
                          lessonModel?.items![index].category ?? "Program",
                      date: lessonModel?.items![index].createdAt ??
                          "2022-11-05T07:20:49.474Z",
                      lesson: lessonModel?.items![index].duration.toString() ??
                          "64",
                      title: lessonModel?.items![index].name ??
                          "Ergonomic Concrete Car",
                      isProgram: false,
                      isLock: lessonModel?.items![index].locked ?? false,
                    );
                  },
                ),
              ),
            ),
        ],
      ),
    );
  }
}

class ContainerUseWidget extends StatelessWidget {
  const ContainerUseWidget({
    super.key,
    required this.title,
    required this.category,
    required this.lesson,
    required this.date,
    this.isProgram = true,
    this.isLock = false,
  });

  final String title;
  final String category;
  final String lesson;
  final String date;
  final bool isProgram;
  final bool isLock;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 8.0, top: 8),
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        color: Colors.grey[200],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20.0,
            ),
          ),
          const SizedBox(height: 8.0),
          Text(
            category,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.grey[600],
            ),
          ),
          const SizedBox(height: 8.0),
          Row(
            children: [
              Icon(
                Icons.bookmark_border,
                size: 16.0,
                color: Colors.grey[600],
              ),
              const SizedBox(width: 4.0),
              Text(
                'Lesson',
                style: TextStyle(
                  color: Colors.grey[600],
                ),
              ),
              const SizedBox(width: 4.0),
              Text(
                lesson,
                style: TextStyle(
                  color: Colors.grey[600],
                ),
              ),
              const SizedBox(width: 4.0),
              if (!isProgram)
                isLock
                    ? SvgPicture.asset('assets/icon/lock_icon.svg')
                    : const Text(""),
            ],
          ),
          const SizedBox(height: 8.0),
          Text(
            date,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.grey[600],
            ),
          ),
        ],
      ),
    );
  }
}
