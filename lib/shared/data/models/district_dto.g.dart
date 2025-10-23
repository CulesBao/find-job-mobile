// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'district_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$DistrictDtoImpl _$$DistrictDtoImplFromJson(Map<String, dynamic> json) =>
    _$DistrictDtoImpl(
      code: json['code'] as String,
      name: json['name'] as String,
      nameEn: json['name_en'] as String?,
      fullName: json['full_name'] as String?,
      fullNameEn: json['full_name_en'] as String?,
    );

Map<String, dynamic> _$$DistrictDtoImplToJson(_$DistrictDtoImpl instance) =>
    <String, dynamic>{
      'code': instance.code,
      'name': instance.name,
      'name_en': instance.nameEn,
      'full_name': instance.fullName,
      'full_name_en': instance.fullNameEn,
    };
