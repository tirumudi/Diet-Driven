// GENERATED CODE - DO NOT MODIFY BY HAND

part of uncertainty;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

const Uncertainty _$accurate = const Uncertainty._('accurate');
const Uncertainty _$measured = const Uncertainty._('measured');
const Uncertainty _$estimate = const Uncertainty._('estimate');
const Uncertainty _$guess = const Uncertainty._('guess');

Uncertainty _$uncertaintyValueOf(String name) {
  switch (name) {
    case 'accurate':
      return _$accurate;
    case 'measured':
      return _$measured;
    case 'estimate':
      return _$estimate;
    case 'guess':
      return _$guess;
    default:
      throw new ArgumentError(name);
  }
}

final BuiltSet<Uncertainty> _$uncertaintyValues =
    new BuiltSet<Uncertainty>(const <Uncertainty>[
  _$accurate,
  _$measured,
  _$estimate,
  _$guess,
]);

Serializer<Uncertainty> _$uncertaintySerializer = new _$UncertaintySerializer();

class _$UncertaintySerializer implements PrimitiveSerializer<Uncertainty> {
  @override
  final Iterable<Type> types = const <Type>[Uncertainty];
  @override
  final String wireName = 'Uncertainty';

  @override
  Object serialize(Serializers serializers, Uncertainty object,
          {FullType specifiedType = FullType.unspecified}) =>
      object.name;

  @override
  Uncertainty deserialize(Serializers serializers, Object serialized,
          {FullType specifiedType = FullType.unspecified}) =>
      Uncertainty.valueOf(serialized as String);
}

// ignore_for_file: always_put_control_body_on_new_line,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new