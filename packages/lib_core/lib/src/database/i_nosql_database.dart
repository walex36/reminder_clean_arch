
import 'dart:io';

import 'package:lib_dependencies/lib_dependencies.dart';

abstract class IStringNoSqlDatabase {
  
  final String databaseName = '';
  final String storeName = '';

  Database? _database;
  StoreRef<String, Map<String, dynamic>>? _store;

  Future<Database> get database async => _database ??= await _open();

  Future<StoreRef<String, Map<String, dynamic>>> get store async {
    _database ??= await _open();

    return _store ??= stringMapStoreFactory.store(storeName);
  }

  Future<Database> _open() async {
    final String databasePath =  await _getDatabasesPath();

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
  final String databaseName = '';
  final String storeName = '';

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
