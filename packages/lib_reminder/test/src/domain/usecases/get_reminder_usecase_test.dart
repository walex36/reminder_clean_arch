import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:lib_dependencies/lib_dependencies.dart';
import 'package:lib_reminder/lib_reminder.dart';
import 'package:mocktail/mocktail.dart';

class MockReminderRepository extends Mock implements IReminderRepository {}

void main() {
  late GetReminderUseCase useCase;
  late MockReminderRepository mockRepository;

  setUp(() {
    mockRepository = MockReminderRepository();
    useCase = GetReminderUseCase(reminderRepository: mockRepository);
  });

  Reminder reminder = Reminder(
    codigoReminder: 1,
    codigoCategory: 1,
    titleReminder: 'title',
    bodyReminder: 'body',
    backgroudReminder: Colors.grey.shade300,
  );

  test("should return Reminder", () async {
    when(() => mockRepository.getReminder(
            codigoReminder: any(named: 'codigoReminder')))
        .thenAnswer((_) async => Right(reminder));

    final result = await useCase(ParamsGetReminderUseCase(codigoReminder: 1));

    expect(result, equals(Right(reminder)));
  });
}
