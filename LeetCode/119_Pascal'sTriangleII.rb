# @param {Integer} row_index
# @return {Integer[]}

def get_row(row_index)
  res = []
  (0..row_index).each do |i|
    res[i] = 1
    (i - 1).downto(1).each do |j|
      res[j] = res[j] + res[j - 1]
    end
  end
  res
end
