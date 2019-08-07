import 'package:built_value/built_value.dart';
import 'package:connectivity/connectivity.dart' show ConnectivityResult;
import 'package:diet_driven/blocs/bloc_utils.dart';
import 'package:package_info/package_info.dart' show PackageInfo;

import 'package:diet_driven/models/models.dart';

part 'configuration_state.g.dart';

abstract class ConfigurationState {}

/// Splash page blocks rest of application.
abstract class ConfigurationUninitialized implements ConfigurationState, Built<ConfigurationUninitialized, ConfigurationUninitializedBuilder> {
  factory ConfigurationUninitialized([void Function(ConfigurationUninitializedBuilder b)]) = _$ConfigurationUninitialized;
  ConfigurationUninitialized._();

  @override String toString() => runtimeType.toString();
}

/// Global error page.
abstract class ConfigurationFailed implements BuiltError, ConfigurationState, Built<ConfigurationFailed, ConfigurationFailedBuilder> {
  factory ConfigurationFailed([void Function(ConfigurationFailedBuilder b)]) = _$ConfigurationFailed;
  ConfigurationFailed._();
}

/// Application.
abstract class ConfigurationLoaded implements ConfigurationState, Built<ConfigurationLoaded, ConfigurationLoadedBuilder> {
  /// Firebase remote config data.
  RemoteConfiguration get remoteConfiguration;

  /// App information.
  PackageInfo get packageInfo;

  /// Internet connection status.
  ConnectivityResult get connectivity;

  factory ConfigurationLoaded([void Function(ConfigurationLoadedBuilder b)]) = _$ConfigurationLoaded;
  ConfigurationLoaded._();
}