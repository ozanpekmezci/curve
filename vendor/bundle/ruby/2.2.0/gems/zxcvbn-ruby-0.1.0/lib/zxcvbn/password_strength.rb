require 'benchmark'
require 'zxcvbn/omnimatch'
require 'zxcvbn/scorer'

module Zxcvbn
  class PasswordStrength
    def initialize(data)
      @omnimatch = Omnimatch.new(data)
      @scorer = Scorer.new(data)
    end

    def test(password, user_inputs = [])
      password = password || ''
      result = nil
      calc_time = Benchmark.realtime do
        matches = @omnimatch.matches(password, user_inputs)
        result = @scorer.minimum_entropy_match_sequence(password, matches)
      end
      result.calc_time = calc_time
      result
    end
  end
end