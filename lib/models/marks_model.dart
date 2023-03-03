class MarkModel {
  MarkModel({
    required this.companyName,
    required this.physicalAddress,
    required this.productId,
    required this.productName,
    required this.productBrand,
    required this.ksTitle,
    required this.issueDate,
    required this.expiryDate,
    required this.ksNo,
  });

  String companyName;
  String physicalAddress;
  String productId;
  String productName;
  String productBrand;
  String ksTitle;
  String issueDate;
  String expiryDate;
  String ksNo;

  factory MarkModel.fromJson(Map<String, dynamic> json) => MarkModel(
        companyName: json["companyName"] ?? 'null',
        physicalAddress: json["physical_address"] ?? 'null',
        productId: json["product_id"] ?? 'null',
        productName:
            json["product_name"] ?? "null",
        productBrand: json["product_brand"] ?? "null",
        ksTitle: json["ks_title"] ?? "null",
        issueDate: json["issue_date"] ?? "null",
        expiryDate: json["expiry_date"] ?? "null",
        ksNo: json["ks_NO"] ?? "null",
      );
}
