module QuestionsHelper
  def question_author(question)
    if question.author
      link_to output_nickname(question.author), question.author
    else
      "Аноним"
    end
  end

  def question_destination(question)
    link_to output_nickname(question.user), question.user
  end

  def text_with_hashtag_link(text)
    strip_tags(text).gsub(Hashtag::REGEX) do |hashtag|
      link_to hashtag, hashtag_path(hashtag.delete("#")).downcase
    end
  end
end
