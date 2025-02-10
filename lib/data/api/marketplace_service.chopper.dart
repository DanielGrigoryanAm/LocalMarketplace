// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'marketplace_service.dart';

// **************************************************************************
// ChopperGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
final class _$MarketplaceService extends MarketplaceService {
  _$MarketplaceService([ChopperClient? client]) {
    if (client == null) return;
    this.client = client;
  }

  @override
  final Type definitionType = MarketplaceService;

  @override
  Future<Response<dynamic>> getProducts() {
    final Uri $url = Uri.parse('/products');
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
    );
    return client.send<dynamic, dynamic>($request);
  }
}
