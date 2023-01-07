class CRUDReturn {
  int success;
  String message;

  CRUDReturn({
    required this.success,
    required this.message,
  });

  factory CRUDReturn.fromJson(Map<String, dynamic> json) {
    return CRUDReturn(
      success: json["success"] as int,
      message: json["message"] as String,
    );
  }
}
