import 'package:flutter/material.dart';
import 'package:todoapp/core/constant/images_and_icons.dart';
import 'package:todoapp/core/extension/size_extention.dart';
import 'package:todoapp/core/helper/app_size_config_helper.dart';

class AddTaskSheet extends StatefulWidget {
  final String? title;
  final Function( String title) onSubmitTab;
   AddTaskSheet({Key? key,required this.onSubmitTab,this.title}) : super(key: key);

  @override
  State<AddTaskSheet> createState() => _AddTaskSheetState();
}

class _AddTaskSheetState extends State<AddTaskSheet> {
 late TextEditingController todoController;
  @override
  void initState() {
    if(widget.title!=null){
      todoController=TextEditingController(text: widget.title);
    }
    else{
      todoController=TextEditingController();
    }
    super.initState();
  }
  @override
  void dispose() {
    todoController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return  Container(
      height: SizeConfig.getHeight(250),
      color: Colors.white,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: SizeConfig.getWidth(20),vertical: SizeConfig.getHeight(25)),
        child: Column(
          children: [
            const Text(
              "Add Task",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            10.heightBox,
            Expanded(
              child: TextFormField(
                controller: todoController,
                decoration: const InputDecoration(
                  hintText: 'Write your todo',
                  border: InputBorder.none,
                  hintStyle: TextStyle(
                    color: Colors.grey,
                  ),
                ),
                style: const TextStyle(
                  fontSize: 16.0,
                ),
              ),
            ),
             Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                InkWell(
                  onTap: ()=>widget.onSubmitTab(todoController.text),
                  child: const Image(
                    image: AssetImage(ImagesAndIcons.submit),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
