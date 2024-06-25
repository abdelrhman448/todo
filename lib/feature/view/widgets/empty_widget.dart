import 'package:flutter/material.dart';
import 'package:todoapp/core/constant/images_and_icons.dart';
import 'package:todoapp/core/extension/size_extention.dart';
import 'package:todoapp/core/helper/app_size_config_helper.dart';

class EmptyWidget extends StatelessWidget {
  final String title;
  final String? subtitle;
  const EmptyWidget({Key? key,required this.title,this.subtitle}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: SizeConfig.width,
      child: Column(
        children: [
          const Image(
            image: AssetImage(
                ImagesAndIcons.emptyTodos
            ),
          ),
          5.heightBox,
           Text(
            title,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          5.heightBox,
           Text(
            subtitle??"",
          ),
        ],
      ),
    );
  }
}
