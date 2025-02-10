import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:local_marketplace/core/di/injection.config.dart';

final GetIt getIt = GetIt.instance;

@InjectableInit()
void configureDependencies() => getIt.init();
