// import 'package:meta/meta.dart';
import 'dart:convert';

SurveyDetail surveyDetailFromJson(String str) =>
    SurveyDetail.fromJson(json.decode(str));

String surveyDetailToJson(SurveyDetail data) => json.encode(data.toJson());

class SurveyDetail {
  SurveyDetail({
    required this.id,
    required this.name,
    required this.description,
    required this.sections,
    required this.createdBy,
  });

  final int id;
  final String name;
  final String description;
  final List<Section> sections;
  final dynamic createdBy;

  factory SurveyDetail.fromJson(Map<String, dynamic> json) => SurveyDetail(
        id: json["id"],
        name: json["name"],
        description: json["description"],
        sections: List<Section>.from(
            json["sections"].map((x) => Section.fromJson(x))),
        createdBy: json["created_by"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "description": description,
        "sections": List<dynamic>.from(sections.map((x) => x.toJson())),
        "created_by": createdBy,
      };
}

class Section {
  Section({
    required this.id,
    required this.surveyId,
    required this.name,
    required this.description,
    required this.sequence,
    required this.questions,
    required this.isQuestion,
    // required this.pageIndex,
  });

  final int id;
  final int surveyId;
  final String name;
  final String description;
  final int sequence;
  final List<Question> questions;
  final String isQuestion;

  factory Section.fromJson(Map<String, dynamic> json) => Section(
        id: json["id"],
        surveyId: json["survey_id"],
        name: json["name"] ?? '',
        description: json["description"] ?? '',
        sequence: json["sequence"],
        questions: List<Question>.from(
            json["questions"].map((x) => Question.fromJson(x))),
        isQuestion: json["is_question"] ?? '0',
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "survey_id": surveyId,
        "name": name,
        "description": description,
        "sequence": sequence,
        "questions": List<dynamic>.from(questions.map((x) => x.toJson())),
      };
}

class Question {
  Question({
    required this.id,
    required this.surveyId,
    required this.sectionId,
    required this.question,
    required this.description,
    required this.sequence,
    required this.isRequired,
    required this.answerValidation,
    required this.questionAnswerOptions,
  });

  final int id;
  final int surveyId;
  final int sectionId;
  final String question;
  final dynamic description;
  final int sequence;
  final String isRequired;
  final AnswerValidation? answerValidation;
  final List<QuestionAnswerOption> questionAnswerOptions;

  factory Question.fromJson(Map<String, dynamic> json) => Question(
        id: json["id"],
        surveyId: json["survey_id"],
        sectionId: json["section_id"],
        question: json["question"],
        description: json["description"] ?? '',
        sequence: json["sequence"],
        isRequired: json["is_required"] ?? '0',
        answerValidation: json["answer_validation"] == null
            ? null
            : AnswerValidation.fromJson(json["answer_validation"]),
        questionAnswerOptions: List<QuestionAnswerOption>.from(
            json["question_answer_options"]
                .map((x) => QuestionAnswerOption.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "survey_id": surveyId,
        "section_id": sectionId,
        "question": question,
        "description": description,
        "sequence": sequence,
        "is_required": isRequired,
        "answer_validation":
            answerValidation == null ? null : answerValidation!.toJson(),
        "question_answer_options":
            List<dynamic>.from(questionAnswerOptions.map((x) => x.toJson())),
      };
}

class AnswerValidation {
  AnswerValidation({
    required this.id,
    required this.validationTypeId,
    required this.validationOperatorId,
    required this.validationValue1,
    required this.validationValue2,
    required this.errorMessage,
    required this.validationTypeName,
    required this.validationOperatorName,
    required this.validationOperatorSymbol,
  });

  final int id;
  final int validationTypeId;
  final int validationOperatorId;
  final String validationValue1;
  final dynamic validationValue2;
  final String errorMessage;
  final String validationTypeName;
  final String validationOperatorName;
  final dynamic validationOperatorSymbol;

  factory AnswerValidation.fromJson(Map<String, dynamic> json) =>
      AnswerValidation(
        id: json["id"],
        validationTypeId: json["validation_type_id"],
        validationOperatorId: json["validation_operator_id"],
        validationValue1: json["validation_value_1"] ?? '',
        validationValue2: json["validation_value_2"] ?? '',
        errorMessage: json["error_message"],
        validationTypeName: json["validation_type_name"],
        validationOperatorName: json["validation_operator_name"],
        validationOperatorSymbol: json["validation_operator_symbol"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "validation_type_id": validationTypeId,
        "validation_operator_id": validationOperatorId,
        "validation_value_1": validationValue1,
        "validation_value_2": validationValue2,
        "error_message": errorMessage,
        "validation_type_name": validationTypeName,
        "validation_operator_name": validationOperatorName,
        "validation_operator_symbol": validationOperatorSymbol,
      };
}

class QuestionAnswerOption {
  QuestionAnswerOption({
    required this.id,
    required this.surveyId,
    required this.moveToSectionId,
    required this.optionTypeId,
    required this.optionValue1,
    required this.optionValue2,
    required this.optionTypeName,
  });

  final int id;
  final int surveyId;
  final dynamic moveToSectionId;
  final int optionTypeId;
  final String optionValue1;
  final dynamic optionValue2;
  final String optionTypeName;

  factory QuestionAnswerOption.fromJson(Map<String, dynamic> json) =>
      QuestionAnswerOption(
        id: json["id"],
        surveyId: json["survey_id"],
        moveToSectionId: json["move_to_section_id"],
        optionTypeId: json["option_type_id"],
        optionValue1: json["option_value_1"] ?? '',
        optionValue2: json["option_value_2"],
        optionTypeName: json["option_type_name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "survey_id": surveyId,
        "move_to_section_id": moveToSectionId,
        "option_type_id": optionTypeId,
        "option_value_1": optionValue1,
        "option_value_2": optionValue2,
        "option_type_name": optionTypeName,
      };
}
