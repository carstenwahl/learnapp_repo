import 'dart:async';

/// Lightweight NetworkClient interface for the core layer.
///
/// Implement with `dio` or `http` in a platform-aware implementation.
abstract class NetworkClient {
  Future<String> get(String url);
  Future<String> post(String url, {Map<String, dynamic>? body});
}

/// Placeholder HTTP implementation stub. Replace with `dio` or `http`.
class HttpNetworkClient implements NetworkClient {
  @override
  Future<String> get(String url) {
    throw UnimplementedError('Implement HttpNetworkClient.get using dio/http');
  }

  @override
  Future<String> post(String url, {Map<String, dynamic>? body}) {
    throw UnimplementedError('Implement HttpNetworkClient.post using dio/http');
  }
}
