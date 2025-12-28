import 'package:expense_tracker/data/di/module/local_module.dart';
import 'package:expense_tracker/data/di/module/remote_module.dart';
import 'package:expense_tracker/data/di/module/repository_module.dart';

mixin DataLayerInjection {
  static Future<void> configureDataLayerInjection() async {
    await LocalModule.configureLocalModuleInjection();
    await RemoteModule.configureRemoteModuleInjection();
    await RepositoryModule.configureRepositoryModuleInjection();
  }
}
