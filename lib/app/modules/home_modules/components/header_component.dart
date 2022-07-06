import 'package:flutter/cupertino.dart';
import 'package:todo_list/app/shared/styles/app_styles.dart';

class HeaderComponent extends StatelessWidget {
  final String pathImage;
  final String titleHeader;

  const HeaderComponent({
    Key? key,
    required this.pathImage,
    required this.titleHeader,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Row(
        children: [
          Image.asset(
            pathImage,
            width: 64,
          ),
          const SizedBox(width: 5),
          Text(
            titleHeader,
            style: AppStyles.heading,
          )
        ],
      ),
    );
  }
}
