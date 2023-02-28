class SMark {
  SMark({
    required this.companyName,
    required this.productName,
    required this.productBrand,
    required this.issueDate,
    required this.expiryDate,
    this.ksTitle,
    this.physicalAddress,
    this.productId,
    this.ksNo,
  });

  String companyName;
  String? physicalAddress;
  String? productId;
  String productName;
  String? productBrand;
  String? ksTitle;
  String issueDate;
  String expiryDate;
  String? ksNo;

  factory SMark.fromJson(Map<String, dynamic> json) => SMark(
        companyName: json["companyName"],
        physicalAddress: json["physical_address"],
        productId: json["product_id"],
        productName:
            json["product_name"] != null ? json["product_name"] : "null",
        productBrand: json["product_brand"],
        ksTitle: json["ks_title"],
        issueDate: json["issue_date"],
        expiryDate: json["expiry_date"],
        ksNo: json["ks_NO"] != null ? json['Ks_NO'] : "null",
      );

  Map<String, dynamic> toJson() => {
        "companyName": companyName,
        "physical_address": physicalAddress,
        "product_id": productId,
        "product_name": productName,
        "product_brand": productBrand,
        "ks_title": ksTitle,
        "issue_date": issueDate,
        "expiry_date": expiryDate,
        "ks_NO": ksNo,
      };
}
