// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'goals_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GoalsRecord> _$goalsRecordSerializer = new _$GoalsRecordSerializer();

class _$GoalsRecordSerializer implements StructuredSerializer<GoalsRecord> {
  @override
  final Iterable<Type> types = const [GoalsRecord, _$GoalsRecord];
  @override
  final String wireName = 'GoalsRecord';

  @override
  Iterable<Object?> serialize(Serializers serializers, GoalsRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.carbsGoal;
    if (value != null) {
      result
        ..add('carbsGoal')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(double)));
    }
    value = object.proteinsGoal;
    if (value != null) {
      result
        ..add('proteinsGoal')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(double)));
    }
    value = object.fatsGoal;
    if (value != null) {
      result
        ..add('fatsGoal')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(double)));
    }
    value = object.kcalGoal;
    if (value != null) {
      result
        ..add('kcalGoal')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(double)));
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
  GoalsRecord deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GoalsRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'carbsGoal':
          result.carbsGoal = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double?;
          break;
        case 'proteinsGoal':
          result.proteinsGoal = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double?;
          break;
        case 'fatsGoal':
          result.fatsGoal = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double?;
          break;
        case 'kcalGoal':
          result.kcalGoal = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double?;
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

class _$GoalsRecord extends GoalsRecord {
  @override
  final double? carbsGoal;
  @override
  final double? proteinsGoal;
  @override
  final double? fatsGoal;
  @override
  final double? kcalGoal;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$GoalsRecord([void Function(GoalsRecordBuilder)? updates]) =>
      (new GoalsRecordBuilder()..update(updates))._build();

  _$GoalsRecord._(
      {this.carbsGoal,
      this.proteinsGoal,
      this.fatsGoal,
      this.kcalGoal,
      this.ffRef})
      : super._();

  @override
  GoalsRecord rebuild(void Function(GoalsRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GoalsRecordBuilder toBuilder() => new GoalsRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GoalsRecord &&
        carbsGoal == other.carbsGoal &&
        proteinsGoal == other.proteinsGoal &&
        fatsGoal == other.fatsGoal &&
        kcalGoal == other.kcalGoal &&
        ffRef == other.ffRef;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, carbsGoal.hashCode);
    _$hash = $jc(_$hash, proteinsGoal.hashCode);
    _$hash = $jc(_$hash, fatsGoal.hashCode);
    _$hash = $jc(_$hash, kcalGoal.hashCode);
    _$hash = $jc(_$hash, ffRef.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GoalsRecord')
          ..add('carbsGoal', carbsGoal)
          ..add('proteinsGoal', proteinsGoal)
          ..add('fatsGoal', fatsGoal)
          ..add('kcalGoal', kcalGoal)
          ..add('ffRef', ffRef))
        .toString();
  }
}

class GoalsRecordBuilder implements Builder<GoalsRecord, GoalsRecordBuilder> {
  _$GoalsRecord? _$v;

  double? _carbsGoal;
  double? get carbsGoal => _$this._carbsGoal;
  set carbsGoal(double? carbsGoal) => _$this._carbsGoal = carbsGoal;

  double? _proteinsGoal;
  double? get proteinsGoal => _$this._proteinsGoal;
  set proteinsGoal(double? proteinsGoal) => _$this._proteinsGoal = proteinsGoal;

  double? _fatsGoal;
  double? get fatsGoal => _$this._fatsGoal;
  set fatsGoal(double? fatsGoal) => _$this._fatsGoal = fatsGoal;

  double? _kcalGoal;
  double? get kcalGoal => _$this._kcalGoal;
  set kcalGoal(double? kcalGoal) => _$this._kcalGoal = kcalGoal;

  DocumentReference<Object?>? _ffRef;
  DocumentReference<Object?>? get ffRef => _$this._ffRef;
  set ffRef(DocumentReference<Object?>? ffRef) => _$this._ffRef = ffRef;

  GoalsRecordBuilder() {
    GoalsRecord._initializeBuilder(this);
  }

  GoalsRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _carbsGoal = $v.carbsGoal;
      _proteinsGoal = $v.proteinsGoal;
      _fatsGoal = $v.fatsGoal;
      _kcalGoal = $v.kcalGoal;
      _ffRef = $v.ffRef;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GoalsRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GoalsRecord;
  }

  @override
  void update(void Function(GoalsRecordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GoalsRecord build() => _build();

  _$GoalsRecord _build() {
    final _$result = _$v ??
        new _$GoalsRecord._(
            carbsGoal: carbsGoal,
            proteinsGoal: proteinsGoal,
            fatsGoal: fatsGoal,
            kcalGoal: kcalGoal,
            ffRef: ffRef);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
