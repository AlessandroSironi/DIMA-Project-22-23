import 'dart:async';
import 'package:macro_tracker/backend/schema/serializers.dart';
import 'package:built_value/built_value.dart';

part 'water_assumption_record.g.dart';

abstract class WaterAssumptionRecord
    implements Built<WaterAssumptionRecord, WaterAssumptionRecordBuilder> {
  static Serializer<WaterAssumptionRecord> get serializer =>
      _$waterAssumptionRecordSerializer;

  DateTime? get datetime;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  DocumentReference get parentReference => reference.parent.parent!;

  static void _initializeBuilder(WaterAssumptionRecordBuilder builder) =>
      builder;

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('water_assumption')
          : FirebaseFirestore.instance.collectionGroup('water_assumption');

  static DocumentReference createDoc(DocumentReference parent) =>
      parent.collection('water_assumption').doc();

  static Stream<WaterAssumptionRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<WaterAssumptionRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then(
          (s) => serializers.deserializeWith(serializer, serializedData(s))!);

  WaterAssumptionRecord._();
  factory WaterAssumptionRecord(
          [void Function(WaterAssumptionRecordBuilder) updates]) =
      _$WaterAssumptionRecord;

  static WaterAssumptionRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createWaterAssumptionRecordData({
  DateTime? datetime,
}) {
  final firestoreData = serializers.toFirestore(
    WaterAssumptionRecord.serializer,
    WaterAssumptionRecord(
      (w) => w..datetime = datetime,
    ),
  );

  return firestoreData;
}
