// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'persion.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Persion _$PersionFromJson(Map<String, dynamic> json) {
  return Persion()
    ..name = json['name'] as String
    ..email = json['email'] as String
    ..mother = json['mother'] == null
        ? null
        : Persion.fromJson(json['mother'] as Map<String, dynamic>)
    ..sex = json['sex'] as String
    ..age = json['age'] as num
    ..brother = (json['brother'] as List)
        ?.map((e) =>
            e == null ? null : Persion.fromJson(e as Map<String, dynamic>))
        ?.toList()
    ..friends = (json['friends'] as List)
        ?.map((e) =>
            e == null ? null : Persion.fromJson(e as Map<String, dynamic>))
        ?.toList();
}

Map<String, dynamic> _$PersionToJson(Persion instance) => <String, dynamic>{
      'name': instance.name,
      'email': instance.email,
      'mother': instance.mother,
      'sex': instance.sex,
      'age': instance.age,
      'brother': instance.brother,
      'friends': instance.friends,
    };
