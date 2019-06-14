import 'dart:async';

import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:diet_driven/blocs/bloc_utils.dart';

import 'package:diet_driven/models/models.dart';

part 'food_diary_events.g.dart';

abstract class FoodDiaryEvent {}

/// Reactively updates current [FoodDiaryDay], shows food diary day.
abstract class RemoteDiaryDayArrived with FoodDiaryEvent implements Built<RemoteDiaryDayArrived, RemoteDiaryDayArrivedBuilder> {
  FoodDiaryDay get foodDiaryDay;

  Diet get diet;

  RemoteDiaryDayArrived._();
  factory RemoteDiaryDayArrived([void Function(RemoteDiaryDayArrivedBuilder b)]) = _$RemoteDiaryDayArrived;
}

/// Shows error page.
abstract class FoodDiaryError with FoodDiaryEvent implements Built<FoodDiaryError, FoodDiaryErrorBuilder> {
  String get error;
  String get trace;

  FoodDiaryError._();
  factory FoodDiaryError([void Function(FoodDiaryErrorBuilder b)]) = _$FoodDiaryError;
}

/// Adds [BuiltList] of [FoodRecord]s to [FoodDiaryDay].
abstract class AddFoodRecords with Completable, FoodDiaryEvent implements Built<AddFoodRecords, AddFoodRecordsBuilder> {
  BuiltList<FoodRecord> get foodRecords;

  AddFoodRecords._();
  factory AddFoodRecords([void Function(AddFoodRecordsBuilder b)]) = _$AddFoodRecords;
}

/// Deletes [BuiltList] of [FoodRecord]s from [FoodDiaryDay].
abstract class DeleteFoodRecords with Completable, FoodDiaryEvent implements Built<DeleteFoodRecords, DeleteFoodRecordsBuilder> {
  BuiltList<FoodRecord> get foodRecords;

  DeleteFoodRecords._();
  factory DeleteFoodRecords([void Function(DeleteFoodRecordsBuilder b)]) = _$DeleteFoodRecords;
}

/// Updates [oldRecord] to [newRecord] in [FoodDiaryDay].
/// Replacing a non-existent [oldRecord] has no effect.
/// Adding a duplicate [newRecord] has no effect.
/// Only available when in [FoodDiaryLoaded]. // TODOCUMENT other events in all blocs
abstract class ReplaceFoodRecord with Completable, FoodDiaryEvent implements Built<ReplaceFoodRecord, ReplaceFoodRecordBuilder> {
  FoodRecord get oldRecord;
  FoodRecord get newRecord;

  ReplaceFoodRecord._();
  factory ReplaceFoodRecord([void Function(ReplaceFoodRecordBuilder b)]) = _$ReplaceFoodRecord;
}
