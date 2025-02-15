import 'package:chopper/chopper.dart';

part 'marketplace_service.chopper.dart';

@ChopperApi()
abstract class MarketplaceService extends ChopperService {
  @GET(path: '/products')
  Future<Response> getProducts();

  static MarketplaceService create() {
    final client = ChopperClient(
      baseUrl: Uri.parse('https://api.example.com'),
      services: [_$MarketplaceService()],
      converter: JsonConverter(),
    );
    return _$MarketplaceService(client);
  }
}
