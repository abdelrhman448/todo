import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todoapp/core/extension/size_extention.dart';
import 'package:todoapp/core/helper/app_size_config_helper.dart';
import 'package:todoapp/core/sheets_and_popups/bottom_sheet.dart';
import 'package:todoapp/feature/controller/todo_controller.dart';
import 'package:todoapp/feature/model/todo_model.dart';
import 'package:todoapp/feature/view/widgets/add_task_sheet.dart';
import 'package:todoapp/feature/view/widgets/empty_widget.dart';
import 'package:todoapp/feature/view/widgets/todo_item.dart';

class TodoTab extends StatelessWidget {
  const TodoTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Padding(
        padding:  EdgeInsets.symmetric(horizontal: SizeConfig.getWidth(20),vertical: SizeConfig.getHeight(25)),
        child:GetBuilder<TodoController>(
          builder: (controller) =>  Visibility(
            visible: controller.todoList.isNotEmpty,
            replacement: const EmptyWidget(
              title: "What do you want to do today?",
              subtitle: "Tap + to add your tasks",
            ),
            child:  ListView.separated(
                itemBuilder: (context, index) =>TodoItem(
                    key:  ValueKey(controller.todoList[index].id),
                    todo: controller.todoList[index],
                    onCheckBoxClick: (value) => controller.updateTodoStatus(todo: controller.todoList[index], value: value),
                     onEditTodo:()=>showMyBottomSheet(
                       widget: AddTaskSheet(
                         onSubmitTab: (value) {
                         controller.updateTodoTitle(
                             todo: Todo(
                               title: value,
                               id: controller.todoList[index].id,
                               isDone: controller.todoList[index].isDone,
                             )
                         );
                         Get.back();
                       },
                         title: controller.todoList[index].title,
                       )
                     ),
            ),
                separatorBuilder: (context, index) => 10.heightBox,
                itemCount: controller.todoList.length
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: ()=>showMyBottomSheet(
          widget:GetBuilder<TodoController>(
            builder: (controller) =>AddTaskSheet(onSubmitTab: (value){
              controller.addTodo(todoTitle: value);
              Get.back();
            }) ,
          ),
        ),
        child: const Icon(Icons.add),
      ),
    );
  }
}
