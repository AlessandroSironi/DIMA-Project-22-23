import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'diet_foods_record.g.dart';

abstract class DietFoodsRecord
    implements Built<DietFoodsRecord, DietFoodsRecordBuilder> {
  static Serializer<DietFoodsRecord> get serializer =>
      _$dietFoodsRecordSerializer;

  double? get kcal;

  double? get carbs;

  double? get proteins;

  double? get fats;

  String? get name;

  String? get meal;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  DocumentReference get parentReference => reference.parent.parent!;

  static void _initializeBuilder(DietFoodsRecordBuilder builder) => builder
    ..kcal = 0.0
    ..carbs = 0.0
    ..proteins = 0.0
    ..fats = 0.0
    ..name = ''
    ..meal = '';

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('dietFoods')
          : FirebaseFirestore.instance.collectionGroup('dietFoods');

  static DocumentReference createDoc(DocumentReference parent) =>
      parent.collection('dietFoods').doc();

  static Stream<DietFoodsRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<DietFoodsRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  DietFoodsRecord._();
  factory DietFoodsRecord([void Function(DietFoodsRecordBuilder) updates]) =
      _$DietFoodsRecord;

  static DietFoodsRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createDietFoodsRecordData({
  double? kcal,
  double? carbs,
  double? proteins,
  double? fats,
  String? name,
  String? meal,
}) {
  final firestoreData = serializers.toFirestore(
    DietFoodsRecord.serializer,
    DietFoodsRecord(
      (d) => d
        ..kcal = kcal
        ..carbs = carbs
        ..proteins = proteins
        ..fats = fats
        ..name = name
        ..meal = meal,
    ),
  );

  return firestoreData;
}
