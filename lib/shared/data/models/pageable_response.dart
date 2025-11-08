import 'package:freezed_annotation/freezed_annotation.dart';

part 'pageable_response.freezed.dart';
part 'pageable_response.g.dart';

@Freezed(genericArgumentFactories: true)
class PageableResponse<T> with _$PageableResponse<T> {
  const factory PageableResponse({
    required List<T> content,
    required int page,
    required int size,
    @JsonKey(name: 'total_elements') required int totalElements,
    @JsonKey(name: 'total_pages') required int totalPages,
    required bool last,
  }) = _PageableResponse<T>;

  factory PageableResponse.fromJson(
    Map<String, dynamic> json,
    T Function(Object?) fromJsonT,
  ) => _$PageableResponseFromJson(json, fromJsonT);
}
