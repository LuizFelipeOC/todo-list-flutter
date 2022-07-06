import 'package:flutter/material.dart';
import 'package:todo_list/app/modules/home_modules/components/floating_button_component.dart';
import 'package:todo_list/app/modules/home_modules/components/header_component.dart';
import 'package:todo_list/app/modules/home_modules/controller/home_controller.dart';
import 'package:todo_list/app/modules/home_modules/entities/activity_entity.dart';
import 'package:todo_list/app/modules/home_modules/states/home_state.dart';
import 'package:todo_list/app/shared/colors/app_colors.dart';
import 'package:todo_list/app/shared/images/app_images.dart';
import 'package:todo_list/app/shared/styles/app_styles.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final HomeController homeController = HomeController(
    ActivityEntity(),
  );

  @override
  void initState() {
    homeController.fetchAcitivitys();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final screen = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 50),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            HeaderComponent(
              pathImage: AppImages.logo,
              titleHeader: 'Atividades diárias',
            ),
            ValueListenableBuilder(
              builder: (context, value, child) {
                if (value is LoadingState) {
                  return SizedBox(
                    height: screen.height * .7,
                    child: const Center(
                      child: CircularProgressIndicator(),
                    ),
                  );
                }

                if (value is SucessState) {
                  return Center(
                    child: Text(
                      '${value.activitys.first.title}',
                    ),
                  );
                }

                if (value is EmptyState) {
                  return SizedBox(
                    height: screen.height * .7,
                    child: const Center(
                      child: Text(
                        'Você não tem nenhuma atividade salva',
                        style: AppStyles.heading,
                        textAlign: TextAlign.center,
                      ),
                    ),
                  );
                }

                return Container();
              },
              valueListenable: homeController,
            )
          ],
        ),
      ),
      floatingActionButton: FloatingButtonComponent(
        icon: Icons.add,
        onpress: () => {},
      ),
    );
  }
}
