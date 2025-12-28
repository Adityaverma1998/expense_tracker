import 'package:easy_localization/easy_localization.dart';
import 'package:expense_tracker/core/localization/app_localization.dart';
import 'package:expense_tracker/core/theme/app_theme.dart';
import 'package:expense_tracker/core/widget/offline_wrapper/offline_wrapper.dart';
import 'package:expense_tracker/di/serivce_locator.dart';
import 'package:expense_tracker/presentation/network/bloc/network_bloc.dart';
import 'package:expense_tracker/presentation/post/bloc/post_bloc.dart';
import 'package:expense_tracker/presentation/post/view/screen/post_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<PostBloc>(create: (_) => getIt<PostBloc>()),
        BlocProvider<NetworkBloc>(
          create: (_) => getIt<NetworkBloc>()..add(StartNetworkWatcher()),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Theming Demo',
        theme: AppTheme.light,
        themeMode: AppTheme.themeMode,
        supportedLocales: AppLocalization.supportedLocales,
        localizationsDelegates: context.localizationDelegates,
        locale: context.locale,
        home: OfflineWrapper(child: const PostPage()),
      ),
    );
  }
}
