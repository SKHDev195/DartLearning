part of 'navigation_todo_cubit.dart';

@immutable
abstract class NavigationToDoCubitState extends Equatable {
  const NavigationToDoCubitState({
    this.selectedCollectionId,
    this.isSecondBodyDisplayed,
  });

  final CollectionId? selectedCollectionId;
  final bool? isSecondBodyDisplayed;

  @override
  List<Object?> get props => [
        selectedCollectionId,
        isSecondBodyDisplayed,
      ];
}

class NavigationToDoCubitInitial extends NavigationToDoCubitState {}
