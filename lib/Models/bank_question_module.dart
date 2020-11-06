// To parse this JSON data, do
//
//     final questionBankModule = questionBankModuleFromJson(jsonString);

import 'dart:convert';

List<QuestionBankModule> questionBankModuleFromJson(String str) => List<QuestionBankModule>.from(json.decode(str).map((x) => QuestionBankModule.fromJson(x)));

String questionBankModuleToJson(List<QuestionBankModule> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class QuestionBankModule {
  QuestionBankModule({
    this.classSubjectId,
    this.classSubjectName,
    this.subjectExamsList,
  });

  int classSubjectId;
  String classSubjectName;
  List<SubjectExamsList> subjectExamsList;

  QuestionBankModule copyWith({
    int classSubjectId,
    String classSubjectName,
    List<SubjectExamsList> subjectExamsList,
  }) =>
      QuestionBankModule(
        classSubjectId: classSubjectId ?? this.classSubjectId,
        classSubjectName: classSubjectName ?? this.classSubjectName,
        subjectExamsList: subjectExamsList ?? this.subjectExamsList,
      );

  factory QuestionBankModule.fromJson(Map<String, dynamic> json) => QuestionBankModule(
    classSubjectId: json["classSubjectId"] == null ? null : json["classSubjectId"],
    classSubjectName: json["classSubjectName"] == null ? null : json["classSubjectName"],
    subjectExamsList: json["subjectExamsList"] == null ? null : List<SubjectExamsList>.from(json["subjectExamsList"].map((x) => SubjectExamsList.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "classSubjectId": classSubjectId == null ? null : classSubjectId,
    "classSubjectName": classSubjectName == null ? null : classSubjectName,
    "subjectExamsList": subjectExamsList == null ? null : List<dynamic>.from(subjectExamsList.map((x) => x.toJson())),
  };
}

class SubjectExamsList {
  SubjectExamsList({
    this.subjectExamId,
    this.subjectExamName,
    this.isActivated,
    this.examQuestionsList,
  });

  int subjectExamId;
  String subjectExamName;
  bool isActivated;
  List<ExamQuestionsList> examQuestionsList;

  SubjectExamsList copyWith({
    int subjectExamId,
    String subjectExamName,
    bool isActivated,
    List<ExamQuestionsList> examQuestionsList,
  }) =>
      SubjectExamsList(
        subjectExamId: subjectExamId ?? this.subjectExamId,
        subjectExamName: subjectExamName ?? this.subjectExamName,
        isActivated: isActivated ?? this.isActivated,
        examQuestionsList: examQuestionsList ?? this.examQuestionsList,
      );

  factory SubjectExamsList.fromJson(Map<String, dynamic> json) => SubjectExamsList(
    subjectExamId: json["subjectExamId"] == null ? null : json["subjectExamId"],
    subjectExamName: json["subjectExamName"] == null ? null : json["subjectExamName"],
    isActivated: json["isActivated"] == null ? null : json["isActivated"],
    examQuestionsList: json["examQuestionsList"] == null ? null : List<ExamQuestionsList>.from(json["examQuestionsList"].map((x) => ExamQuestionsList.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "subjectExamId": subjectExamId == null ? null : subjectExamId,
    "subjectExamName": subjectExamName == null ? null : subjectExamName,
    "isActivated": isActivated == null ? null : isActivated,
    "examQuestionsList": examQuestionsList == null ? null : List<dynamic>.from(examQuestionsList.map((x) => x.toJson())),
  };
}

class ExamQuestionsList {
  ExamQuestionsList({
    this.id,
    this.question,
    this.option1,
    this.option2,
    this.option3,
    this.option4,
    this.option5,
    this.correctAnswer,
    this.classSubjectExamYearId,
    this.classSubjectExamYear,
    this.classSubjectExamYearName,
  });

  int id;
  String question;
  String option1;
  String option2;
  String option3;
  String option4;
  String option5;
  String correctAnswer;
  int classSubjectExamYearId;
  dynamic classSubjectExamYear;
  dynamic classSubjectExamYearName;

  ExamQuestionsList copyWith({
    int id,
    String question,
    String option1,
    String option2,
    String option3,
    String option4,
    String option5,
    String correctAnswer,
    int classSubjectExamYearId,
    dynamic classSubjectExamYear,
    dynamic classSubjectExamYearName,
  }) =>
      ExamQuestionsList(
        id: id ?? this.id,
        question: question ?? this.question,
        option1: option1 ?? this.option1,
        option2: option2 ?? this.option2,
        option3: option3 ?? this.option3,
        option4: option4 ?? this.option4,
        option5: option5 ?? this.option5,
        correctAnswer: correctAnswer ?? this.correctAnswer,
        classSubjectExamYearId: classSubjectExamYearId ?? this.classSubjectExamYearId,
        classSubjectExamYear: classSubjectExamYear ?? this.classSubjectExamYear,
        classSubjectExamYearName: classSubjectExamYearName ?? this.classSubjectExamYearName,
      );

  factory ExamQuestionsList.fromJson(Map<String, dynamic> json) => ExamQuestionsList(
    id: json["id"] == null ? null : json["id"],
    question: json["question"] == null ? null : json["question"],
    option1: json["option1"] == null ? null : json["option1"],
    option2: json["option2"] == null ? null : json["option2"],
    option3: json["option3"] == null ? null : json["option3"],
    option4: json["option4"] == null ? null : json["option4"],
    option5: json["option5"] == null ? null : json["option5"],
    correctAnswer: json["correctAnswer"] == null ? null : json["correctAnswer"],
    classSubjectExamYearId: json["classSubjectExamYearId"] == null ? null : json["classSubjectExamYearId"],
    classSubjectExamYear: json["classSubjectExamYear"],
    classSubjectExamYearName: json["classSubjectExamYearName"],
  );

  Map<String, dynamic> toJson() => {
    "id": id == null ? null : id,
    "question": question == null ? null : question,
    "option1": option1 == null ? null : option1,
    "option2": option2 == null ? null : option2,
    "option3": option3 == null ? null : option3,
    "option4": option4 == null ? null : option4,
    "option5": option5 == null ? null : option5,
    "correctAnswer": correctAnswer == null ? null : correctAnswer,
    "classSubjectExamYearId": classSubjectExamYearId == null ? null : classSubjectExamYearId,
    "classSubjectExamYear": classSubjectExamYear,
    "classSubjectExamYearName": classSubjectExamYearName,
  };
}
