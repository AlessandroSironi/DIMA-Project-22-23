import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:macro_tracker/index.dart';
import 'package:mockito/mockito.dart';

class MockFirestore extends Mock implements FirebaseFirestore {}

class MockCollectionReference extends Mock implements CollectionReference {}

class MockDocumentReference extends Mock implements DocumentReference {}

class MockDocumentSnapshot extends Mock implements DocumentSnapshot {}

void main() {
  MockFirestore instance;
  MockDocumentSnapshot mockDocumentSnapshot;
  MockCollectionReference mockCollectionReference;
  MockDocumentReference mockDocumentReference;
  final mockUserData = {
    "kcal_goal": "2000",
    "carbs_goal": "200",
    "proteins_goal": "180",
    "fats_goal": "80"
  };

  setUp(() {
    instance = MockFirestore();
    mockCollectionReference = MockCollectionReference();
    mockDocumentReference = MockDocumentReference();
    mockDocumentSnapshot = MockDocumentSnapshot();
  });

  testWidgets("correctly retrieve kcal value", (tester) async {
    await tester.pumpWidget(const GoalWidget());

    final kcalFinder = find.text("2000");
  });
}
