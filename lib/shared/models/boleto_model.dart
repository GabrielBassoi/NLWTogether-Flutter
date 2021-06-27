import 'dart:convert';

class BoletoModel {
  final String? name;
  final String? dueDate;
  final double? value;
  final String? barcode;
  bool? paid;
  BoletoModel({
    this.name,
    this.dueDate,
    this.value,
    this.barcode,
    this.paid = false,
  });
  

  BoletoModel copyWith({
    String? name,
    String? dueDate,
    double? value,
    String? barcode,
    bool? paid,
  }) {
    return BoletoModel(
      name: name ?? this.name,
      dueDate: dueDate ?? this.dueDate,
      value: value ?? this.value,
      barcode: barcode ?? this.barcode,
      paid: paid ?? this.paid,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'dueDate': dueDate,
      'value': value,
      'barcode': barcode,
      'paid': paid,
    };
  }

  factory BoletoModel.fromMap(Map<String, dynamic> map) {
    return BoletoModel(
      name: map['name'],
      dueDate: map['dueDate'],
      value: map['value'],
      barcode: map['barcode'],
      paid: map['paid'],
    );
  }

  String toJson() => json.encode(toMap());

  factory BoletoModel.fromJson(String source) => BoletoModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'BoletoModel(name: $name, dueDate: $dueDate, value: $value, barcode: $barcode, paid: $paid)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is BoletoModel &&
      other.name == name &&
      other.dueDate == dueDate &&
      other.value == value &&
      other.barcode == barcode &&
      other.paid == paid;
  }

  @override
  int get hashCode {
    return name.hashCode ^
      dueDate.hashCode ^
      value.hashCode ^
      barcode.hashCode ^
      paid.hashCode;
  }
}
