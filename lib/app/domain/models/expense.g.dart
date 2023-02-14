// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'expense.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Expense _$$_ExpenseFromJson(Map<String, dynamic> json) => _$_Expense(
      price: (json['price'] as num).toDouble(),
      detail: json['detail'] as String,
      category: json['category'] as String?,
      date:
          json['date'] == null ? null : DateTime.parse(json['date'] as String),
      pictureUrl: json['pictureUrl'] as String?,
      picturePath: json['picturePath'] as String?,
      id: json['id'] as String?,
    );

Map<String, dynamic> _$$_ExpenseToJson(_$_Expense instance) =>
    <String, dynamic>{
      'price': instance.price,
      'detail': instance.detail,
      'category': instance.category,
      'date': instance.date?.toIso8601String(),
      'pictureUrl': instance.pictureUrl,
      'picturePath': instance.picturePath,
      'id': instance.id,
    };
