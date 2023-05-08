// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'water_assumption_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<WaterAssumptionRecord> _$waterAssumptionRecordSerializer =
    new _$WaterAssumptionRecordSerializer();

class _$WaterAssumptionRecordSerializer
    implements StructuredSerializer<WaterAssumptionRecord> {
  @override
  final Iterable<Type> types = const [
    WaterAssumptionRecord,
    _$WaterAssumptionRecord
  ];
  @override
  final String wireName = 'WaterAssumptionRecord';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, WaterAssumptionRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.datetime;
    if (value != null) {
      result
        ..add('datetime')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(DateTime)));
    }
    value = object.ffRef;
    if (value != null) {
      result
        ..add('Document__Reference__Field')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType.nullable(Object)])));
    }
    return result;
  }

  @override
  WaterAssumptionRecord deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new WaterAssumptionRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'datetime':
          result.datetime = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime?;
          break;
        case 'Document__Reference__Field':
          result.ffRef = serializers.deserialize(value,
              specifiedType: const FullType(DocumentReference, const [
                const FullType.nullable(Object)
              ])) as DocumentReference<Object?>?;
          break;
      }
    }

    return result.build();
  }
}

class _$WaterAssumptionRecord extends WaterAssumptionRecord {
  @override
  final DateTime? datetime;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$WaterAssumptionRecord(
          [void Function(WaterAssumptionRecordBuilder)? updates]) =>
      (new WaterAssumptionRecordBuilder()..update(updates))._build();

  _$WaterAssumptionRecord._({this.datetime, this.ffRef}) : super._();

  @override
  WaterAssumptionRecord rebuild(
          void Function(WaterAssumptionRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  WaterAssumptionRecordBuilder toBuilder() =>
      new WaterAssumptionRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is WaterAssumptionRecord &&
        datetime == other.datetime &&
        ffRef == other.ffRef;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, datetime.hashCode);
    _$hash = $jc(_$hash, ffRef.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'WaterAssumptionRecord')
          ..add('datetime', datetime)
          ..add('ffRef', ffRef))
        .toString();
  }
}

class WaterAssumptionRecordBuilder
    implements Builder<WaterAssumptionRecord, WaterAssumptionRecordBuilder> {
  _$WaterAssumptionRecord? _$v;

  DateTime? _datetime;
  DateTime? get datetime => _$this._datetime;
  set datetime(DateTime? datetime) => _$this._datetime = datetime;

  DocumentReference<Object?>? _ffRef;
  DocumentReference<Object?>? get ffRef => _$this._ffRef;
  set ffRef(DocumentReference<Object?>? ffRef) => _$this._ffRef = ffRef;

  WaterAssumptionRecordBuilder() {
    WaterAssumptionRecord._initializeBuilder(this);
  }

  WaterAssumptionRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _datetime = $v.datetime;
      _ffRef = $v.ffRef;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(WaterAssumptionRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$WaterAssumptionRecord;
  }

  @override
  void update(void Function(WaterAssumptionRecordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  WaterAssumptionRecord build() => _build();

  _$WaterAssumptionRecord _build() {
    final _$result =
        _$v ?? new _$WaterAssumptionRecord._(datetime: datetime, ffRef: ffRef);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
