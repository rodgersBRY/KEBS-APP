class DMark {
  DMark({
    required this.productId,
    required this.productName,
    required this.address,
    required this.issueDate,
    required this.expiryDate,
    required this.status,
  });

  String productName;
  String productId;
  String address;
  String issueDate;
  String expiryDate;
  String status;

  factory DMark.fromJson(Map<String, dynamic> json) => DMark(
        productName: json["product_name"],
        productId: json['product_id'],
        address: json["address"],
        issueDate: json["issue_date"],
        expiryDate: json["expiry_date"],
        status: json["status"],
      );

  Map<String, dynamic> toJson() => {
        "product_name": productName,
        "address": address,
        "issue_date": issueDate,
        "expiry_date": expiryDate,
        "product_id": productId,
        "status": status,
      };
}
