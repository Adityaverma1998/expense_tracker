import 'package:expense_tracker/core/theme/app_theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Theming Demo',
      theme: AppTheme.light,
      // darkTheme: AppTheme.dark,
      themeMode: AppTheme.themeMode,
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            "App Theme Demo",
            style: Theme.of(context).textTheme.titleLarge,
          ),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Hello Theme!",
                style: Theme.of(context).textTheme.displayLarge, // big bold text
              ),
              const SizedBox(height: 8),
              Text(
                "This is bodyMedium text",
                style: Theme.of(context).textTheme.bodyMedium, // regular paragraph
              ),
              const SizedBox(height: 8),
              Text(
                "Secondary label example",
                style: Theme.of(context).textTheme.labelLarge, // button or small label
              ),
            ],
          ),
        ),
      ),

    );

  }
}
