require "minitest/autorun"
require_relative "../lib/ractor_tail"

class TailerTest < Minitest::Test
  def test_tailer_exists
    assert RactorTail::Tailer
  end
end
