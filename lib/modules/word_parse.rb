module WordParse

  extend ActiveSupport::Concern
  def check_bad_words(body)
    ["bad", "poor", "dirty", "stupid"].any? { |word| body.include? word }
  end

  module ClassMethods
    def count_vowel(input)
      input.downcase.count("aeoui")
    end
  end

  #def self.included(including_class)
  #	including_class.extend CheckVowel
  #end

  # included do
  #   belongs_to :user
  # end

end