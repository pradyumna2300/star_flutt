import 'dart:convert';

List<Course> courseFromJson(String str) => List<Course>.from(json.decode(str).map((x) => Course.fromJson(x)));

String courseToJson(List<Course> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Course {
    int? dischargeSummaryId;
    String? drugName;
    String? doseName;
    int? qty;
    String? instruction;
    String? durationIn;

    Course({
        this.dischargeSummaryId,
        this.drugName,
        this.doseName,
        this.qty,
        this.instruction,
        this.durationIn,
    });

    factory Course.fromJson(Map<String, dynamic> json) => Course(
        dischargeSummaryId: json["DischargeSummaryId"],
        drugName: json["DrugName"],
        doseName: json["DoseName"],
        qty: json["Qty"],
        instruction: json["Instruction"],
        durationIn: json["DurationIn"],
    );

    Map<String, dynamic> toJson() => {
        "DischargeSummaryId": dischargeSummaryId,
        "DrugName": drugName,
        "DoseName": doseName,
        "Qty": qty,
        "Instruction": instruction,
        "DurationIn": durationIn,
    };
}