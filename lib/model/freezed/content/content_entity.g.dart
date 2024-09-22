// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'content_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ContentEntityImpl _$$ContentEntityImplFromJson(Map<String, dynamic> json) =>
    _$ContentEntityImpl(
      id: (json['id'] as num).toInt(),
      title: json['title'] as String,
      body: json['body'] as String,
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
    );

Map<String, dynamic> _$$ContentEntityImplToJson(_$ContentEntityImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'body': instance.body,
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt.toIso8601String(),
    };
