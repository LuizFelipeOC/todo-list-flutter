import 'package:flutter/material.dart';
import 'package:todo_list/app/modules/add_activity_module/controller/add_activity_controller.dart';
import 'package:todo_list/app/modules/add_activity_module/entities/add_activity_entity.dart';
import 'package:todo_list/app/modules/add_activity_module/states/add_activity_state.dart';
import 'package:todo_list/app/shared/colors/app_colors.dart';
import 'package:todo_list/app/shared/styles/app_styles.dart';

class AddAcitivtyPage extends StatefulWidget {
  const AddAcitivtyPage({Key? key}) : super(key: key);

  @override
  State<AddAcitivtyPage> createState() => _AddAcitivtyPageState();
}

class _AddAcitivtyPageState extends State<AddAcitivtyPage> {
  final AddActivityController addActivityController = AddActivityController(
    AddActivityEntity(),
  );

  @override
  Widget build(BuildContext context) {
    final screen = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 20),
            child: Column(
              children: [
                Row(
                  children: [
                    IconButton(
                      onPressed: () =>
                          addActivityController.returnToHomeScreen(context),
                      icon: const Icon(
                        Icons.arrow_back_ios_new,
                        color: AppColors.white,
                        size: 30,
                      ),
                    ),
                    const Text(
                      'Adicionar atividade',
                      style: AppStyles.heading,
                    )
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10, right: 20, left: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextField(
                        textInputAction: TextInputAction.next,
                        style: AppStyles.subHeading,
                        onChanged: (String title) => addActivityController
                            .addActivityEntity.title = title.trim(),
                        cursorColor: AppColors.white,
                        decoration: const InputDecoration(
                          hintStyle: AppStyles.subHeading,
                          hintText: 'Titulo da atividade',
                          border: OutlineInputBorder(),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: AppColors.white,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: AppColors.white,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
                      TextField(
                        textInputAction: TextInputAction.done,
                        maxLines: 2,
                        style: AppStyles.subHeading,
                        onChanged: (String content) => addActivityController
                            .addActivityEntity.content = content.trim(),
                        cursorColor: AppColors.white,
                        decoration: const InputDecoration(
                          hintStyle: AppStyles.subHeading,
                          hintText: 'Conteudo da atividade',
                          border: OutlineInputBorder(),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: AppColors.white,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: AppColors.white,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      ValueListenableBuilder(
                        valueListenable: addActivityController,
                        builder: (BuildContext context, value, child) {
                          if (value is ErroValidate) {
                            return const Text(
                              'Nenhum dos campos acima pode estar vazio!',
                              style: AppStyles.subHeading,
                            );
                          }

                          if (value is Sucess) {
                            return const Text(
                              'Atividade adicionada com sucesso, estamos te redirecionado pra tela incial!',
                              style: AppStyles.subHeading,
                            );
                          }

                          return Container();
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 30),
        child: SizedBox(
          width: screen.width,
          height: 64,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              primary: AppColors.green,
            ),
            child: const Text(
              "SALVAR",
              style: AppStyles.subHeading,
            ),
            onPressed: () => addActivityController.validadeInputs(context),
          ),
        ),
      ),
    );
  }
}
