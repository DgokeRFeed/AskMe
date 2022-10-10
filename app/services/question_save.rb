class QuestionSave
  def self.call(question:, params:)
    new(question:, params:).call
  end

  def call
    assign_params
    create_hashtags
  end

  private

  attr_reader :question, :params

  def initialize(question:, params:)
    @question = question
    @params = params
  end

  def assign_params()
    question.attributes = params
  end

  def create_hashtags
    question.transaction do
      question.save!

      question.hashtags =
        "#{question.body} #{question.answer}".
          downcase.
          scan(Hashtag::REGEX).
          uniq.
          map { |hashtag| Hashtag.create_or_find_by(text: hashtag.delete("#")) }

      true
    end
  rescue ActiveRecord::RecordInvalid
    false
  end
end
