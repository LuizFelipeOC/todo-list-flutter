import 'package:flutter/cupertino.dart';
import 'package:sqflite/sqflite.dart';
import 'package:todo_list/app/modules/add_activity_module/entities/add_activity_entity.dart';
import 'package:todo_list/app/modules/add_activity_module/states/add_activity_state.dart';
import 'package:todo_list/app/shared/data/database/app_database.dart';

class AddActivityController extends ValueNotifier<AddActivityState> {
  final AddActivityEntity addActivityEntity;

  AddActivityController(this.addActivityEntity) : super(InitialState());

  validadeInputs(context) async {
    value = InitialState();
    final Database database = await AppDataBase().initDatabase();
    final Batch batch = database.batch();

    if (addActivityEntity.title == null || addActivityEntity.content == null) {
      value = ErroValidate();
    }

    batch.insert(
      'ACTIVITYS',
      {
        'title': addActivityEntity.title,
        'content': addActivityEntity.content,
      },
    );

    await batch.commit(noResult: true);

    value = Sucess();

    await Future.delayed(const Duration(milliseconds: 500));

    Navigator.pushReplacementNamed(context, '/home');
  }

  returnToHomeScreen(context) {
    Navigator.pop(context);
  }
}
