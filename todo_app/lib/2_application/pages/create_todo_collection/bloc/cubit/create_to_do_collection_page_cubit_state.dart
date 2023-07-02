part of 'create_to_do_collection_page_cubit.dart';

@immutable
class CreateToDoCollectionPageCubitState extends Equatable {
  const CreateToDoCollectionPageCubitState({this.title, this.color});

  final String? title;
  final String? color;

  CreateToDoCollectionPageCubitState copyWith({
    String? title,
    String? color,
  }) {
    return CreateToDoCollectionPageCubitState(
      color: color ?? this.color,
      title: title ?? this.title,
    );
  }

  @override
  List<Object?> get props => [
        title,
        color,
      ];
}

class CreateToDoCollectionPageCubitInitial
    extends CreateToDoCollectionPageCubitState {}
