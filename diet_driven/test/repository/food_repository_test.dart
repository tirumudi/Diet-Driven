/*
 * Copyright (c) 2019. Dennis Krasnov. All rights reserved.
 * Use of this source code is governed by the MIT license that can be found
 * in the LICENSE file.
 */

import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:built_collection/built_collection.dart';
import 'package:cloud_functions/cloud_functions.dart';
import 'package:diet_driven/blocs/bloc_utils.dart';
import 'package:diet_driven/providers/providers.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import 'package:diet_driven/blocs/blocs.dart';
import 'package:diet_driven/models/models.dart';
import 'package:diet_driven/repositories/repositories.dart';

import '../test_utils.dart';

void main() {
  FoodRepository foodRepository;

  /// Mocks
  CloudFunctions cloudFunctions;

  /// Data
  final expectedSearchResult = SearchResult((b) => b
    ..foods = ListBuilder(<FoodRecord>[
      FoodRecord.random(),
      FoodRecord.random(),
      FoodRecord.random(),
    ])
    ..pagination = 2
  );

  /// Configuration
  setUp(() {
    BlocSupervisor.delegate = LoggingBlocDelegate();

    cloudFunctions = MockCloudFunctions();

    foodRepository = FoodRepository(cloudFunctions: cloudFunctions);
  });

//  void _mockCloudFunction(dynamic data) {
//    final result = MockHttpsCallableResult();
//    when<dynamic>(result.data).thenReturn(data);
//
//    final callable = MockHttpCallable();
//    when(callable.call(any)).thenAnswer((_) => Future.value(result));
//
//    when(cloudFunctions.getHttpsCallable(functionName: anyNamed("functionName"))).thenReturn(callable);
//  }

  // FIXME: _mockCloudFunction(jsonSerializers.serialize(expectedSearchResult)); doesn't allow       verify(callable(<String, dynamic>{"query": "apple"})).called(1);

  /// Tests
  group("Search foods", () {
    test("Succesfully search", () async {
      final result = MockHttpsCallableResult();
      when<dynamic>(result.data).thenReturn(jsonSerializers.serialize(expectedSearchResult));

      final callable = MockHttpCallable();
      when(callable.call(any)).thenAnswer((_) => Future.value(result));

      when(cloudFunctions.getHttpsCallable(functionName: anyNamed("functionName"))).thenReturn(callable);

      final searchResult = await foodRepository.searchFoodsByQuery("apple"); // TODO: specify page

      verify(callable(<String, dynamic>{"query": "apple"})).called(1);
      verify(cloudFunctions.getHttpsCallable(functionName: "searchFoodsByQuery")).called(1);
      expect(searchResult, expectedSearchResult);
    });

    test("Fail on search error", () {
      when(cloudFunctions.getHttpsCallable(functionName: anyNamed("functionName"))).thenThrow(eventFailedException);

      expect(foodRepository.searchFoodsByQuery("apple"), throwsException); // TODO: specify page
    });
  });

  group("Fetch autocomplete suggestions", () {
    test("Succesfully suggest", () {

    });

    test("Fail on suggest error", () {

    });
  });
}
