class Analyzer
 attr_reader :text

  def initialize(text)
    @text = text
  end

  def count
    @text.length
  end

  def char_count
    words = @text.gsub(" ", "")
    words.length
  end

  def line_count
    lines= @text.split("\n")
    lines.count
  end

  def word_count
    words = @text.gsub(/[[:punct:]]/, "").split(" ")
    words.count
  end

  def sentence_count
    sentences = @text.split(".")
    sentences.count
  end

  def para_count
    paragraphs = @text.split("\n\n")
    paragraphs.count
  end

end
