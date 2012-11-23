class Rome
  class Parser
    MAPPING={"M" => 1000, "D" => 500, "C"=> 100, "L" => 50, "X" => 10, "V" => 5, "I" => 1}
    def self.parse(value)

      numerals = value.to_s.upcase.split ""
      sum = 0

      (0..numerals.size - 1).each do |number| 
        
        sum += MAPPING[numeral] || 0
      end

      sum

    end
  end
end