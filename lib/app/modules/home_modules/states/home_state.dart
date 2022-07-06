// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:todo_list/app/modules/home_modules/entities/activity_entity.dart';

abstract class HomeState {}

class LoadingState implements HomeState {}

class SucessState implements HomeState {
  List<ActivityEntity> activitys;

  SucessState(
    this.activitys,
  );
}

class EmptyState implements HomeState {}
