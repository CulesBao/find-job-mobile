// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'province_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ProvinceDtoImpl _$$ProvinceDtoImplFromJson(Map<String, dynamic> json) =>
    _$ProvinceDtoImpl(
      code: json['code'] as String,
      name: json['name'] as String,
      nameEn: json['name_en'] as String?,
      fullName: json['full_name'] as String,
      fullNameEn: json['full_name_en'] as String?,
    );

Map<String, dynamic> _$$ProvinceDtoImplToJson(_$ProvinceDtoImpl instance) =>
    <String, dynamic>{
      'code': instance.code,
      'name': instance.name,
      'name_en': instance.nameEn,
      'full_name': instance.fullName,
      'full_name_en': instance.fullNameEn,
    };
