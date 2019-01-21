// GENERATED CODE - DO NOT MODIFY BY HAND

part of cycle_page;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$CyclePageVM extends CyclePageVM {
  @override
  final BuiltList<int> widgets;
  @override
  final BuiltList<FS> subscriptions;
  @override
  final BuiltList<FoodRecord> diaryRecords;

  factory _$CyclePageVM([void updates(CyclePageVMBuilder b)]) =>
      (new CyclePageVMBuilder()..update(updates)).build();

  _$CyclePageVM._({this.widgets, this.subscriptions, this.diaryRecords})
      : super._() {
    if (widgets == null) {
      throw new BuiltValueNullFieldError('CyclePageVM', 'widgets');
    }
    if (subscriptions == null) {
      throw new BuiltValueNullFieldError('CyclePageVM', 'subscriptions');
    }
    if (diaryRecords == null) {
      throw new BuiltValueNullFieldError('CyclePageVM', 'diaryRecords');
    }
  }

  @override
  CyclePageVM rebuild(void updates(CyclePageVMBuilder b)) =>
      (toBuilder()..update(updates)).build();

  @override
  CyclePageVMBuilder toBuilder() => new CyclePageVMBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is CyclePageVM &&
        widgets == other.widgets &&
        subscriptions == other.subscriptions &&
        diaryRecords == other.diaryRecords;
  }

  @override
  int get hashCode {
    return $jf($jc($jc($jc(0, widgets.hashCode), subscriptions.hashCode),
        diaryRecords.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('CyclePageVM')
          ..add('widgets', widgets)
          ..add('subscriptions', subscriptions)
          ..add('diaryRecords', diaryRecords))
        .toString();
  }
}

class CyclePageVMBuilder implements Builder<CyclePageVM, CyclePageVMBuilder> {
  _$CyclePageVM _$v;

  ListBuilder<int> _widgets;
  ListBuilder<int> get widgets => _$this._widgets ??= new ListBuilder<int>();
  set widgets(ListBuilder<int> widgets) => _$this._widgets = widgets;

  ListBuilder<FS> _subscriptions;
  ListBuilder<FS> get subscriptions =>
      _$this._subscriptions ??= new ListBuilder<FS>();
  set subscriptions(ListBuilder<FS> subscriptions) =>
      _$this._subscriptions = subscriptions;

  ListBuilder<FoodRecord> _diaryRecords;
  ListBuilder<FoodRecord> get diaryRecords =>
      _$this._diaryRecords ??= new ListBuilder<FoodRecord>();
  set diaryRecords(ListBuilder<FoodRecord> diaryRecords) =>
      _$this._diaryRecords = diaryRecords;

  CyclePageVMBuilder();

  CyclePageVMBuilder get _$this {
    if (_$v != null) {
      _widgets = _$v.widgets?.toBuilder();
      _subscriptions = _$v.subscriptions?.toBuilder();
      _diaryRecords = _$v.diaryRecords?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(CyclePageVM other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$CyclePageVM;
  }

  @override
  void update(void updates(CyclePageVMBuilder b)) {
    if (updates != null) updates(this);
  }

  @override
  _$CyclePageVM build() {
    _$CyclePageVM _$result;
    try {
      _$result = _$v ??
          new _$CyclePageVM._(
              widgets: widgets.build(),
              subscriptions: subscriptions.build(),
              diaryRecords: diaryRecords.build());
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'widgets';
        widgets.build();
        _$failedField = 'subscriptions';
        subscriptions.build();
        _$failedField = 'diaryRecords';
        diaryRecords.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'CyclePageVM', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
