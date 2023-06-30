import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:todo_app/1_domain/entities/unique_id.dart';

part 'navigation_home_cubit_state.dart';

class NavigationToDoCubit extends Cubit<NavigationToDoCubitState> {
  NavigationToDoCubit() : super(NavigationToDoCubitStateInitial());

  void selectedToDoCollectionChanged(CollectionId collectionId) {
    emit(
      NavigationToDoCubitState(selectedCollectionId: collectionId),
    );
  }

  void secondBodyHasChanged({required bool isSecondBodyDisplayed}) {
    emit(
      NavigationToDoCubitState(
        isSecondBodyDisplayed: isSecondBodyDisplayed,
        selectedCollectionId: state.selectedCollectionId,
      ),
    );
  }
}
