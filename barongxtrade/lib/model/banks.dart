class Question {
  String? query;
  String? answer;
  DateTime? created;

  Question();

  Map<String, dynamic> toJson() =>
      {'query': query, 'answer': answer, 'created': created};
}
