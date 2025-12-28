import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:expense_tracker/domain/entity/post_entity.dart';
import 'package:expense_tracker/domain/usecase/post/get_post_usecase.dart';

part 'post_event.dart';
part 'post_state.dart';

class PostBloc extends Bloc<PostEvent, PostState> {
  final FetchPostsUseCase fetchPostsUseCase;

  PostBloc(this.fetchPostsUseCase) : super(const PostState()) {
    on<FetchPostsEvent>(_onFetchPosts);
  }

  Future<void> _onFetchPosts(
    FetchPostsEvent event,
    Emitter<PostState> emit,
  ) async {
    emit(state.copyWith(status: PostStatus.loading));

    final result = await fetchPostsUseCase();

    result.fold(
      (error) {
        emit(state.copyWith(status: PostStatus.failure, errorMessage: error));
      },
      (posts) {
        emit(state.copyWith(status: PostStatus.success, posts: posts));
      },
    );
  }
}
