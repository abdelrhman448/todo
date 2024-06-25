import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todoapp/core/helper/app_size_config_helper.dart';
import 'package:todoapp/feature/controller/todo_controller.dart';
import 'package:todoapp/feature/view/todo/complete_tab.dart';
import 'package:todoapp/feature/view/todo/todo_tab.dart';

class NoteListScreen extends StatefulWidget {
  const NoteListScreen({Key? key}) : super(key: key);

  @override
  State<NoteListScreen> createState() => _NoteListScreenState();
}

class _NoteListScreenState extends State<NoteListScreen> with SingleTickerProviderStateMixin {
  late TabController tabController;
  final controller=Get.put(TodoController(),permanent: true);
  @override
  void initState() {
    controller.getTodo();
    tabController = TabController(length: 2, vsync: this);
    super.initState();

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
        appBar: AppBar(
          title: const Text("Todo App"),
          bottom: TabBar(
            controller: tabController,
            dividerColor: Colors.transparent,
            indicatorSize: TabBarIndicatorSize.tab,
            indicatorPadding: EdgeInsetsDirectional.symmetric(horizontal: SizeConfig.getWidth(20)),
            automaticIndicatorColorAdjustment: true,
            overlayColor: MaterialStateProperty.resolveWith((states) => Colors.transparent),
            tabs: const [
              Tab(
                text: "Todo",
              ),
              Tab(
                text: "Complete",
              ),
            ],),
        ),
        body: TabBarView(
            controller: tabController,
            children: const [
              TodoTab(),
              CompleteTab(),
            ]
        )
    );
  }
}
