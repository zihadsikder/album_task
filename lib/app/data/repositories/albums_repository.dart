import '../../services/api_clients.dart';
import '../../services/api_endpoints.dart';
import '../models/network_response.dart';

class AlbumsRepository {
  static Future<NetworkResponse> getAlbums({int page = 1, int pageSize = 10}) async {
    final NetworkResponse response =
        await ApiClient().getRequest(ApiEndPoints.albums,queryParameters: {
          '_page': page.toString(),
          '_limit': pageSize.toString(),
        },
        );
    return response;
  }

  static Future<NetworkResponse> getPhotos() async {
    final NetworkResponse response =
        await ApiClient().getRequest(ApiEndPoints.photos, queryParameters: {});
    return response;
  }
}
