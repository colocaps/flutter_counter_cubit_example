import 'package:core/core.dart';
import 'package:ejemplo_cubit_clean_arch/bussines_logic/counter_cubit/counter_cubit.dart';

abstract class IoCManager {
  static late InjectorContainer injector;
  static void registerDependencies() {
    injector = InjectorContainer.register(GetItInjector());

    injector.registerLazySingleton<CounterCubit>(
      () => CounterCubit(),
    );
  }
}
