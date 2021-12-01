import 'package:injectable/injectable.dart';
import 'package:store_nxt/core/basics/typedefs/argument_callback.dart';
import 'package:store_nxt/core/data/resources/api/response/api_response.dart';

@injectable
class ApiInterceptor {
  List<ArgumentCallback<ApiResponse>> _errorListeners = [];
  List<ArgumentCallback<dynamic>> _successListeners = [];

  Future<void> handleErrorResponse(ApiResponse response) async {
    return this._dispatchError(response);
  }

  Future<void> handleSuccessResponse(ApiResponse response) async {
    return this._dispatchSuccess(response);
  }

  Future<void> _dispatchError(ApiResponse errorResponse) async {
    this._errorListeners.forEach((callback) {
      callback(errorResponse);
    });
  }

  Future<void> _dispatchSuccess(ApiResponse successResponse) async {
    this._successListeners.forEach((callback) {
      callback(successResponse);
    });
  }

  /// Add listener to error response from request
  int addErrorListener(ArgumentCallback<ApiResponse> callback) {
    this._errorListeners.add(callback);
    return this._errorListeners.length - 1;
  }

  void removeErrorListener(int index) {
    this._errorListeners.removeAt(index);
  }

  /// Add listener to success response from request
  int addSuccessListener(ArgumentCallback<ApiResponse> callback) {
    this._successListeners.add(callback);
    return this._successListeners.length - 1;
  }

  void removeSuccessListener(int index) {
    this._successListeners.removeAt(index);
  }
}