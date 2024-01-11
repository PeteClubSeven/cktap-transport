Provides interfaces for NFC operations required by
the [cktap_protocol](https://github.com/PeteClubSeven/cktap-protocol-flutter) plugin. Using a separate package allows
the protocol plugin to be decoupled from specific NFC plugins. It also means the user can provide their own
implementation.

## Features

- `Transport` base class
- `TransportException` base class

## Getting started

Add one of the following dependencies to your `pubspec.yaml`:

```yaml
dependencies:
  # Only when implementing your own transport class
  cktap_transport: ^0.0.1

  # An implementation using the nfc_manager plugin
  cktap_transport_nfc_manager: ^0.0.1
```

## Usage

Here's an example of implementing your own transport function:
```dart
import 'dart:typed_data';

import 'cktap_transport/cktap_transport.dart';

/// Implement the sendBytes function
class MyTransport extends Transport {
  @override
  Future<Uint8List> sendBytes(Uint8List bytes) async {
    try {
      // Send data here and return the response as bytes
    }
    catch (_) {
      throw const MyTransportException();
    }
  }
}

/// Create an exception
class MyTransportException implements TransportException {
  const MyTransportException();

  @override
  String toString() => "blah";
}
```

## Additional information

Concrete implementations exist for the following plugins:

- [nfc_manager](https://github.com/okadan/flutter-nfc-manager) v3.3.0
  - v4.0.0 will bring breaking changes so it will need updating
  - Available here: https://pub.dev/packages/cktap_transport_nfc_manager
