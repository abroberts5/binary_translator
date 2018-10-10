class BinaryTranslator
  def initialize
    @alpha_to_binary = {
      "a" => "000001",
      "b" => "000010",
      "c" => "000011",
      "d" => "000100",
      "e" => "000101",
      "f" => "000110",
      "g" => "000111",
      "h" => "001000",
      "i" => "001001",
      "j" => "001010",
      "k" => "001011",
      "l" => "001100",
      "m" => "001101",
      "n" => "001110",
      "o" => "001111",
      "p" => "010000",
      "q" => "010001",
      "r" => "010010",
      "s" => "010011",
      "t" => "010100",
      "u" => "010101",
      "v" => "010110",
      "w" => "010111",
      "x" => "011000",
      "y" => "011001",
      "z" => "011010",
      " " => "000000"
    }
  end

  def translate(letters)
    string = ""
    updated_letters = letters.downcase
    updated_letters.chars.each do |letter|
      if @alpha_to_binary.keys.include?(letter)
        string << @alpha_to_binary[letter]
      else
        ""
      end
    end
    string
  end

  def translate_to_text(binary)
    new_array = binary.chars.each_slice(6).map(&:join)
    reverse_text = new_array.map do |rev|
      @alpha_to_binary.key(rev)
    end
    reverse_text.join
  end
end
