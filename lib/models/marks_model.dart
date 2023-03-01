class MarkModel {
  MarkModel({
    required this.companyName,
    required this.physicalAddress,
    required this.productId,
    required this.productName,
    required this.productBrand,
    this.ksTitle,
    required this.issueDate,
    required this.expiryDate,
    required this.ksNo,
  });

  String companyName;
  String physicalAddress;
  String productId;
  String productName;
  String productBrand;
  dynamic ksTitle;
  DateTime issueDate;
  DateTime expiryDate;
  String ksNo;

  factory MarkModel.fromJson(Map<String, dynamic> json) => MarkModel(
        companyName: json["companyName"],
        physicalAddress: json["physical_address"],
        productId: json["product_id"],
        productName: json["product_name"],
        productBrand: json["product_brand"],
        ksTitle: json["ks_title"],
        issueDate: DateTime.parse(json["issue_date"]),
        expiryDate: DateTime.parse(json["expiry_date"]),
        ksNo: json["ks_NO"],
      );
}
