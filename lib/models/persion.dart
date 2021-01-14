import 'package:json_annotation/json_annotation.dart';

part 'persion.g.dart';
@JsonSerializable()
class Persion {
    Persion();

    String name;
    String email;
    Persion mother;
    String sex;
    num age;
    List<Persion> brother;
    List<Persion> friends;
    
    factory Persion.fromJson(Map<String,dynamic> json) => _$PersionFromJson(json);
    Map<String, dynamic> toJson() => _$PersionToJson(this);
}