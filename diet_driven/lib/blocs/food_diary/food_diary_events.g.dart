// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'food_diary_events.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$RemoteFoodDiaryArrived extends RemoteFoodDiaryArrived {
  @override
  final BuiltList<FoodDiaryDay> diaryDays;
  @override
  final BuiltList<Diet> diets;

  factory _$RemoteFoodDiaryArrived(
          [void Function(RemoteFoodDiaryArrivedBuilder) updates]) =>
      (new RemoteFoodDiaryArrivedBuilder()..update(updates)).build();

  _$RemoteFoodDiaryArrived._({this.diaryDays, this.diets}) : super._() {
    if (diaryDays == null) {
      throw new BuiltValueNullFieldError('RemoteFoodDiaryArrived', 'diaryDays');
    }
    if (diets == null) {
      throw new BuiltValueNullFieldError('RemoteFoodDiaryArrived', 'diets');
    }
  }

  @override
  RemoteFoodDiaryArrived rebuild(
          void Function(RemoteFoodDiaryArrivedBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  RemoteFoodDiaryArrivedBuilder toBuilder() =>
      new RemoteFoodDiaryArrivedBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is RemoteFoodDiaryArrived &&
        diaryDays == other.diaryDays &&
        diets == other.diets;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, diaryDays.hashCode), diets.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('RemoteFoodDiaryArrived')
          ..add('diaryDays', diaryDays)
          ..add('diets', diets))
        .toString();
  }
}

class RemoteFoodDiaryArrivedBuilder
    implements Builder<RemoteFoodDiaryArrived, RemoteFoodDiaryArrivedBuilder> {
  _$RemoteFoodDiaryArrived _$v;

  ListBuilder<FoodDiaryDay> _diaryDays;
  ListBuilder<FoodDiaryDay> get diaryDays =>
      _$this._diaryDays ??= new ListBuilder<FoodDiaryDay>();
  set diaryDays(ListBuilder<FoodDiaryDay> diaryDays) =>
      _$this._diaryDays = diaryDays;

  ListBuilder<Diet> _diets;
  ListBuilder<Diet> get diets => _$this._diets ??= new ListBuilder<Diet>();
  set diets(ListBuilder<Diet> diets) => _$this._diets = diets;

  RemoteFoodDiaryArrivedBuilder();

  RemoteFoodDiaryArrivedBuilder get _$this {
    if (_$v != null) {
      _diaryDays = _$v.diaryDays?.toBuilder();
      _diets = _$v.diets?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(RemoteFoodDiaryArrived other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$RemoteFoodDiaryArrived;
  }

  @override
  void update(void Function(RemoteFoodDiaryArrivedBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$RemoteFoodDiaryArrived build() {
    _$RemoteFoodDiaryArrived _$result;
    try {
      _$result = _$v ??
          new _$RemoteFoodDiaryArrived._(
              diaryDays: diaryDays.build(), diets: diets.build());
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'diaryDays';
        diaryDays.build();
        _$failedField = 'diets';
        diets.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'RemoteFoodDiaryArrived', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$FoodDiaryError extends FoodDiaryError {
  @override
  final Object error;
  @override
  final StackTrace trace;

  factory _$FoodDiaryError([void Function(FoodDiaryErrorBuilder) updates]) =>
      (new FoodDiaryErrorBuilder()..update(updates)).build();

  _$FoodDiaryError._({this.error, this.trace}) : super._() {
    if (error == null) {
      throw new BuiltValueNullFieldError('FoodDiaryError', 'error');
    }
    if (trace == null) {
      throw new BuiltValueNullFieldError('FoodDiaryError', 'trace');
    }
  }

  @override
  FoodDiaryError rebuild(void Function(FoodDiaryErrorBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  FoodDiaryErrorBuilder toBuilder() =>
      new FoodDiaryErrorBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is FoodDiaryError &&
        error == other.error &&
        trace == other.trace;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, error.hashCode), trace.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('FoodDiaryError')
          ..add('error', error)
          ..add('trace', trace))
        .toString();
  }
}

class FoodDiaryErrorBuilder
    implements Builder<FoodDiaryError, FoodDiaryErrorBuilder> {
  _$FoodDiaryError _$v;

  Object _error;
  Object get error => _$this._error;
  set error(Object error) => _$this._error = error;

  StackTrace _trace;
  StackTrace get trace => _$this._trace;
  set trace(StackTrace trace) => _$this._trace = trace;

  FoodDiaryErrorBuilder();

  FoodDiaryErrorBuilder get _$this {
    if (_$v != null) {
      _error = _$v.error;
      _trace = _$v.trace;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(FoodDiaryError other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$FoodDiaryError;
  }

  @override
  void update(void Function(FoodDiaryErrorBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$FoodDiaryError build() {
    final _$result = _$v ?? new _$FoodDiaryError._(error: error, trace: trace);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
