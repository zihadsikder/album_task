import '../../services/api_clients.dart';
import '../../services/api_endpoints.dart';
import '../models/network_response.dart';

class AlbumsRepository {
  static Future<NetworkResponse> getAlbums() async {
    final NetworkResponse response =
        await ApiClient().getRequest(ApiEndPoints.albums);
    return response;
  }

  static Future<NetworkResponse> getPhotos() async {
    final NetworkResponse response =
        await ApiClient().getRequest(ApiEndPoints.photos);
    return response;
  }
}
