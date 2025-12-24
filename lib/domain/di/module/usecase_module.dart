import 'package:expense_tracker/di/serivce_locator.dart';
import 'package:expense_tracker/domain/repository/post_repository.dart';
import 'package:expense_tracker/domain/usecase/post/get_post_usecase.dart';

mixin UseCaseModule {
  static Future<void> configureUseCaseModuleInjection() async {
    getIt.registerLazySingleton<FetchPostsUseCase>(
          () => FetchPostsUseCase(getIt<PostRepository>()),
    );

  }}