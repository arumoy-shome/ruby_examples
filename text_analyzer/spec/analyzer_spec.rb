require 'spec_helper'

describe Analyzer do
  Given(:sample_text){Analyzer.new(string)}

  context "total count" do
    Given(:string){"Hello World!"}
    When(:result){sample_text.count}
    # much hacky
    Then{expect(result).to be == 12}
  end

  context "total char w/o space" do
    Given(:string){"Hello World!"}
    When(:result){sample_text.char_count}
    Then{expect(result).to be == 11}
  end

  context "line count" do
    Given(:string){"Lorem ipsum dolor sit amet,
      consectetur adipisicing elit, sed do eiusmod tempor incididunt
        ut labore et dolore magna aliqua. Ut enim ad minim veniam,
         quis nostrud exercitation ullamco laboris nisi ut aliquip ex
          ea commodo consequat."}
    When(:result){sample_text.line_count}
    Then{expect(result).to be == 5}
  end

  context "word count" do
    Given(:string){"Hello, World!"}
    When(:result){sample_text.word_count}
    Then{expect(result).to be == 2}
  end

  context "sentence count" do
    Given(:string){"Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat."}
    When(:result){sample_text.sentence_count}
    Then{expect(result).to be == 2}
  end

  context "paragraph count" do
    Given(:string){"Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.

      Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.

      Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.

      Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."}
    When(:result){sample_text.para_count}
    Then{expect(result).to be == 4}
  end

  

end
