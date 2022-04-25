import 'package:flutter_test/flutter_test.dart';
import 'package:lib_dependencies/lib_dependencies.dart';
import 'package:lib_reminder/src/domain/entities/reminder_entity.dart';
import 'package:lib_reminder/src/domain/repositories/i_reminder_repository.dart';
import 'package:lib_reminder/src/domain/usercases/get_reminder_usercase.dart';
import 'package:mocktail/mocktail.dart';

class MockReminderRepository extends Mock implements IReminderRepository {}

void main() {
  late GetReminderUserCase useCase;
  late MockReminderRepository mockRepository;

  setUp(() {
    mockRepository = MockReminderRepository();
    useCase = GetReminderUserCase(reminderRepository: mockRepository);
  });

  test("should return Reminder", () async {
    const reminder = Reminder(
        codigoReminder: 1, titleReminder: 'title', bodyReminder: 'body');

    // when(() => mockRepository.getReminder(
    //         codigoReminder: any(named: 'codigoReminder')))
    //     .thenAnswer((_) async => const Right(reminder));

    final result = await useCase(ParamsGetReminderUserCase(codigoReminder: 1));

    expect(result, equals(const Right(reminder)));
  });
}
