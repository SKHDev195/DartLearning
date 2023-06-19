part of 'todo_overview_cubit_cubit.dart';

@immutable
abstract class ToDoOverviewCubitState extends Equatable {
  @override
  List<Object?> get props => [];
}

class ToDoOverviewCubitInitial extends ToDoOverviewCubitState {}

class ToDoOverviewCubitLoadingState extends ToDoOverviewCubitState {}

class ToDoOverviewCubitErrorState extends ToDoOverviewCubitState {}

class ToDoOverviewCubitLoadedState extends ToDoOverviewCubitState {
  ToDoOverviewCubitLoadedState({
    required this.collections,
  });

  final List<ToDoCollection> collections;

  List<Object> get props => [
        collections,
      ];
}
