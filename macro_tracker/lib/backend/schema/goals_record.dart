import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'goals_record.g.dart';

abstract class GoalsRecord implements Built<GoalsRecord, GoalsRecordBuilder> {
  static Serializer<GoalsRecord> get serializer => _$goalsRecordSerializer;

  double? get carbsGoal;

  double? get proteinsGoal;

  double? get fatsGoal;

  double? get kcalGoal;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  DocumentReference get parentReference => reference.parent.parent!;

  static void _initializeBuilder(GoalsRecordBuilder builder) => builder
    ..carbsGoal = 0.0
    ..proteinsGoal = 0.0
    ..fatsGoal = 0.0
    ..kcalGoal = 0.0;

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('goals')
          : FirebaseFirestore.instance.collectionGroup('goals');

  static DocumentReference createDoc(DocumentReference parent) =>
      parent.collection('goals').doc();

  static Stream<GoalsRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<GoalsRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  GoalsRecord._();
  factory GoalsRecord([void Function(GoalsRecordBuilder) updates]) =
      _$GoalsRecord;

  static GoalsRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createGoalsRecordData({
  double? carbsGoal,
  double? proteinsGoal,
  double? fatsGoal,
  double? kcalGoal,
}) {
  final firestoreData = serializers.toFirestore(
    GoalsRecord.serializer,
    GoalsRecord(
      (g) => g
        ..carbsGoal = carbsGoal
        ..proteinsGoal = proteinsGoal
        ..fatsGoal = fatsGoal
        ..kcalGoal = kcalGoal,
    ),
  );

  return firestoreData;
}
