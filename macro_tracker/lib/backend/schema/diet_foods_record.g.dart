// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'diet_foods_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<DietFoodsRecord> _$dietFoodsRecordSerializer =
    new _$DietFoodsRecordSerializer();

class _$DietFoodsRecordSerializer
    implements StructuredSerializer<DietFoodsRecord> {
  @override
  final Iterable<Type> types = const [DietFoodsRecord, _$DietFoodsRecord];
  @override
  final String wireName = 'DietFoodsRecord';

  @override
  Iterable<Object?> serialize(Serializers serializers, DietFoodsRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.kcal;
    if (value != null) {
      result
        ..add('kcal')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(double)));
    }
    value = object.carbs;
    if (value != null) {
      result
        ..add('carbs')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(double)));
    }
    value = object.proteins;
    if (value != null) {
      result
        ..add('proteins')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(double)));
    }
    value = object.fats;
    if (value != null) {
      result
        ..add('fats')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(double)));
    }
    value = object.name;
    if (value != null) {
      result
        ..add('name')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.meal;
    if (value != null) {
      result
        ..add('meal')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
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
  DietFoodsRecord deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new DietFoodsRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'kcal':
          result.kcal = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double?;
          break;
        case 'carbs':
          result.carbs = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double?;
          break;
        case 'proteins':
          result.proteins = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double?;
          break;
        case 'fats':
          result.fats = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double?;
          break;
        case 'name':
          result.name = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'meal':
          result.meal = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
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

class _$DietFoodsRecord extends DietFoodsRecord {
  @override
  final double? kcal;
  @override
  final double? carbs;
  @override
  final double? proteins;
  @override
  final double? fats;
  @override
  final String? name;
  @override
  final String? meal;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$DietFoodsRecord([void Function(DietFoodsRecordBuilder)? updates]) =>
      (new DietFoodsRecordBuilder()..update(updates))._build();

  _$DietFoodsRecord._(
      {this.kcal,
      this.carbs,
      this.proteins,
      this.fats,
      this.name,
      this.meal,
      this.ffRef})
      : super._();

  @override
  DietFoodsRecord rebuild(void Function(DietFoodsRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  DietFoodsRecordBuilder toBuilder() =>
      new DietFoodsRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is DietFoodsRecord &&
        kcal == other.kcal &&
        carbs == other.carbs &&
        proteins == other.proteins &&
        fats == other.fats &&
        name == other.name &&
        meal == other.meal &&
        ffRef == other.ffRef;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, kcal.hashCode);
    _$hash = $jc(_$hash, carbs.hashCode);
    _$hash = $jc(_$hash, proteins.hashCode);
    _$hash = $jc(_$hash, fats.hashCode);
    _$hash = $jc(_$hash, name.hashCode);
    _$hash = $jc(_$hash, meal.hashCode);
    _$hash = $jc(_$hash, ffRef.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'DietFoodsRecord')
          ..add('kcal', kcal)
          ..add('carbs', carbs)
          ..add('proteins', proteins)
          ..add('fats', fats)
          ..add('name', name)
          ..add('meal', meal)
          ..add('ffRef', ffRef))
        .toString();
  }
}

class DietFoodsRecordBuilder
    implements Builder<DietFoodsRecord, DietFoodsRecordBuilder> {
  _$DietFoodsRecord? _$v;

  double? _kcal;
  double? get kcal => _$this._kcal;
  set kcal(double? kcal) => _$this._kcal = kcal;

  double? _carbs;
  double? get carbs => _$this._carbs;
  set carbs(double? carbs) => _$this._carbs = carbs;

  double? _proteins;
  double? get proteins => _$this._proteins;
  set proteins(double? proteins) => _$this._proteins = proteins;

  double? _fats;
  double? get fats => _$this._fats;
  set fats(double? fats) => _$this._fats = fats;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  String? _meal;
  String? get meal => _$this._meal;
  set meal(String? meal) => _$this._meal = meal;

  DocumentReference<Object?>? _ffRef;
  DocumentReference<Object?>? get ffRef => _$this._ffRef;
  set ffRef(DocumentReference<Object?>? ffRef) => _$this._ffRef = ffRef;

  DietFoodsRecordBuilder() {
    DietFoodsRecord._initializeBuilder(this);
  }

  DietFoodsRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _kcal = $v.kcal;
      _carbs = $v.carbs;
      _proteins = $v.proteins;
      _fats = $v.fats;
      _name = $v.name;
      _meal = $v.meal;
      _ffRef = $v.ffRef;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(DietFoodsRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$DietFoodsRecord;
  }

  @override
  void update(void Function(DietFoodsRecordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  DietFoodsRecord build() => _build();

  _$DietFoodsRecord _build() {
    final _$result = _$v ??
        new _$DietFoodsRecord._(
            kcal: kcal,
            carbs: carbs,
            proteins: proteins,
            fats: fats,
            name: name,
            meal: meal,
            ffRef: ffRef);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
