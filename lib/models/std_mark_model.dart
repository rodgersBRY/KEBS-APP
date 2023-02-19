class StdMark {
  StdMark({
    required this.title,
    required this.companyName,
    this.ksNo,
    required this.prodBrand,
    required this.address,
    required this.issueDate,
    required this.expiryDate,
    required this.status,
    required this.permitNo,
  });

  String title;
  String companyName;
  int? ksNo;
  String prodBrand;
  String address;
  String issueDate;
  String expiryDate;
  String status;
  String permitNo;

  factory StdMark.fromJson(Map<String, dynamic> json) => StdMark(
        title: json["title"],
        companyName: json["company_name"],
        ksNo: json["ks_no"],
        prodBrand: json["prod_brand"],
        address: json["address"],
        issueDate: json["issue_date"],
        expiryDate: json["expiry_date"],
        status: json["status"],
        permitNo: json["permit_no"],
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "company_name": companyName,
        "ks_no": ksNo,
        "prod_brand": prodBrand,
        "address": address,
        "issue_date": issueDate,
        "expiry_date": expiryDate,
        "status": status,
        "permit_no": permitNo,
      };
}
