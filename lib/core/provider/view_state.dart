/// 页面状态类型
enum ViewState {
  idle, // 正常状态
  busy, // 加载中
  empty, // 无数据
  error, // 加载失败
}

/// 错误类型
enum ViewStateErrorType {
  defaultError,
  networkTimeOutError, // 网络错误
  unauthorizedError // 未授权
}

class ViewStateError {
  late ViewStateErrorType _errorType;
  ViewStateErrorType get errorType => _errorType;

  late String message;
  String? errorMessage;

  ViewStateError(ViewStateErrorType errorType, {String? message, this.errorMessage}) {
    _errorType = errorType;
    message ??= errorMessage;
  }

  /// 以下变量是为了代码书写方便,加入的get方法.严格意义上讲,并不严谨
  get isDefaultError => _errorType == ViewStateErrorType.defaultError;
  get isNetworkTimeOut => _errorType == ViewStateErrorType.networkTimeOutError;
  get isUnauthorized => _errorType == ViewStateErrorType.unauthorizedError;

  @override
  String toString() {
    return 'ViewStateError{errorType: $_errorType, message: $message, errorMessage: $errorMessage}';
  }
}
