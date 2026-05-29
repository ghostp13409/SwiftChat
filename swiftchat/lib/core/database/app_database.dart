import 'dart:io';
import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;

part 'app_database.g.dart';

class Profiles extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get peerId => text().unique()();
  TextColumn get username => text()();
  TextColumn get bio => text().nullable()();
  TextColumn get photoPath => text().nullable()();
  TextColumn get publicKey => text()();
  TextColumn get topics => text().map(const ListConverter())(); // Custom converter for List<String>
  BoolColumn get isMe => boolean().withDefault(const Constant(false))();
}

class ListConverter extends TypeConverter<List<String>, String> {
  const ListConverter();
  @override
  List<String> fromSql(String fromDb) {
    return fromDb.isEmpty ? [] : fromDb.split(',');
  }

  @override
  String toSql(List<String> value) {
    return value.join(',');
  }
}

@DriftDatabase(tables: [Profiles])
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());
  AppDatabase.withExecutor(QueryExecutor e) : super(e);

  @override
  int get schemaVersion => 1;
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'db.sqlite'));
    return NativeDatabase(file);
  });
}
