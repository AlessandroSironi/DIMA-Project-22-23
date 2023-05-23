import 'dart:async';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'foods_record.g.dart';

abstract class FoodsRecord implements Built<FoodsRecord, FoodsRecordBuilder> {
  static Serializer<FoodsRecord> get serializer => _$foodsRecordSerializer;

  double? get kcal;

  double? get carbs;

  double? get proteins;

  double? get fats;

  DateTime? get datetime;

  String? get name;

  String? get meal;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  DocumentReference get parentReference => reference.parent.parent!;

  static void _initializeBuilder(FoodsRecordBuilder builder) => builder
    ..kcal = 0.0
    ..carbs = 0.0
    ..proteins = 0.0
    ..fats = 0.0
    ..name = ''
    ..meal = '';

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('foods')
          : FirebaseFirestore.instance.collectionGroup('foods');

  static DocumentReference createDoc(DocumentReference parent) =>
      parent.collection('foods').doc();

  static Stream<FoodsRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<FoodsRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  FoodsRecord._();
  factory FoodsRecord([void Function(FoodsRecordBuilder) updates]) =
      _$FoodsRecord;

  static FoodsRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createFoodsRecordData({
  double? kcal,
  double? carbs,
  double? proteins,
  double? fats,
  DateTime? datetime,
  String? name,
  String? meal,
}) {
  final firestoreData = serializers.toFirestore(
    FoodsRecord.serializer,
    FoodsRecord(
      (f) => f
        ..kcal = kcal
        ..carbs = carbs
        ..proteins = proteins
        ..fats = fats
        ..datetime = datetime
        ..name = name
        ..meal = meal,
    ),
  );

  return firestoreData;
}
