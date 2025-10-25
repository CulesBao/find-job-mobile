import 'package:freezed_annotation/freezed_annotation.dart';
import '../models/province_dto.dart';

part 'provinces_data_wrapper.freezed.dart';
part 'provinces_data_wrapper.g.dart';

@freezed
class ProvincesDataWrapper with _$ProvincesDataWrapper {
  const factory ProvincesDataWrapper({required List<ProvinceDto> provinces}) =
      _ProvincesDataWrapper;

  factory ProvincesDataWrapper.fromJson(Map<String, dynamic> json) =>
      _$ProvincesDataWrapperFromJson(json);
}
