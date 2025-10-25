// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'provinces_data_wrapper.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ProvincesDataWrapperImpl _$$ProvincesDataWrapperImplFromJson(
  Map<String, dynamic> json,
) => _$ProvincesDataWrapperImpl(
  provinces: (json['provinces'] as List<dynamic>)
      .map((e) => ProvinceDto.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$$ProvincesDataWrapperImplToJson(
  _$ProvincesDataWrapperImpl instance,
) => <String, dynamic>{'provinces': instance.provinces};
