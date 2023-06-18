import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:todo_app/1_domain/use_cases/load_overview_todo_collections.dart';

part 'todo_overview_cubit_state.dart';

class ToDoOverviewCubitCubit extends Cubit<ToDoOverviewCubitState> {
  ToDoOverviewCubitCubit({
    ToDoOverviewCubitState? initialState,
    required this.loadOverviewToDoCollections,
  }) : super(initialState ?? ToDoOverviewCubitLoadingState());

  final LoadOverviewToDoCollections loadOverviewToDoCollections;
}
