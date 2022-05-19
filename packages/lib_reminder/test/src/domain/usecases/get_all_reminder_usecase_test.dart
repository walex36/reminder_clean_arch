import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:lib_core/lib_core.dart';
import 'package:lib_dependencies/lib_dependencies.dart';
import 'package:lib_reminder/lib_reminder.dart';
import 'package:mocktail/mocktail.dart';

class MockReminderRepository extends Mock implements IReminderRepository {}

void main() {
  late GetAllReminderUsecase usercase;
  late MockReminderRepository mockRepository;

  setUp(() {
    mockRepository = MockReminderRepository();
    usercase = GetAllReminderUsecase(reminderRepository: mockRepository);
  });

  Reminder reminder = Reminder(
    codigoReminder: 1,
    codigoCategory: 1,
    titleReminder: 'title',
    bodyReminder: 'body',
    backgroudReminder: Colors.grey.shade300,
  );

  List<Reminder> listReminder = [reminder];

  test('should return all reminders', () async {
    when(() => mockRepository.getAllReminder())
        .thenAnswer((_) async => Right(listReminder));

    final result = await usercase(ParamsGetAllReminderUseCase());

    expect(result, equals(Right(listReminder)));
    verify(() => mockRepository.getAllReminder()).called(1);
    verifyNoMoreInteractions(mockRepository);
  });

  test('should return list empty', () async {
    when(() => mockRepository.getAllReminder())
        .thenAnswer((_) async => const Right([]));

    final result = await usercase(ParamsGetAllReminderUseCase());

    expect(result, equals(const Right(<Reminder>[])));
    verify(() => mockRepository.getAllReminder()).called(1);
    verifyNoMoreInteractions(mockRepository);
  });

  test('should return ifailure', () async {
    when(() => mockRepository.getAllReminder()).thenAnswer((_) async => const Left(AllReminderFailure()));

    final result = await usercase(ParamsGetAllReminderUseCase());

    expect(result, equals(const Left(AllReminderFailure())));
    verify(() => mockRepository.getAllReminder()).called(1);
    verifyNoMoreInteractions(mockRepository);
  });
}
