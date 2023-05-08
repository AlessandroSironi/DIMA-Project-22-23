// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'coffee_assumption_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<CoffeeAssumptionRecord> _$coffeeAssumptionRecordSerializer =
    new _$CoffeeAssumptionRecordSerializer();

class _$CoffeeAssumptionRecordSerializer
    implements StructuredSerializer<CoffeeAssumptionRecord> {
  @override
  final Iterable<Type> types = const [
    CoffeeAssumptionRecord,
    _$CoffeeAssumptionRecord
  ];
  @override
  final String wireName = 'CoffeeAssumptionRecord';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, CoffeeAssumptionRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.date;
    if (value != null) {
      result
        ..add('date')
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
  CoffeeAssumptionRecord deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new CoffeeAssumptionRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'date':
          result.date = serializers.deserialize(value,
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

class _$CoffeeAssumptionRecord extends CoffeeAssumptionRecord {
  @override
  final DateTime? date;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$CoffeeAssumptionRecord(
          [void Function(CoffeeAssumptionRecordBuilder)? updates]) =>
      (new CoffeeAssumptionRecordBuilder()..update(updates))._build();

  _$CoffeeAssumptionRecord._({this.date, this.ffRef}) : super._();

  @override
  CoffeeAssumptionRecord rebuild(
          void Function(CoffeeAssumptionRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  CoffeeAssumptionRecordBuilder toBuilder() =>
      new CoffeeAssumptionRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is CoffeeAssumptionRecord &&
        date == other.date &&
        ffRef == other.ffRef;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, date.hashCode);
    _$hash = $jc(_$hash, ffRef.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'CoffeeAssumptionRecord')
          ..add('date', date)
          ..add('ffRef', ffRef))
        .toString();
  }
}

class CoffeeAssumptionRecordBuilder
    implements Builder<CoffeeAssumptionRecord, CoffeeAssumptionRecordBuilder> {
  _$CoffeeAssumptionRecord? _$v;

  DateTime? _date;
  DateTime? get date => _$this._date;
  set date(DateTime? date) => _$this._date = date;

  DocumentReference<Object?>? _ffRef;
  DocumentReference<Object?>? get ffRef => _$this._ffRef;
  set ffRef(DocumentReference<Object?>? ffRef) => _$this._ffRef = ffRef;

  CoffeeAssumptionRecordBuilder() {
    CoffeeAssumptionRecord._initializeBuilder(this);
  }

  CoffeeAssumptionRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _date = $v.date;
      _ffRef = $v.ffRef;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(CoffeeAssumptionRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$CoffeeAssumptionRecord;
  }

  @override
  void update(void Function(CoffeeAssumptionRecordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  CoffeeAssumptionRecord build() => _build();

  _$CoffeeAssumptionRecord _build() {
    final _$result =
        _$v ?? new _$CoffeeAssumptionRecord._(date: date, ffRef: ffRef);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
