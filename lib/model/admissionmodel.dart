// To parse this JSON data, do
//
//     final admissionmodel = admissionmodelFromJson(jsonString);

import 'dart:convert';

List<Admissionmodel> admissionmodelFromJson(String str) => List<Admissionmodel>.from(json.decode(str).map((x) => Admissionmodel.fromJson(x)));

String admissionmodelToJson(List<Admissionmodel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Admissionmodel {
    int? admissionId;
    String? patientName;
    int? genderId;
    String? genderName;
    String? address;
    dynamic city;
    String? mobileNo;
    DateTime? admissionDate;
    String? doa;
    DateTime? admissionTime;
    String? dot;
    int? patientTypeId;
    String? patientType;
    int? hospitalId;
    String? hospitalName;
    String? roomName;
    int? wardId;
    int? bedId;
    String? bedName;
    int? docNameId;
    int? refDocNameId;
    String? regNo;
    String? age;
    String? ageYear;
    String? ageMonth;
    String? ageDay;
    String? admittedDoctorName;
    dynamic refDoctorName;
    dynamic companyName;
    String? departmentName;
    String? relativeName;
    String? relativeAddress;
    String? relativePhoneNo;
    String? phoneNo;
    String? relationshipName;
    String? ipdNo;
    String? expr1;
    String? expr2;
    String? expr3;
    bool? isMlc;
    String? motherName;
    int? maritalStatusId;
    dynamic maritalStatusName;
    int? addedBy;
    String? loginUserName;
    String? loginUserSurname;
    dynamic admittedDoctor1;
    dynamic admittedDoctor2;
    String? aadharNo;
    dynamic mlcNo;
    dynamic mlcDate;
    dynamic policeStation;
    dynamic authorityName;
    dynamic authorityBuckleNo;

    Admissionmodel({
        this.admissionId,
        this.patientName,
        this.genderId,
        this.genderName,
        this.address,
        this.city,
        this.mobileNo,
        this.admissionDate,
        this.doa,
        this.admissionTime,
        this.dot,
        this.patientTypeId,
        this.patientType,
        this.hospitalId,
        this.hospitalName,
        this.roomName,
        this.wardId,
        this.bedId,
        this.bedName,
        this.docNameId,
        this.refDocNameId,
        this.regNo,
        this.age,
        this.ageYear,
        this.ageMonth,
        this.ageDay,
        this.admittedDoctorName,
        this.refDoctorName,
        this.companyName,
        this.departmentName,
        this.relativeName,
        this.relativeAddress,
        this.relativePhoneNo,
        this.phoneNo,
        this.relationshipName,
        this.ipdNo,
        this.expr1,
        this.expr2,
        this.expr3,
        this.isMlc,
        this.motherName,
        this.maritalStatusId,
        this.maritalStatusName,
        this.addedBy,
        this.loginUserName,
        this.loginUserSurname,
        this.admittedDoctor1,
        this.admittedDoctor2,
        this.aadharNo,
        this.mlcNo,
        this.mlcDate,
        this.policeStation,
        this.authorityName,
        this.authorityBuckleNo,
    });

    factory Admissionmodel.fromJson(Map<String, dynamic> json) => Admissionmodel(
        admissionId: json["AdmissionID"],
        patientName: json["PatientName"],
        genderId: json["GenderId"],
        genderName: json["GenderName"],
        address: json["Address"],
        city: json["City"],
        mobileNo: json["MobileNo"],
        admissionDate: json["AdmissionDate"] == null ? null : DateTime.parse(json["AdmissionDate"]),
        doa: json["DOA"],
        admissionTime: json["AdmissionTime"] == null ? null : DateTime.parse(json["AdmissionTime"]),
        dot: json["DOT"],
        patientTypeId: json["PatientTypeID"],
        patientType: json["PatientType"],
        hospitalId: json["HospitalID"],
        hospitalName: json["HospitalName"],
        roomName: json["RoomName"],
        wardId: json["WardId"],
        bedId: json["BedId"],
        bedName: json["BedName"],
        docNameId: json["DocNameID"],
        refDocNameId: json["RefDocNameId"],
        regNo: json["RegNo"],
        age: json["Age"],
        ageYear: json["AgeYear"],
        ageMonth: json["AgeMonth"],
        ageDay: json["AgeDay"],
        admittedDoctorName: json["AdmittedDoctorName"],
        refDoctorName: json["RefDoctorName"],
        companyName: json["CompanyName"],
        departmentName: json["DepartmentName"],
        relativeName: json["RelativeName"],
        relativeAddress: json["RelativeAddress"],
        relativePhoneNo: json["RelativePhoneNo"],
        phoneNo: json["PhoneNo"],
        relationshipName: json["RelationshipName"],
        ipdNo: json["IPDNo"],
        expr1: json["Expr1"],
        expr2: json["Expr2"],
        expr3: json["Expr3"],
        isMlc: json["IsMLC"],
        motherName: json["MotherName"],
        maritalStatusId: json["MaritalStatusId"],
        maritalStatusName: json["MaritalStatusName"],
        addedBy: json["AddedBy"],
        loginUserName: json["LoginUserName"],
        loginUserSurname: json["LoginUserSurname"],
        admittedDoctor1: json["AdmittedDoctor1"],
        admittedDoctor2: json["AdmittedDoctor2"],
        aadharNo: json["AadharNo"],
        mlcNo: json["MLCNo"],
        mlcDate: json["MLCDate"],
        policeStation: json["PoliceStation"],
        authorityName: json["AuthorityName"],
        authorityBuckleNo: json["AuthorityBuckleNo"],
    );

    Map<String, dynamic> toJson() => {
        "AdmissionID": admissionId,
        "PatientName": patientName,
        "GenderId": genderId,
        "GenderName": genderName,
        "Address": address,
        "City": city,
        "MobileNo": mobileNo,
        "AdmissionDate": admissionDate?.toIso8601String(),
        "DOA": doa,
        "AdmissionTime": admissionTime?.toIso8601String(),
        "DOT": dot,
        "PatientTypeID": patientTypeId,
        "PatientType": patientType,
        "HospitalID": hospitalId,
        "HospitalName": hospitalName,
        "RoomName": roomName,
        "WardId": wardId,
        "BedId": bedId,
        "BedName": bedName,
        "DocNameID": docNameId,
        "RefDocNameId": refDocNameId,
        "RegNo": regNo,
        "Age": age,
        "AgeYear": ageYear,
        "AgeMonth": ageMonth,
        "AgeDay": ageDay,
        "AdmittedDoctorName": admittedDoctorName,
        "RefDoctorName": refDoctorName,
        "CompanyName": companyName,
        "DepartmentName": departmentName,
        "RelativeName": relativeName,
        "RelativeAddress": relativeAddress,
        "RelativePhoneNo": relativePhoneNo,
        "PhoneNo": phoneNo,
        "RelationshipName": relationshipName,
        "IPDNo": ipdNo,
        "Expr1": expr1,
        "Expr2": expr2,
        "Expr3": expr3,
        "IsMLC": isMlc,
        "MotherName": motherName,
        "MaritalStatusId": maritalStatusId,
        "MaritalStatusName": maritalStatusName,
        "AddedBy": addedBy,
        "LoginUserName": loginUserName,
        "LoginUserSurname": loginUserSurname,
        "AdmittedDoctor1": admittedDoctor1,
        "AdmittedDoctor2": admittedDoctor2,
        "AadharNo": aadharNo,
        "MLCNo": mlcNo,
        "MLCDate": mlcDate,
        "PoliceStation": policeStation,
        "AuthorityName": authorityName,
        "AuthorityBuckleNo": authorityBuckleNo,
    };
}
