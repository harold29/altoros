class QuestionSerializer < ActiveModel::Serializer
  attributes :id, :content, :answers

  belongs_to :user, key: :owner
  # has_many :answers, serializer: AnswerSerializer

  def answers
    customized_answers = []

    object.answers.each do |answer|
      custom_answer = answer.slice(:id, :content)

      custom_answer[:content] = answer.content
      custom_answer[:owner] = answer.user.slice(:id, :full_name)

      customized_answers.push(custom_answer)
    end

    return customized_answers
  end
end
