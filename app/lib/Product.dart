// To parse this JSON data, do
//
//     final product = productFromJson(jsonString);

import 'dart:convert';

List<Product> productFromJson(String str) => List<Product>.from(json.decode(str).map((x) => Product.fromJson(x)));

String productToJson(List<Product> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Product {
    Product({
        this.pid,
        this.catid,
        this.pname,
        this.ts,
        this.sliceable,
        this.vegan,
        this.active,
        this.dowsun,
        this.dowmon,
        this.dowtue,
        this.dowwed,
        this.dowthu,
        this.dowfri,
        this.dowsat,
        this.retailp,
        this.activemobile,
    });

    int pid;
    int catid;
    String pname;
    DateTime ts;
    Active sliceable;
    Active vegan;
    Active active;
    Activemobile dowsun;
    Activemobile dowmon;
    Activemobile dowtue;
    Activemobile dowwed;
    Activemobile dowthu;
    Activemobile dowfri;
    Activemobile dowsat;
    double retailp;
    Activemobile activemobile;

    factory Product.fromJson(Map<String, dynamic> json) => Product(
        pid: json["pid"],
        catid: json["catid"],
        pname: json["pname"],
        ts: json["ts"] == null ? null : DateTime.parse(json["ts"]),
        sliceable: activeValues.map[json["sliceable"]],
        vegan: activeValues.map[json["vegan"]],
        active: activeValues.map[json["active"]],
        dowsun: activemobileValues.map[json["dowsun"]],
        dowmon: activemobileValues.map[json["dowmon"]],
        dowtue: activemobileValues.map[json["dowtue"]],
        dowwed: activemobileValues.map[json["dowwed"]],
        dowthu: activemobileValues.map[json["dowthu"]],
        dowfri: activemobileValues.map[json["dowfri"]],
        dowsat: activemobileValues.map[json["dowsat"]],
        retailp: json["retailp"].toDouble(),
        activemobile: activemobileValues.map[json["activemobile"]],
    );

    Map<String, dynamic> toJson() => {
        "pid": pid,
        "catid": catid,
        "pname": pname,
        "ts": ts == null ? null : ts.toIso8601String(),
        "sliceable": activeValues.reverse[sliceable],
        "vegan": activeValues.reverse[vegan],
        "active": activeValues.reverse[active],
        "dowsun": activemobileValues.reverse[dowsun],
        "dowmon": activemobileValues.reverse[dowmon],
        "dowtue": activemobileValues.reverse[dowtue],
        "dowwed": activemobileValues.reverse[dowwed],
        "dowthu": activemobileValues.reverse[dowthu],
        "dowfri": activemobileValues.reverse[dowfri],
        "dowsat": activemobileValues.reverse[dowsat],
        "retailp": retailp,
        "activemobile": activemobileValues.reverse[activemobile],
    };
}

enum Active { YES, NO }

final activeValues = EnumValues({
    "No": Active.NO,
    "Yes": Active.YES
});

enum Activemobile { Y, N }

final activemobileValues = EnumValues({
    "N": Activemobile.N,
    "Y": Activemobile.Y
});

class EnumValues<T> {
    Map<String, T> map;
    Map<T, String> reverseMap;

    EnumValues(this.map);

    Map<T, String> get reverse {
        if (reverseMap == null) {
            reverseMap = map.map((k, v) => new MapEntry(v, k));
        }
        return reverseMap;
    }
}