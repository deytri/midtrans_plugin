import 'dart:async';

import 'package:midtrans_plugin/models/midtrans_config.dart';
import 'package:midtrans_plugin/models/midtrans_payload.dart';
import 'package:midtrans_plugin/models/transaction_result.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'midtrans_plugin_method_channel.dart';

abstract class MidtransPluginPlatform extends PlatformInterface {
  /// Constructs a MidtransPluginPlatform.
  MidtransPluginPlatform() : super(token: _token);

  static final Object _token = Object();

  static MidtransPluginPlatform? _instance;

  /// The default instance of [MidtransPluginPlatform] to use.
  ///
  /// Defaults to [MethodChannelMidtransPlugin].
  static MidtransPluginPlatform get instance {
    if (_instance == null) {
      MethodChannelMidtransPlugin.setMethodCallHandlers();
    }

    return _instance ??= MethodChannelMidtransPlugin.instance;
  }

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [MidtransPluginPlatform] when
  /// they register themselves.
  static set instance(MidtransPluginPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  static final StreamController<TransactionResult> onTransactionResult =
      StreamController<TransactionResult>.broadcast();

  bool get isInitialized {
    throw UnimplementedError('isInitialized has not been implemented.');
  }

  Future<bool?> initialize(MidtransConfig config) {
    throw UnimplementedError('initialize() has not been implemented.');
  }

  Future<void> startPayment(MidtransPayload payload) {
    throw UnimplementedError('startPayment() has not been implemented.');
  }
}
