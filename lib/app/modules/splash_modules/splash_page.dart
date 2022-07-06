import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:todo_list/app/modules/splash_modules/controller/splash_controller.dart';
import 'package:todo_list/app/shared/colors/app_colors.dart';
import 'package:todo_list/app/shared/styles/app_styles.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  final SplashController _controller = SplashController();

  @override
  void initState() {
    SchedulerBinding.instance.addPostFrameCallback(
      (_) => _controller.redirectFromHomePage(
        context,
      ),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    'Bem-Vindo!',
                    style: AppStyles.heading,
                  ),
                  Text(
                    'Anote suas atividades do dia a dia',
                    style: AppStyles.subHeading,
                  ),
                ],
              ),
              Column(
                children: const [
                  Text(
                    'Espere um pouquinho estamos ajustandos algumas coisas :)',
                    style: AppStyles.subHeading,
                  ),
                  SizedBox(height: 10),
                  LinearProgressIndicator(
                    backgroundColor: AppColors.backgroundColor,
                    color: AppColors.white,
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
