import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

import 'injector.config.dart';

final GetIt getIt = GetIt.instance;

@injectableInit
void configureInjection({String? environment, EnvironmentFilter? environmentFilter}) => getIt.init(
      environment: environment,
      environmentFilter: environmentFilter,
    );
