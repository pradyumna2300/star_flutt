// To parse this JSON data, do
//
//     final dischargesum = dischargesumFromJson(jsonString);

import 'dart:convert';

List<Dischargesum> dischargesumFromJson(String str) => List<Dischargesum>.from(json.decode(str).map((x) => Dischargesum.fromJson(x)));

String dischargesumToJson(List<Dischargesum> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Dischargesum {
  
    String? patientName;
    String? diagnosis;
    String? investigation;
    String? clinicalFinding;
    String? opertiveNotes;
    String? treatmentGiven;
    String? treatmentAdvisedAfterDischarge;
    dynamic dischargeDate;
    dynamic dischargeTime;
    DateTime? admissionDate;
    DateTime? admissionTime;
    int? regId;
    String? age;
    String? address;
    DateTime? followupdate;
    dynamic admDisDate;
    dynamic admDisTime;
    DateTime? opDate;
    DateTime? opTime;
    DateTime? dischargeSummaryDate;
    String? surgeonNAme;
    String? anaDocName;
    String? paediatricionDocNAme;
    dynamic birthTime;
    bool? isBirthTimechk;
    String? ipdNo;
    String? genderName;
    String? dischargeTypeName;
    int? dischargeTypeId;
    String? departmentName;
    String? viewDoctorName;
    String? viewDoctorNameEdu;
    String? history;
    int? dischargeDoctor1;
    String? discDoctor1;
    int? dischargeDoctor2;
    String? discDoctor2;
    int? dischargeDoctor3;
    String? discDoctor3;
    DateTime? dischargeSummaryTime;
    String? doctorAssistantName;
    String? doctorEdc2;
    String? regNo;
    String? doctorEdc3;
    String? doctorEdc1;
    String? address1;
    String? mobileNo;
    String? conditionOnDischarge;
    String? doctorNotes;
    bool? isMlc;
    String? doceducation1;
    String? doceducation2;
    String? doceducation3;
    dynamic dischargedDocId;
    int? docNameId;
    int? dischargeSummaryId1;

    Dischargesum({
      
        this.patientName,
        this.diagnosis,
        this.investigation,
        this.clinicalFinding,
        this.opertiveNotes,
        this.treatmentGiven,
        this.treatmentAdvisedAfterDischarge,
        this.dischargeDate,
        this.dischargeTime,
        this.admissionDate,
        this.admissionTime,
        this.regId,
        this.age,
        this.address,
        this.followupdate,
        this.admDisDate,
        this.admDisTime,
        this.opDate,
        this.opTime,
        this.dischargeSummaryDate,
        this.surgeonNAme,
        this.anaDocName,
        this.paediatricionDocNAme,
        this.birthTime,
        this.isBirthTimechk,
        this.ipdNo,
        this.genderName,
        this.dischargeTypeName,
        this.dischargeTypeId,
        this.departmentName,
        this.viewDoctorName,
        this.viewDoctorNameEdu,
        this.history,
        this.dischargeDoctor1,
        this.discDoctor1,
        this.dischargeDoctor2,
        this.discDoctor2,
        this.dischargeDoctor3,
        this.discDoctor3,
        this.dischargeSummaryTime,
        this.doctorAssistantName,
        this.doctorEdc2,
        this.regNo,
        this.doctorEdc3,
        this.doctorEdc1,
        this.address1,
        this.mobileNo,
        this.conditionOnDischarge,
        this.doctorNotes,
        this.isMlc,
        this.doceducation1,
        this.doceducation2,
        this.doceducation3,
        this.dischargedDocId,
        this.docNameId,
        this.dischargeSummaryId1,
    });

    factory Dischargesum.fromJson(Map<String, dynamic> json) => Dischargesum(
      
        patientName: json["PatientName"],
        diagnosis: json["Diagnosis"],
        investigation: json["Investigation"],
        clinicalFinding: json["ClinicalFinding"],
        opertiveNotes: json["OpertiveNotes"],
        treatmentGiven: json["TreatmentGiven"],
        treatmentAdvisedAfterDischarge: json["TreatmentAdvisedAfterDischarge"],
        dischargeDate: json["DischargeDate"],
        dischargeTime: json["DischargeTime"],
        admissionDate: json["AdmissionDate"] == null ? null : DateTime.parse(json["AdmissionDate"]),
        admissionTime: json["AdmissionTime"] == null ? null : DateTime.parse(json["AdmissionTime"]),
        regId: json["RegId"],
        age: json["Age"],
        address: json["Address"],
        followupdate: json["Followupdate"] == null ? null : DateTime.parse(json["Followupdate"]),
        admDisDate: json["AdmDisDate"],
        admDisTime: json["AdmDisTime"],
        opDate: json["OpDate"] == null ? null : DateTime.parse(json["OpDate"]),
        opTime: json["OPTime"] == null ? null : DateTime.parse(json["OPTime"]),
        dischargeSummaryDate: json["DischargeSummaryDate"] == null ? null : DateTime.parse(json["DischargeSummaryDate"]),
        surgeonNAme: json["SurgeonNAme"],
        anaDocName: json["AnaDocName"],
        paediatricionDocNAme: json["PaediatricionDocNAme"],
        birthTime: json["BirthTime"],
        isBirthTimechk: json["IsBirthTimechk"],
        ipdNo: json["IPDNo"],
        genderName: json["GenderName"],
        dischargeTypeName: json["DischargeTypeName"],
        dischargeTypeId: json["DischargeTypeId"],
        departmentName: json["DepartmentName"],
        viewDoctorName: json["view_DoctorName"],
        viewDoctorNameEdu: json["view_DoctorNameEdu"],
        history: json["History"],
        dischargeDoctor1: json["DischargeDoctor1"],
        discDoctor1: json["DiscDoctor1"],
        dischargeDoctor2: json["DischargeDoctor2"],
        discDoctor2: json["DiscDoctor2"],
        dischargeDoctor3: json["DischargeDoctor3"],
        discDoctor3: json["DiscDoctor3"],
        dischargeSummaryTime: json["DischargeSummaryTime"] == null ? null : DateTime.parse(json["DischargeSummaryTime"]),
        doctorAssistantName: json["DoctorAssistantName"],
        doctorEdc2: json["DoctorEdc2"],
        regNo: json["RegNo"],
        doctorEdc3: json["DoctorEdc3"],
        doctorEdc1: json["DoctorEdc1"],
        address1: json["Address1"],
        mobileNo: json["MobileNo"],
        conditionOnDischarge: json["ConditionOnDischarge"],
        doctorNotes: json["DoctorNotes"],
        isMlc: json["IsMLC"],
        doceducation1: json["doceducation1"],
        doceducation2: json["doceducation2"],
        doceducation3: json["doceducation3"],
        dischargedDocId: json["DischargedDocId"],
        docNameId: json["DocNameID"],
        dischargeSummaryId1: json["DischargeSummaryId1"],
    );

    Map<String, dynamic> toJson() => {
      
        "PatientName": patientName,
        "Diagnosis": diagnosis,
        "Investigation": investigation,
        "ClinicalFinding": clinicalFinding,
        "OpertiveNotes": opertiveNotes,
        "TreatmentGiven": treatmentGiven,
        "TreatmentAdvisedAfterDischarge": treatmentAdvisedAfterDischarge,
        "DischargeDate": dischargeDate,
        "DischargeTime": dischargeTime,
        "AdmissionDate": admissionDate?.toIso8601String(),
        "AdmissionTime": admissionTime?.toIso8601String(),
        "RegId": regId,
        "Age": age,
        "Address": address,
        "Followupdate": followupdate?.toIso8601String(),
        "AdmDisDate": admDisDate,
        "AdmDisTime": admDisTime,
        "OpDate": opDate?.toIso8601String(),
        "OPTime": opTime?.toIso8601String(),
        "DischargeSummaryDate": dischargeSummaryDate?.toIso8601String(),
        "SurgeonNAme": surgeonNAme,
        "AnaDocName": anaDocName,
        "PaediatricionDocNAme": paediatricionDocNAme,
        "BirthTime": birthTime,
        "IsBirthTimechk": isBirthTimechk,
        "IPDNo": ipdNo,
        "GenderName": genderName,
        "DischargeTypeName": dischargeTypeName,
        "DischargeTypeId": dischargeTypeId,
        "DepartmentName": departmentName,
        "view_DoctorName": viewDoctorName,
        "view_DoctorNameEdu": viewDoctorNameEdu,
        "History": history,
        "DischargeDoctor1": dischargeDoctor1,
        "DiscDoctor1": discDoctor1,
        "DischargeDoctor2": dischargeDoctor2,
        "DiscDoctor2": discDoctor2,
        "DischargeDoctor3": dischargeDoctor3,
        "DiscDoctor3": discDoctor3,
        "DischargeSummaryTime": dischargeSummaryTime?.toIso8601String(),
        "DoctorAssistantName": doctorAssistantName,
        "DoctorEdc2": doctorEdc2,
        "RegNo": regNo,
        "DoctorEdc3": doctorEdc3,
        "DoctorEdc1": doctorEdc1,
        "Address1": address1,
        "MobileNo": mobileNo,
        "ConditionOnDischarge": conditionOnDischarge,
        "DoctorNotes": doctorNotes,
        "IsMLC": isMlc,
        "doceducation1": doceducation1,
        "doceducation2": doceducation2,
        "doceducation3": doceducation3,
        "DischargedDocId": dischargedDocId,
        "DocNameID": docNameId,
        "DischargeSummaryId1": dischargeSummaryId1,
    };
}
// To parse this JSON data, do
//
//     final course = courseFromJson(jsonString);



List<Course> courseFromJson(String str) => List<Course>.from(json.decode(str).map((x) => Course.fromJson(x)));

String courseToJson(List<Course> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Course {
    int dischargeSummaryId;
    String drugName;
    String doseName;
    int qty;
    String instruction;
    String durationIn;

    Course({
        required this.dischargeSummaryId,
        required this.drugName,
        required this.doseName,
        required this.qty,
        required this.instruction,
        required this.durationIn,
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
