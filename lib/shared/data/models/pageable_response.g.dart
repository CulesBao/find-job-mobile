// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pageable_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PageableResponseImpl<T> _$$PageableResponseImplFromJson<T>(
  Map<String, dynamic> json,
  T Function(Object? json) fromJsonT,
) => _$PageableResponseImpl<T>(
  content: (json['content'] as List<dynamic>).map(fromJsonT).toList(),
  page: (json['number'] as num).toInt(),
  size: (json['size'] as num).toInt(),
  totalElements: (json['total_elements'] as num).toInt(),
  totalPages: (json['total_pages'] as num).toInt(),
  last: json['last'] as bool,
);

Map<String, dynamic> _$$PageableResponseImplToJson<T>(
  _$PageableResponseImpl<T> instance,
  Object? Function(T value) toJsonT,
) => <String, dynamic>{
  'content': instance.content.map(toJsonT).toList(),
  'number': instance.page,
  'size': instance.size,
  'total_elements': instance.totalElements,
  'total_pages': instance.totalPages,
  'last': instance.last,
};
