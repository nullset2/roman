symbols = { 1 => "I", 5 => "V", 10 => "X", 50 => "L", 100 => "C", 500 => "D", 1000 => "M" }

number = ARGV.first
amount_of_digits = number.chars.count

conversion = "" 

number.chars.each do |i|
  n = i.to_i
  base = 10 ** (amount_of_digits - 1)

  if(n == 4 || n == 9)
    conversion.concat(symbols[base]).concat(symbols[(n + 1) * base])
  elsif(n == 5)
    conversion.concat(symbols[base * 5])
  elsif(n < 5)
    conversion.concat(symbols[base] * (n % 5))
  elsif(n > 5)
    conversion.concat(symbols[base * 5]).concat(symbols[base] * (n % 5))
  else
    conversion.concat(symbols[base])
  end

  amount_of_digits = amount_of_digits - 1
end

puts conversion
