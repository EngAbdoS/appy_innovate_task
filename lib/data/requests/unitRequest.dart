class UnitRequest {
  int id;
  String? name;

  UnitRequest({required this.id, this.name});
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
    };}
}
