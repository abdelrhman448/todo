import 'package:flutter/material.dart';
import 'package:todoapp/core/helper/app_size_config_helper.dart';
import 'package:todoapp/feature/model/todo_model.dart';

class TodoItem extends StatefulWidget {
  final Todo todo;
  final VoidCallback? onDeleteTodo;
  final VoidCallback? onEditTodo;
  final Function(bool value) onCheckBoxClick;
  const TodoItem({Key? key,required this.todo,required this.onCheckBoxClick,this.onDeleteTodo,this.onEditTodo}) : super(key: key);

  @override
  State<TodoItem> createState() => _TodoItemState();
}

class _TodoItemState extends State<TodoItem> {
  @override
  Widget build(BuildContext context) {
    return Card(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10)
        ),
        child:  Padding(
          padding:  EdgeInsets.all(SizeConfig.getHeight(8)),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: Text(
                    widget.todo.title
                ),
              ),
              Visibility(
                visible:widget.todo.isDone,
                replacement: IconButton(
                  icon:const Icon(Icons.edit),
                  onPressed: widget.onEditTodo ?? (){},
                ),
                child: IconButton(
                  icon:const Icon(Icons.delete),
                  onPressed: widget.onDeleteTodo ?? (){},
                ),
              ),
              Checkbox(
                value: widget.todo.isDone,
                onChanged: (value)=>widget.onCheckBoxClick(value!),
              ),
            ],
          ),
        )
    );
  }
}
