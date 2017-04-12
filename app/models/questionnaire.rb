class Questionnaire < ApplicationRecord

  belongs_to :refuge
  has_many :responses

  def save_with_responses questions_params
    questions_params.each do |question|
      unless question[:sub_questions].blank?
        question[:sub_questions].each do |sub_question|
          add_response_by_question_param(sub_question) unless sub_question[:answers].blank?
        end
      end
      add_response_by_question_param(question) unless question[:answers].blank?
    end
    ap '-------------------------------------------------------------------'
    ap self.responses
    ap '-------------------------------------------------------------------'
    if self.responses.size > 0
      return self.save
    else
      self.errors.add :base, "No responses has been registered"
      return false
    end
  end

  def add_response_by_question_param question_param
    if Question.question_types.keys.include? question_param[:question_type]
      answers = question_param[:answers]
      case question_param[:question_type].to_sym
      when :one_choice
        ap '-------------------------------------------------------------------'
        ap answers[0][:selected_id]
        ap '-------------------------------------------------------------------'
        self.responses.build(question_id: question_param[:id], answer_selected_id: [answers[0][:selected_id]])
      when :multiple_choice
        self.responses.build(question_id: question_param[:id], answer_selected_id: answers.map{|a| a[:selected_id]})
      when :input_value          
        self.responses.build(question_id: question_param[:id], answer_responsed_text: answers[0][:answer_value])
      end
    end
  end

end
