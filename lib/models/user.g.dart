// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) {
  return User(
    id: json['id'] as int,
    name: json['name'] as String,
    todos: json['todos'] == null
        ? null
        : HasMany.fromJson(json['todos'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'todos': instance.todos,
    };

// **************************************************************************
// RepositoryGenerator
// **************************************************************************

// ignore_for_file: invalid_use_of_protected_member, invalid_use_of_visible_for_testing_member, non_constant_identifier_names

mixin $UserLocalAdapter on LocalAdapter<User> {
  @override
  Map<String, Map<String, Object>> relationshipsFor([User model]) => {
        'todos': {
          'name': 'todos',
          'inverse': 'user',
          'type': 'todos',
          'kind': 'HasMany',
          'instance': model?.todos
        }
      };

  @override
  User deserialize(map) {
    for (final key in relationshipsFor().keys) {
      map[key] = {
        '_': [map[key], !map.containsKey(key)],
      };
    }
    return _$UserFromJson(map);
  }

  @override
  Map<String, dynamic> serialize(model) => _$UserToJson(model);
}

// ignore: must_be_immutable
class $UserHiveLocalAdapter = HiveLocalAdapter<User> with $UserLocalAdapter;

class $UserRemoteAdapter = RemoteAdapter<User>
    with JSONPlaceholderAdapter<User>;

//

final userLocalAdapterProvider =
    Provider<LocalAdapter<User>>((ref) => $UserHiveLocalAdapter(ref));

final userRemoteAdapterProvider = Provider<RemoteAdapter<User>>(
    (ref) => $UserRemoteAdapter(ref.read(userLocalAdapterProvider)));

final userRepositoryProvider =
    Provider<Repository<User>>((ref) => Repository<User>(ref));

final _watchUser = StateNotifierProvider.autoDispose
    .family<DataStateNotifier<User>, WatchArgs<User>>((ref, args) {
  return ref.watch(userRepositoryProvider).watchOne(args.id,
      remote: args.remote,
      params: args.params,
      headers: args.headers,
      alsoWatch: args.alsoWatch);
});

AutoDisposeStateNotifierProvider<DataStateNotifier<User>> watchUser(dynamic id,
    {bool remote = true,
    Map<String, dynamic> params = const {},
    Map<String, String> headers = const {},
    AlsoWatch<User> alsoWatch}) {
  return _watchUser(WatchArgs(
      id: id,
      remote: remote,
      params: params,
      headers: headers,
      alsoWatch: alsoWatch));
}

final _watchUsers = StateNotifierProvider.autoDispose
    .family<DataStateNotifier<List<User>>, WatchArgs<User>>((ref, args) {
  ref.maintainState = false;
  return ref.watch(userRepositoryProvider).watchAll(
      remote: args.remote,
      params: args.params,
      headers: args.headers,
      filterLocal: args.filterLocal,
      syncLocal: args.syncLocal);
});

AutoDisposeStateNotifierProvider<DataStateNotifier<List<User>>> watchUsers(
    {bool remote, Map<String, dynamic> params, Map<String, String> headers}) {
  return _watchUsers(
      WatchArgs(remote: remote, params: params, headers: headers));
}

extension UserX on User {
  /// Initializes "fresh" models (i.e. manually instantiated) to use
  /// [save], [delete] and so on.
  ///
  /// Requires a `Reader read` (unless using GetIt).
  ///
  /// Can be obtained via `context.read`, `ref.read`, `container.read`
  User init(Reader read) {
    final repository = internalLocatorFn(userRepositoryProvider, read);
    return repository.remoteAdapter.initializeModel(this, save: true);
  }
}
