// GENERATED CODE - DO NOT MODIFY BY HAND

part of actions;

// **************************************************************************
// BuiltReduxGenerator
// **************************************************************************

// ignore_for_file: avoid_classes_with_only_static_members
// ignore_for_file: annotate_overrides

class _$Actions extends Actions {
  factory _$Actions() => new _$Actions._();
  _$Actions._() : super._();

  final ActionDispatcher<dynamic> initApp =
      new ActionDispatcher<dynamic>('Actions-initApp');
  final ActionDispatcher<FirebaseUser> anonymousUserLoaded =
      new ActionDispatcher<FirebaseUser>('Actions-anonymousUserLoaded');
  final ActionDispatcher<dynamic> anonymousUserFail =
      new ActionDispatcher<dynamic>('Actions-anonymousUserFail');
  final ActionDispatcher<dynamic> logout =
      new ActionDispatcher<dynamic>('Actions-logout');
  final ActionDispatcher<Page> goTo =
      new ActionDispatcher<Page>('Actions-goTo');
  final ActionDispatcher<List<Page>> reorderBottomNavigation =
      new ActionDispatcher<List<Page>>('Actions-reorderBottomNavigation');
  final ActionDispatcher<Page> setDefaultPage =
      new ActionDispatcher<Page>('Actions-setDefaultPage');
  final ActionDispatcher<String> fbStartDocListen =
      new ActionDispatcher<String>('Actions-fbStartDocListen');
  final ActionDispatcher<String> fbStopDocListen =
      new ActionDispatcher<String>('Actions-fbStopDocListen');
  final ActionDispatcher<dynamic> fbDocListenError =
      new ActionDispatcher<dynamic>('Actions-fbDocListenError');
  final ActionDispatcher<int> startSettingsListen =
      new ActionDispatcher<int>('Actions-startSettingsListen');
  final ActionDispatcher<int> stopSettingsListen =
      new ActionDispatcher<int>('Actions-stopSettingsListen');
  final ActionDispatcher<FS<dynamic>> subscribe =
      new ActionDispatcher<FS<dynamic>>('Actions-subscribe');
  final ActionDispatcher<FS<dynamic>> additionalSubscription =
      new ActionDispatcher<FS<dynamic>>('Actions-additionalSubscription');
  final ActionDispatcher<FSDiary> startDiaryListen =
      new ActionDispatcher<FSDiary>('Actions-startDiaryListen');
  final ActionDispatcher<FSDiary> stopDiaryListen =
      new ActionDispatcher<FSDiary>('Actions-stopDiaryListen');
  final ActionDispatcher<FoodRecord> diaryReceived =
      new ActionDispatcher<FoodRecord>('Actions-diaryReceived');

  @override
  void setDispatcher(Dispatcher dispatcher) {
    initApp.setDispatcher(dispatcher);
    anonymousUserLoaded.setDispatcher(dispatcher);
    anonymousUserFail.setDispatcher(dispatcher);
    logout.setDispatcher(dispatcher);
    goTo.setDispatcher(dispatcher);
    reorderBottomNavigation.setDispatcher(dispatcher);
    setDefaultPage.setDispatcher(dispatcher);
    fbStartDocListen.setDispatcher(dispatcher);
    fbStopDocListen.setDispatcher(dispatcher);
    fbDocListenError.setDispatcher(dispatcher);
    startSettingsListen.setDispatcher(dispatcher);
    stopSettingsListen.setDispatcher(dispatcher);
    subscribe.setDispatcher(dispatcher);
    additionalSubscription.setDispatcher(dispatcher);
    startDiaryListen.setDispatcher(dispatcher);
    stopDiaryListen.setDispatcher(dispatcher);
    diaryReceived.setDispatcher(dispatcher);
  }
}

class ActionsNames {
  static final ActionName<dynamic> initApp =
      new ActionName<dynamic>('Actions-initApp');
  static final ActionName<FirebaseUser> anonymousUserLoaded =
      new ActionName<FirebaseUser>('Actions-anonymousUserLoaded');
  static final ActionName<dynamic> anonymousUserFail =
      new ActionName<dynamic>('Actions-anonymousUserFail');
  static final ActionName<dynamic> logout =
      new ActionName<dynamic>('Actions-logout');
  static final ActionName<Page> goTo = new ActionName<Page>('Actions-goTo');
  static final ActionName<List<Page>> reorderBottomNavigation =
      new ActionName<List<Page>>('Actions-reorderBottomNavigation');
  static final ActionName<Page> setDefaultPage =
      new ActionName<Page>('Actions-setDefaultPage');
  static final ActionName<String> fbStartDocListen =
      new ActionName<String>('Actions-fbStartDocListen');
  static final ActionName<String> fbStopDocListen =
      new ActionName<String>('Actions-fbStopDocListen');
  static final ActionName<dynamic> fbDocListenError =
      new ActionName<dynamic>('Actions-fbDocListenError');
  static final ActionName<int> startSettingsListen =
      new ActionName<int>('Actions-startSettingsListen');
  static final ActionName<int> stopSettingsListen =
      new ActionName<int>('Actions-stopSettingsListen');
  static final ActionName<FS<dynamic>> subscribe =
      new ActionName<FS<dynamic>>('Actions-subscribe');
  static final ActionName<FS<dynamic>> additionalSubscription =
      new ActionName<FS<dynamic>>('Actions-additionalSubscription');
  static final ActionName<FSDiary> startDiaryListen =
      new ActionName<FSDiary>('Actions-startDiaryListen');
  static final ActionName<FSDiary> stopDiaryListen =
      new ActionName<FSDiary>('Actions-stopDiaryListen');
  static final ActionName<FoodRecord> diaryReceived =
      new ActionName<FoodRecord>('Actions-diaryReceived');
}
