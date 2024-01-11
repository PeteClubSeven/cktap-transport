import 'package:flutter/services.dart';

/// The base class for exceptions. It's recommended that any exceptions an implementation may throw derive from this
/// class.
abstract class TransportException implements Exception {}

/// The base class for which all NFC communication must be handled by. This allows the cktap_protocol plugin to be
/// decoupled from individual NFC plugins whilst still using a common interface when transmitting data. It's recommended
/// that your implementation derives Transport-related exceptions from [TransportException].
abstract class Transport {
  /// When given CBOR data it uses ISO 7816 methods to transmit to a NFC device before returning the raw response. For
  /// Android: Use IsoDep
  /// iOS: Use Iso7816
  Future<Uint8List> sendBytes(final Uint8List bytes);
}
