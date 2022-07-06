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
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 50),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              HeaderComponent(
                pathImage: AppImages.logo,
                titleHeader: 'Anotações',
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
                    return ListView.builder(
                      physics: const ClampingScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: value.activitys.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Card(
                          color: AppColors.white.withOpacity(0.1),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(10),
                                    child: Text(
                                      '${value.activitys[index].title}',
                                      style: AppStyles.heading,
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 10, bottom: 10),
                                    child: Text(
                                      '${value.activitys[index].content}',
                                      style: AppStyles.subHeading,
                                    ),
                                  ),
                                ],
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.only(left: 10, bottom: 10),
                                child: IconButton(
                                  onPressed: () =>
                                      homeController.deleteAnnotions(
                                    int.parse(
                                      '${value.activitys[index].id}',
                                    ),
                                  ),
                                  icon: const Icon(Icons.delete),
                                  color: AppColors.green,
                                ),
                              ),
                            ],
                          ),
                        );
                      },
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
      ),
      floatingActionButton: FloatingButtonComponent(
        icon: Icons.add,
        onpress: () => homeController.navigatoToIncludeAcitivity(context),
      ),
    );
  }
}
