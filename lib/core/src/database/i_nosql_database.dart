// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:io';

import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sembast/sembast.dart';
import 'package:sembast/sembast_io.dart';

abstract class IStringNoSqlDatabase {
  final String databaseName = 'db_reminder';

  String get storeName;

  Database? _database;
  StoreRef<String, Map<String, dynamic>>? _store;

  Future<Database> get database async => _database ??= await _open();

  Future<StoreRef<String, Map<String, dynamic>>> get store async {
    _database ??= await _open();

    return _store ??= stringMapStoreFactory.store(storeName);
  }

  Future<Database> _open() async {
    final String databasePath = await _getDatabasesPath();

    final database = await databaseFactoryIo.openDatabase(databasePath);

    return database;
  }

  Future<String> _getDatabasesPath() async {
    final Directory dir = await getApplicationDocumentsDirectory();
    await dir.create(recursive: true);
    final String dbPath = join(dir.path, databaseName);

    return dbPath;
  }

  Future dropStore() async {
    await (await store).drop(await database);
  }
}

abstract class IIntNoSQLDatabase {
  final String databaseName = 'db_reminder';
  String get storeName;

  Database? _database;
  StoreRef<int, Map<String, dynamic>>? _store;

  Future<Database> get database async => _database ??= await _open();

  Future<StoreRef<int, Map<String, dynamic>>> get store async {
    _database ??= await _open();

    return _store ??= intMapStoreFactory.store(storeName);
  }

  Future<Database> _open() async {
    final String databasePath = await _getDatabasesPath();

    final database = await databaseFactoryIo.openDatabase(databasePath);

    return database;
  }

  Future<String> _getDatabasesPath() async {
    final Directory dir = await getApplicationDocumentsDirectory();
    await dir.create(recursive: true);
    final String dbPath = join(dir.path, databaseName);

    return dbPath;
  }

  Future dropStore() async {
    await (await store).drop(await database);
  }
}
