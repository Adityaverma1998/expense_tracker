import 'package:expense_tracker/di/serivce_locator.dart';
import 'package:expense_tracker/domain/usecase/post/get_post_usecase.dart';
import 'package:expense_tracker/presentation/post/bloc/post_bloc.dart';

mixin BlocModule {
  static Future<void> configureBlocModuleInjection() async {
    getIt.registerFactory<PostBloc>(() => PostBloc(getIt<FetchPostsUseCase>()));
  }
}
