import 'package:flutter/cupertino.dart';
import 'package:sqflite/sqflite.dart';
import 'package:todo_list/app/modules/home_modules/entities/activity_entity.dart';
import 'package:todo_list/app/modules/home_modules/states/home_state.dart';
import 'package:todo_list/app/shared/data/database/app_database.dart';

class HomeController extends ValueNotifier<HomeState> {
  final ActivityEntity _activityEntity;

  HomeController(this._activityEntity) : super(LoadingState());

  Future fetchAcitivitys() async {
    value = LoadingState();
    final Database database = await AppDataBase().initDatabase();

    try {
      final listAcitivitiesDatabase = await database.query('ACTIVITYS');

      final List<ActivityEntity> listAcitvitys = listAcitivitiesDatabase
          .map(
            (e) => ActivityEntity.fromMap(e),
          )
          .toList();

      await Future.delayed(const Duration(seconds: 1));

      if (listAcitvitys.isEmpty) {
        return value = EmptyState();
      }

      value = SucessState(listAcitvitys);
    } catch (e) {
      print(e.toString());
    }
  }

  deleteAnnotions(int id) async {
    final Database database = await AppDataBase().initDatabase();
    final Batch batch = database.batch();

    batch.delete(
      'ACTIVITYS',
      where: 'id = ?',
      whereArgs: [
        id,
      ],
    );

    await batch.commit(noResult: true);

    fetchAcitivitys();
  }

  navigatoToIncludeAcitivity(context) {
    Navigator.pushNamed(context, '/add_acitivity');
  }
}
