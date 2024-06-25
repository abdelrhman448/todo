import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todoapp/core/constant/images_and_icons.dart';
import 'package:todoapp/core/extension/size_extention.dart';
import 'package:todoapp/core/helper/app_size_config_helper.dart';
import 'package:todoapp/feature/controller/todo_controller.dart';
import 'package:todoapp/feature/view/widgets/empty_widget.dart';
import 'package:todoapp/feature/view/widgets/todo_item.dart';

class CompleteTab extends StatelessWidget {
  const CompleteTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Padding(
        padding:  EdgeInsets.symmetric(horizontal: SizeConfig.getWidth(20),vertical: SizeConfig.getHeight(25)),
        child:GetBuilder<TodoController>(
          builder: (controller) =>  Visibility(
            visible: controller.completeList.isNotEmpty,
            replacement: const EmptyWidget(
              title: "You don't complete any tasks yet",
            ),
            child:  ListView.separated(
                itemBuilder: (context, index) =>TodoItem(
                  key:  ValueKey(controller.completeList[index].id),
                  todo: controller.completeList[index],
                  onCheckBoxClick: (value) => controller.updateTodoStatus(todo: controller.completeList[index], value: value),
                  onDeleteTodo: ()=>controller.deleteTodo(todo: controller.completeList[index]),
                ),
                separatorBuilder: (context, index) => 10.heightBox,
                itemCount: controller.completeList.length
            ),
          ),
        ),
      ),
    );
  }
}
