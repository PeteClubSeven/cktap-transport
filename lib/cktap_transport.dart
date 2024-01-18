import 'package:flutter/services.dart';

/// The base class for exceptions. It's recommended that any exceptions thrown by an implementation derive from this.
abstract class TransportException implements Exception {}

/// The base class for which all NFC communication are performed with. This allows the cktap_protocol plugin to be
/// decoupled from individual NFC plugins whilst still using a common interface for transmitting data. It's recommended
/// that your implementation derives Transport-related exceptions from [TransportException].
abstract class Transport {
  /// Should send the raw ISO 7816 APDU to an NFC device before returning the raw response.
  /// Android: Use IsoDep
  /// iOS: Use Iso7816
  Future<Uint8List> sendBytes(final Uint8List bytes);
}
