require 'minitest/autorun'
require 'minitest/pride'
require './lib/binary_translator'

class BinaryTranslatorTest < Minitest::Test
  def test_it_exists
    bt = BinaryTranslator.new
    assert_instance_of BinaryTranslator, bt
  end

  def test_it_can_translate_things
    bt = BinaryTranslator.new
    assert_equal "000001", bt.translate("a")
    assert_equal "011010", bt.translate("z")
    expected = "010100010101010010001001001110000111"
    assert_equal expected, bt.translate("turing")
  end

  def test_if_can_take_on_capital_letters
    bt = BinaryTranslator.new
    assert_equal "000001", bt.translate("A")
    expected = "010100010101010010001001001110000111"
    assert_equal expected, bt.translate("TURING")
  end

  def test_empty_string_returns_zeros
    bt = BinaryTranslator.new
    expected = "001000000101001100001100001111000000010111001111010010001100000100"
    assert_equal "000000", bt.translate(" ")
    assert_equal "", bt.translate("!@{$#%^&*()}")
    assert_equal expected, bt.translate("Hello World!")
  end

  def test_it_can_be_reversed
    bt = BinaryTranslator.new
    actual = "001000000101001100001100001111000000010111001111010010001100000100"
    assert_equal "hello world", bt.translate_to_text(actual)
  end
end
