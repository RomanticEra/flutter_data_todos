

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: directives_ordering, top_level_function_literal_block

import 'package:flutter_data/flutter_data.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:path_provider/path_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:flutter_data_todos/models/todo.dart';
import 'package:flutter_data_todos/models/theme.dart';
import 'package:flutter_data_todos/models/user.dart';

// ignore: prefer_function_declarations_over_variables
ConfigureRepositoryLocalStorage configureRepositoryLocalStorage = ({FutureFn<String>? baseDirFn, List<int>? encryptionKey, bool? clear}) {
  if (!kIsWeb) {
    baseDirFn ??= () => getApplicationDocumentsDirectory().then((dir) => dir.path);
  } else {
    baseDirFn ??= () => '';
  }
  
  return hiveLocalStorageProvider
    .overrideWithProvider(Provider((ref) => HiveLocalStorage(
            hive: ref.read(hiveProvider),
            baseDirFn: baseDirFn,
            encryptionKey: encryptionKey,
            clear: clear,
          )));
};

final repositoryProviders = <String, Provider<Repository<DataModel>>>{
  'todos': todosRepositoryProvider,
'uISettings': uISettingsRepositoryProvider,
'users': usersRepositoryProvider
};

final repositoryInitializerProvider =
  FutureProvider<RepositoryInitializer>((ref) async {
    final adapters = <String, RemoteAdapter>{'todos': ref.watch(internalTodosRemoteAdapterProvider), 'uISettings': ref.watch(internalUISettingsRemoteAdapterProvider), 'users': ref.watch(internalUsersRemoteAdapterProvider)};
    final remotes = <String, bool>{'todos': true, 'uISettings': true, 'users': true};

    await ref.watch(graphNotifierProvider).initialize();

    // initialize and register
    for (final type in repositoryProviders.keys) {
      final repository = ref.read(repositoryProviders[type]!);
      repository.dispose();
      await repository.initialize(
        remote: remotes[type],
        adapters: adapters,
      );
      internalRepositories[type] = repository;
    }

    return RepositoryInitializer();
});
extension RepositoryWidgetRefX on WidgetRef {
  Repository<Todo> get todos => watch(todosRepositoryProvider)..remoteAdapter.internalWatch = watch;
  Repository<UISetting> get uISettings => watch(uISettingsRepositoryProvider)..remoteAdapter.internalWatch = watch;
  Repository<User> get users => watch(usersRepositoryProvider)..remoteAdapter.internalWatch = watch;
}

extension RepositoryRefX on Ref {

  Repository<Todo> get todos => watch(todosRepositoryProvider)..remoteAdapter.internalWatch = watch as Watcher;
  Repository<UISetting> get uISettings => watch(uISettingsRepositoryProvider)..remoteAdapter.internalWatch = watch as Watcher;
  Repository<User> get users => watch(usersRepositoryProvider)..remoteAdapter.internalWatch = watch as Watcher;
}