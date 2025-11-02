import 'package:expense_tracker/core/localization/app_localization.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          AppLocalization.tr("app_title"),
          style: Theme.of(context).textTheme.titleLarge,
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.language),
            onPressed: () => AppLocalization.toggleLanguage(context),
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              AppLocalization.tr("greeting"),
              style: Theme.of(context).textTheme.displayLarge,
            ),
            const SizedBox(height: 8),
            Text(
              AppLocalization.tr("button_text"),
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            const SizedBox(height: 8),
            Text(
              AppLocalization.tr("change_language"),
              style: Theme.of(context).textTheme.labelLarge,
            ),
          ],
        ),
      ),
    );
  }
}
