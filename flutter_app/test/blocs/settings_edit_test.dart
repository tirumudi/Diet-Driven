/*
 * Copyright (c) 2019. Dennis Krasnov. All rights reserved.
 * Use of this source code is governed by the MIT license that can be found
 * in the LICENSE file.
 */

import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:built_collection/built_collection.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
//import 'package:test/test.dart';

//import 'package:flutter_test/flutter_test.dart';
//import 'package:matcher/matcher.dart';

import 'package:diet_driven/blocs/blocs.dart';
import 'package:diet_driven/models/models.dart';
import 'package:diet_driven/repositories/repositories.dart';

import '../test_utils.dart';

void main() {
  UserDataBloc userDataBloc;

  /// Mocks
  UserRepository userRepository;
  SettingsRepository settingsRepository;
  Completer<void> completer;

  /// Data
  final user = Authentication((b) => b
    ..uid = "1234"
    ..isAnonymous = true
    ..isEmailVerified = false
  );

  final userDocument = UserDocument();

  final Settings settingsFull = Settings((b) => b
    ..navigationSettings = NavigationSettings((b) => b
      ..defaultPage = Page.reports
      ..bottomNavigationPages = ListBuilder(<Page>[
        Page.reports,
        Page.diary,
        Page.logging,
      ])
    ).toBuilder()
    ..themeSettings = ThemeSettings((b) => b
      ..darkMode = false
      ..primaryColour = "dark blue"
    ).toBuilder()
  );

  final expectedState = <UserDataState>[
    UserDataUninitialized(),
    UserDataUnauthenticated(),
    UserDataLoaded((b) => b
      ..authentication = user.toBuilder()
      ..userDocument = UserDocumentBuilder()
      ..settings = settingsFull.toBuilder()
      ..userSettings = SettingsBuilder()
      ..subscription = SubscriptionType.all_access
    ),
    UserDataUnauthenticated(),
  ];

  /// Configuration
  setUp(() {
    BlocSupervisor.delegate = LoggingBlocDelegate();

    userRepository = MockUserRepository();
    settingsRepository = MockSettingsRepository();
    completer = Completer();

    when(userRepository.authStateChanged$()).thenAnswer((_) => Stream.fromFutures(<Future<Authentication>>[
      Future.value(),
      Future.value(user),
      Future.delayed(ticks(3)),
    ]).asBroadcastStream());
    when(userRepository.userDocument$(any)).thenAnswer((_) => Stream.fromFutures([
      Future.value(userDocument),
      Future.delayed(ticks(2), () => userDocument), // Duplicate
    ]));
    when(settingsRepository.defaultSettings$()).thenAnswer((_) => Stream.fromIterable([settingsFull]));
    when(settingsRepository.userSettings$(any)).thenAnswer((_) => Stream.fromIterable([null]));

    userDataBloc = UserDataBloc(
      userRepository: userRepository,
      settingsRepository: settingsRepository,
    );
  });

  tearDown(() {
    userDataBloc?.dispose();
  });

  /// Tests
  group("Update dark mode", () {
    test("Sucessfully update", () async {
      expectLater(
        userDataBloc.state,
        emitsInOrder(expectedState),
      ).then((void _) {
        final settingsBuilder = SettingsBuilder()..themeSettings.update((b) => b
          ..darkMode = true
        );

        verify(settingsRepository.saveSettings(user.uid, settingsBuilder.build())).called(1);
        expect(completer.isCompleted, true);
      });

      // Wait for bloc to be fully initialized
      userDataBloc.dispatch(InitUserData());
      await Future<void>.delayed(ticks(1));

      userDataBloc.dispatch(UpdateDarkMode((b) => b
        ..darkMode = true
        ..completer = completer
      ));

      // Assume completer.future completes (must be called synchronously)
      completer.future.catchError((Object e) => fail("Shouldn't fail"));
    });

    test("Fail on update error", () async {
      when(settingsRepository.saveSettings(any, any)).thenThrow(eventFailedException);

      expectLater(
        userDataBloc.state,
        emitsInOrder(expectedState),
      ).then((void _) {
        final settingsBuilder = SettingsBuilder()..themeSettings.update((b) => b
          ..darkMode = true
        );

        verify(settingsRepository.saveSettings(user.uid, settingsBuilder.build())).called(1);
        // Ensure completer didn't timeout (must use .isCompleted field)
        expect(completer.isCompleted, true);
      });

      // Wait for bloc to be fully initialized
      userDataBloc.dispatch(InitUserData());
      await Future<void>.delayed(ticks(1));

      userDataBloc.dispatch(UpdateDarkMode((b) => b
        ..darkMode = true
        ..completer = completer
      ));

      completer.future
        // Assume completer.future completes
        .then((_) => fail("Shouldn't complete sucessfully"))
        // Catch expected exception (must be called synchronously)
        .catchError((Object e) => expect(e, eventFailedException));
    });
  });

  group("Update primary colour", () {
    test("Sucessfully update", () async {
      expectLater(
        userDataBloc.state,
        emitsInOrder(expectedState),
      ).then((void _) {
        final settingsBuilder = SettingsBuilder()..themeSettings.update((b) => b
          ..primaryColour = "0xffb76b01"
        );

        verify(settingsRepository.saveSettings(user.uid, settingsBuilder.build())).called(1);
        expect(completer.isCompleted, true);
      });

      // Wait for bloc to be fully initialized
      userDataBloc.dispatch(InitUserData());
      await Future<void>.delayed(ticks(1));

      userDataBloc.dispatch(UpdatePrimaryColour((b) => b
        ..colourValue = 0xffb76b01
        ..completer = completer
      ));

      // Assume completer.future completes (must be called synchronously)
      completer.future.catchError((Object e) => fail("Shouldn't fail"));
    });

    // FIXME: colour doesn't change, but colour picker UI still updates... TODO: recreate colour selection package myself
    test("Fail on update error", () async {
      when(settingsRepository.saveSettings(any, any)).thenThrow(eventFailedException);

      expectLater(
        userDataBloc.state,
        emitsInOrder(expectedState),
      ).then((void _) {
        final settingsBuilder = SettingsBuilder()..themeSettings.update((b) => b
          ..primaryColour = "0xffb76b01"
        );

        verify(settingsRepository.saveSettings(user.uid, settingsBuilder.build())).called(1);
        // Ensure completer didn't timeout (must use .isCompleted field)
        expect(completer.isCompleted, true);
      });

      // Wait for bloc to be fully initialized
      userDataBloc.dispatch(InitUserData());
      await Future<void>.delayed(ticks(1));

      userDataBloc.dispatch(UpdatePrimaryColour((b) => b
        ..colourValue = 0xffb76b01
        ..completer = completer
      ));

      completer.future
        // Assume completer.future completes
        .then((_) => fail("Shouldn't complete sucessfully"))
        // Catch expected exception (must be called synchronously)
        .catchError((Object e) => expect(e, eventFailedException));
    });
  });
}