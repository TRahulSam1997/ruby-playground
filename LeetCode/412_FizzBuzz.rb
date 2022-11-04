# @param {Integer} n
# @return {String[]}
def fizz_buzz(n)
    # ary = Array.new(n - 1)
    (1..n).map do |i|
        if i % 3 == 0 and i % 5 == 0
            "FizzBuzz"
        elsif i % 3 == 0
            "Fizz"
        elsif i % 5 == 0
            "Buzz"
        else
            i.to_s
        end
    end
    # return ary
end

# puts (fizz_buzz(15))
puts (fizz_buzz(3))