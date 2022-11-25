# @param {String} s
# @param {String} t
# @return {Boolean}

def str_to_num(s)
  c = 0
  o = s.chars.each_with_object({}) {|el, obj|
    unless obj[el]
      obj[el] = c
      c += 1
    end
  }
  s.chars.map{|x| o[x]}
end

def is_isomorphic(s, t)
  str_to_num(s) == str_to_num(t)
end

puts is_isomorphic("egg", "add")