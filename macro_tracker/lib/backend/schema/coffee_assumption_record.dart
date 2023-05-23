import 'dart:async';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'coffee_assumption_record.g.dart';

abstract class CoffeeAssumptionRecord
    implements Built<CoffeeAssumptionRecord, CoffeeAssumptionRecordBuilder> {
  static Serializer<CoffeeAssumptionRecord> get serializer =>
      _$coffeeAssumptionRecordSerializer;

  DateTime? get date;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  DocumentReference get parentReference => reference.parent.parent!;

  static void _initializeBuilder(CoffeeAssumptionRecordBuilder builder) =>
      builder;

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('coffee_assumption')
          : FirebaseFirestore.instance.collectionGroup('coffee_assumption');

  static DocumentReference createDoc(DocumentReference parent) =>
      parent.collection('coffee_assumption').doc();

  static Stream<CoffeeAssumptionRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map(
          (s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<CoffeeAssumptionRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then(
          (s) => serializers.deserializeWith(serializer, serializedData(s))!);

  CoffeeAssumptionRecord._();
  factory CoffeeAssumptionRecord(
          [void Function(CoffeeAssumptionRecordBuilder) updates]) =
      _$CoffeeAssumptionRecord;

  static CoffeeAssumptionRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createCoffeeAssumptionRecordData({
  DateTime? date,
}) {
  final firestoreData = serializers.toFirestore(
    CoffeeAssumptionRecord.serializer,
    CoffeeAssumptionRecord(
      (c) => c..date = date,
    ),
  );

  return firestoreData;
}
