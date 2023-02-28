class FMark {
  FMark({
    required this.companyName,
    this.physicalAddress,
    this.productId,
    required this.productName,
    required this.productBrand,
    required this.issueDate,
    required this.expiryDate,
    this.ksNo,
  });

  String companyName;
  String? physicalAddress;
  String? productId;
  String productName;
  String productBrand;
  String issueDate;
  String expiryDate;
  String? ksNo;

  factory FMark.fromJson(Map<String, dynamic> json) => FMark(
        companyName: json["companyName"],
        physicalAddress: json["physical_address"],
        productId: json["product_id"] != null ? json["product_id"] : "0000",
        productName: json["product_name"],
        productBrand: json["product_brand"],
        issueDate: json["issue_date"],
        expiryDate: json["expiry_date"],
        ksNo: json["ks_NO"],
      );

  Map<String, dynamic> toJson() => {
        "companyName": companyName,
        "product_id": productId,
        "physical_address": physicalAddress,
        "product_name": productName,
        "product_brand": productBrand,
        "issue_date": issueDate,
        "expiry_date": expiryDate,
        "ks_NO": ksNo,
      };
}
