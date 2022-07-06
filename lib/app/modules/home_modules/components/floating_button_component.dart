import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todo_list/app/shared/colors/app_colors.dart';

class FloatingButtonComponent extends StatelessWidget {
  final IconData icon;
  final Function() onpress;

  const FloatingButtonComponent({
    Key? key,
    required this.icon,
    required this.onpress,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      splashColor: AppColors.backgroundColor,
      backgroundColor: AppColors.green,
      elevation: 5,
      onPressed: onpress,
      child: Icon(
        icon,
      ),
    );
  }
}
