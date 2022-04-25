import 'package:flutter_test/flutter_test.dart';
import 'package:lib_core/lib_core.dart';
import 'package:lib_dependencies/lib_dependencies.dart';
import 'package:lib_reminder/lib_reminder.dart';
import 'package:mocktail/mocktail.dart';

class MockReminderRepository extends Mock implements IReminderRepository {}

void main() {
  late SetReminderListUsecase usecase;
  late MockReminderRepository mockRepository;

  setUp(() {
    mockRepository = MockReminderRepository();
    usecase = SetReminderListUsecase(reminderRepository: mockRepository);
  });

  const reminder = Reminder(
    codigoReminder: 1,
    titleReminder: 'title',
    bodyReminder: 'body',
  );

  const listReminder = [reminder];

  test('should update list reminders local', () async {
    when(() => mockRepository.setReminderList(reminders: listReminder))
        .thenAnswer((_) async => const Right(true));

    final result =
        await usecase(ParamsSetReminderListUsecase(reminders: listReminder));

    expect(result, const Right(true));
    verify(() => mockRepository.setReminderList(reminders: listReminder))
        .called(1);
    verifyNoMoreInteractions(mockRepository);
  });

  test('should return error from update list reminders local', () async {
    when(() => mockRepository.setReminderList(reminders: listReminder))
        .thenAnswer((_) async => const Left(SetReminderFailure()));

    final result =
        await usecase(ParamsSetReminderListUsecase(reminders: listReminder));

    expect(result, const Left(SetReminderFailure()));
    verify(() => mockRepository.setReminderList(reminders: listReminder))
        .called(1);
    verifyNoMoreInteractions(mockRepository);
  });
}
