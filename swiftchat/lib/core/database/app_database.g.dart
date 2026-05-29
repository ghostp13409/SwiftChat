// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_database.dart';

// ignore_for_file: type=lint
class $ProfilesTable extends Profiles with TableInfo<$ProfilesTable, Profile> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ProfilesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _peerIdMeta = const VerificationMeta('peerId');
  @override
  late final GeneratedColumn<String> peerId = GeneratedColumn<String>(
    'peer_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways('UNIQUE'),
  );
  static const VerificationMeta _usernameMeta = const VerificationMeta(
    'username',
  );
  @override
  late final GeneratedColumn<String> username = GeneratedColumn<String>(
    'username',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _bioMeta = const VerificationMeta('bio');
  @override
  late final GeneratedColumn<String> bio = GeneratedColumn<String>(
    'bio',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _photoPathMeta = const VerificationMeta(
    'photoPath',
  );
  @override
  late final GeneratedColumn<String> photoPath = GeneratedColumn<String>(
    'photo_path',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _publicKeyMeta = const VerificationMeta(
    'publicKey',
  );
  @override
  late final GeneratedColumn<String> publicKey = GeneratedColumn<String>(
    'public_key',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  @override
  late final GeneratedColumnWithTypeConverter<List<String>, String> topics =
      GeneratedColumn<String>(
        'topics',
        aliasedName,
        false,
        type: DriftSqlType.string,
        requiredDuringInsert: true,
      ).withConverter<List<String>>($ProfilesTable.$convertertopics);
  static const VerificationMeta _isMeMeta = const VerificationMeta('isMe');
  @override
  late final GeneratedColumn<bool> isMe = GeneratedColumn<bool>(
    'is_me',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_me" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    peerId,
    username,
    bio,
    photoPath,
    publicKey,
    topics,
    isMe,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'profiles';
  @override
  VerificationContext validateIntegrity(
    Insertable<Profile> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('peer_id')) {
      context.handle(
        _peerIdMeta,
        peerId.isAcceptableOrUnknown(data['peer_id']!, _peerIdMeta),
      );
    } else if (isInserting) {
      context.missing(_peerIdMeta);
    }
    if (data.containsKey('username')) {
      context.handle(
        _usernameMeta,
        username.isAcceptableOrUnknown(data['username']!, _usernameMeta),
      );
    } else if (isInserting) {
      context.missing(_usernameMeta);
    }
    if (data.containsKey('bio')) {
      context.handle(
        _bioMeta,
        bio.isAcceptableOrUnknown(data['bio']!, _bioMeta),
      );
    }
    if (data.containsKey('photo_path')) {
      context.handle(
        _photoPathMeta,
        photoPath.isAcceptableOrUnknown(data['photo_path']!, _photoPathMeta),
      );
    }
    if (data.containsKey('public_key')) {
      context.handle(
        _publicKeyMeta,
        publicKey.isAcceptableOrUnknown(data['public_key']!, _publicKeyMeta),
      );
    } else if (isInserting) {
      context.missing(_publicKeyMeta);
    }
    if (data.containsKey('is_me')) {
      context.handle(
        _isMeMeta,
        isMe.isAcceptableOrUnknown(data['is_me']!, _isMeMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Profile map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Profile(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      peerId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}peer_id'],
      )!,
      username: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}username'],
      )!,
      bio: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}bio'],
      ),
      photoPath: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}photo_path'],
      ),
      publicKey: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}public_key'],
      )!,
      topics: $ProfilesTable.$convertertopics.fromSql(
        attachedDatabase.typeMapping.read(
          DriftSqlType.string,
          data['${effectivePrefix}topics'],
        )!,
      ),
      isMe: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}is_me'],
      )!,
    );
  }

  @override
  $ProfilesTable createAlias(String alias) {
    return $ProfilesTable(attachedDatabase, alias);
  }

  static TypeConverter<List<String>, String> $convertertopics =
      const ListConverter();
}

class Profile extends DataClass implements Insertable<Profile> {
  final int id;
  final String peerId;
  final String username;
  final String? bio;
  final String? photoPath;
  final String publicKey;
  final List<String> topics;
  final bool isMe;
  const Profile({
    required this.id,
    required this.peerId,
    required this.username,
    this.bio,
    this.photoPath,
    required this.publicKey,
    required this.topics,
    required this.isMe,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['peer_id'] = Variable<String>(peerId);
    map['username'] = Variable<String>(username);
    if (!nullToAbsent || bio != null) {
      map['bio'] = Variable<String>(bio);
    }
    if (!nullToAbsent || photoPath != null) {
      map['photo_path'] = Variable<String>(photoPath);
    }
    map['public_key'] = Variable<String>(publicKey);
    {
      map['topics'] = Variable<String>(
        $ProfilesTable.$convertertopics.toSql(topics),
      );
    }
    map['is_me'] = Variable<bool>(isMe);
    return map;
  }

  ProfilesCompanion toCompanion(bool nullToAbsent) {
    return ProfilesCompanion(
      id: Value(id),
      peerId: Value(peerId),
      username: Value(username),
      bio: bio == null && nullToAbsent ? const Value.absent() : Value(bio),
      photoPath: photoPath == null && nullToAbsent
          ? const Value.absent()
          : Value(photoPath),
      publicKey: Value(publicKey),
      topics: Value(topics),
      isMe: Value(isMe),
    );
  }

  factory Profile.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Profile(
      id: serializer.fromJson<int>(json['id']),
      peerId: serializer.fromJson<String>(json['peerId']),
      username: serializer.fromJson<String>(json['username']),
      bio: serializer.fromJson<String?>(json['bio']),
      photoPath: serializer.fromJson<String?>(json['photoPath']),
      publicKey: serializer.fromJson<String>(json['publicKey']),
      topics: serializer.fromJson<List<String>>(json['topics']),
      isMe: serializer.fromJson<bool>(json['isMe']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'peerId': serializer.toJson<String>(peerId),
      'username': serializer.toJson<String>(username),
      'bio': serializer.toJson<String?>(bio),
      'photoPath': serializer.toJson<String?>(photoPath),
      'publicKey': serializer.toJson<String>(publicKey),
      'topics': serializer.toJson<List<String>>(topics),
      'isMe': serializer.toJson<bool>(isMe),
    };
  }

  Profile copyWith({
    int? id,
    String? peerId,
    String? username,
    Value<String?> bio = const Value.absent(),
    Value<String?> photoPath = const Value.absent(),
    String? publicKey,
    List<String>? topics,
    bool? isMe,
  }) => Profile(
    id: id ?? this.id,
    peerId: peerId ?? this.peerId,
    username: username ?? this.username,
    bio: bio.present ? bio.value : this.bio,
    photoPath: photoPath.present ? photoPath.value : this.photoPath,
    publicKey: publicKey ?? this.publicKey,
    topics: topics ?? this.topics,
    isMe: isMe ?? this.isMe,
  );
  Profile copyWithCompanion(ProfilesCompanion data) {
    return Profile(
      id: data.id.present ? data.id.value : this.id,
      peerId: data.peerId.present ? data.peerId.value : this.peerId,
      username: data.username.present ? data.username.value : this.username,
      bio: data.bio.present ? data.bio.value : this.bio,
      photoPath: data.photoPath.present ? data.photoPath.value : this.photoPath,
      publicKey: data.publicKey.present ? data.publicKey.value : this.publicKey,
      topics: data.topics.present ? data.topics.value : this.topics,
      isMe: data.isMe.present ? data.isMe.value : this.isMe,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Profile(')
          ..write('id: $id, ')
          ..write('peerId: $peerId, ')
          ..write('username: $username, ')
          ..write('bio: $bio, ')
          ..write('photoPath: $photoPath, ')
          ..write('publicKey: $publicKey, ')
          ..write('topics: $topics, ')
          ..write('isMe: $isMe')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    peerId,
    username,
    bio,
    photoPath,
    publicKey,
    topics,
    isMe,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Profile &&
          other.id == this.id &&
          other.peerId == this.peerId &&
          other.username == this.username &&
          other.bio == this.bio &&
          other.photoPath == this.photoPath &&
          other.publicKey == this.publicKey &&
          other.topics == this.topics &&
          other.isMe == this.isMe);
}

class ProfilesCompanion extends UpdateCompanion<Profile> {
  final Value<int> id;
  final Value<String> peerId;
  final Value<String> username;
  final Value<String?> bio;
  final Value<String?> photoPath;
  final Value<String> publicKey;
  final Value<List<String>> topics;
  final Value<bool> isMe;
  const ProfilesCompanion({
    this.id = const Value.absent(),
    this.peerId = const Value.absent(),
    this.username = const Value.absent(),
    this.bio = const Value.absent(),
    this.photoPath = const Value.absent(),
    this.publicKey = const Value.absent(),
    this.topics = const Value.absent(),
    this.isMe = const Value.absent(),
  });
  ProfilesCompanion.insert({
    this.id = const Value.absent(),
    required String peerId,
    required String username,
    this.bio = const Value.absent(),
    this.photoPath = const Value.absent(),
    required String publicKey,
    required List<String> topics,
    this.isMe = const Value.absent(),
  }) : peerId = Value(peerId),
       username = Value(username),
       publicKey = Value(publicKey),
       topics = Value(topics);
  static Insertable<Profile> custom({
    Expression<int>? id,
    Expression<String>? peerId,
    Expression<String>? username,
    Expression<String>? bio,
    Expression<String>? photoPath,
    Expression<String>? publicKey,
    Expression<String>? topics,
    Expression<bool>? isMe,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (peerId != null) 'peer_id': peerId,
      if (username != null) 'username': username,
      if (bio != null) 'bio': bio,
      if (photoPath != null) 'photo_path': photoPath,
      if (publicKey != null) 'public_key': publicKey,
      if (topics != null) 'topics': topics,
      if (isMe != null) 'is_me': isMe,
    });
  }

  ProfilesCompanion copyWith({
    Value<int>? id,
    Value<String>? peerId,
    Value<String>? username,
    Value<String?>? bio,
    Value<String?>? photoPath,
    Value<String>? publicKey,
    Value<List<String>>? topics,
    Value<bool>? isMe,
  }) {
    return ProfilesCompanion(
      id: id ?? this.id,
      peerId: peerId ?? this.peerId,
      username: username ?? this.username,
      bio: bio ?? this.bio,
      photoPath: photoPath ?? this.photoPath,
      publicKey: publicKey ?? this.publicKey,
      topics: topics ?? this.topics,
      isMe: isMe ?? this.isMe,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (peerId.present) {
      map['peer_id'] = Variable<String>(peerId.value);
    }
    if (username.present) {
      map['username'] = Variable<String>(username.value);
    }
    if (bio.present) {
      map['bio'] = Variable<String>(bio.value);
    }
    if (photoPath.present) {
      map['photo_path'] = Variable<String>(photoPath.value);
    }
    if (publicKey.present) {
      map['public_key'] = Variable<String>(publicKey.value);
    }
    if (topics.present) {
      map['topics'] = Variable<String>(
        $ProfilesTable.$convertertopics.toSql(topics.value),
      );
    }
    if (isMe.present) {
      map['is_me'] = Variable<bool>(isMe.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ProfilesCompanion(')
          ..write('id: $id, ')
          ..write('peerId: $peerId, ')
          ..write('username: $username, ')
          ..write('bio: $bio, ')
          ..write('photoPath: $photoPath, ')
          ..write('publicKey: $publicKey, ')
          ..write('topics: $topics, ')
          ..write('isMe: $isMe')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $ProfilesTable profiles = $ProfilesTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [profiles];
}

typedef $$ProfilesTableCreateCompanionBuilder =
    ProfilesCompanion Function({
      Value<int> id,
      required String peerId,
      required String username,
      Value<String?> bio,
      Value<String?> photoPath,
      required String publicKey,
      required List<String> topics,
      Value<bool> isMe,
    });
typedef $$ProfilesTableUpdateCompanionBuilder =
    ProfilesCompanion Function({
      Value<int> id,
      Value<String> peerId,
      Value<String> username,
      Value<String?> bio,
      Value<String?> photoPath,
      Value<String> publicKey,
      Value<List<String>> topics,
      Value<bool> isMe,
    });

class $$ProfilesTableFilterComposer
    extends Composer<_$AppDatabase, $ProfilesTable> {
  $$ProfilesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get peerId => $composableBuilder(
    column: $table.peerId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get username => $composableBuilder(
    column: $table.username,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get bio => $composableBuilder(
    column: $table.bio,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get photoPath => $composableBuilder(
    column: $table.photoPath,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get publicKey => $composableBuilder(
    column: $table.publicKey,
    builder: (column) => ColumnFilters(column),
  );

  ColumnWithTypeConverterFilters<List<String>, List<String>, String>
  get topics => $composableBuilder(
    column: $table.topics,
    builder: (column) => ColumnWithTypeConverterFilters(column),
  );

  ColumnFilters<bool> get isMe => $composableBuilder(
    column: $table.isMe,
    builder: (column) => ColumnFilters(column),
  );
}

class $$ProfilesTableOrderingComposer
    extends Composer<_$AppDatabase, $ProfilesTable> {
  $$ProfilesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get peerId => $composableBuilder(
    column: $table.peerId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get username => $composableBuilder(
    column: $table.username,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get bio => $composableBuilder(
    column: $table.bio,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get photoPath => $composableBuilder(
    column: $table.photoPath,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get publicKey => $composableBuilder(
    column: $table.publicKey,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get topics => $composableBuilder(
    column: $table.topics,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get isMe => $composableBuilder(
    column: $table.isMe,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$ProfilesTableAnnotationComposer
    extends Composer<_$AppDatabase, $ProfilesTable> {
  $$ProfilesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get peerId =>
      $composableBuilder(column: $table.peerId, builder: (column) => column);

  GeneratedColumn<String> get username =>
      $composableBuilder(column: $table.username, builder: (column) => column);

  GeneratedColumn<String> get bio =>
      $composableBuilder(column: $table.bio, builder: (column) => column);

  GeneratedColumn<String> get photoPath =>
      $composableBuilder(column: $table.photoPath, builder: (column) => column);

  GeneratedColumn<String> get publicKey =>
      $composableBuilder(column: $table.publicKey, builder: (column) => column);

  GeneratedColumnWithTypeConverter<List<String>, String> get topics =>
      $composableBuilder(column: $table.topics, builder: (column) => column);

  GeneratedColumn<bool> get isMe =>
      $composableBuilder(column: $table.isMe, builder: (column) => column);
}

class $$ProfilesTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $ProfilesTable,
          Profile,
          $$ProfilesTableFilterComposer,
          $$ProfilesTableOrderingComposer,
          $$ProfilesTableAnnotationComposer,
          $$ProfilesTableCreateCompanionBuilder,
          $$ProfilesTableUpdateCompanionBuilder,
          (Profile, BaseReferences<_$AppDatabase, $ProfilesTable, Profile>),
          Profile,
          PrefetchHooks Function()
        > {
  $$ProfilesTableTableManager(_$AppDatabase db, $ProfilesTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ProfilesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ProfilesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$ProfilesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> peerId = const Value.absent(),
                Value<String> username = const Value.absent(),
                Value<String?> bio = const Value.absent(),
                Value<String?> photoPath = const Value.absent(),
                Value<String> publicKey = const Value.absent(),
                Value<List<String>> topics = const Value.absent(),
                Value<bool> isMe = const Value.absent(),
              }) => ProfilesCompanion(
                id: id,
                peerId: peerId,
                username: username,
                bio: bio,
                photoPath: photoPath,
                publicKey: publicKey,
                topics: topics,
                isMe: isMe,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String peerId,
                required String username,
                Value<String?> bio = const Value.absent(),
                Value<String?> photoPath = const Value.absent(),
                required String publicKey,
                required List<String> topics,
                Value<bool> isMe = const Value.absent(),
              }) => ProfilesCompanion.insert(
                id: id,
                peerId: peerId,
                username: username,
                bio: bio,
                photoPath: photoPath,
                publicKey: publicKey,
                topics: topics,
                isMe: isMe,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$ProfilesTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $ProfilesTable,
      Profile,
      $$ProfilesTableFilterComposer,
      $$ProfilesTableOrderingComposer,
      $$ProfilesTableAnnotationComposer,
      $$ProfilesTableCreateCompanionBuilder,
      $$ProfilesTableUpdateCompanionBuilder,
      (Profile, BaseReferences<_$AppDatabase, $ProfilesTable, Profile>),
      Profile,
      PrefetchHooks Function()
    >;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$ProfilesTableTableManager get profiles =>
      $$ProfilesTableTableManager(_db, _db.profiles);
}
