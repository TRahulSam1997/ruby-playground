# @param {Integer} num_rows
# @return {Integer[][]}
def generate(num_rows)
    pascals_triangle = []

    for i in 1..num_rows do
        val = 1
        row_output = []

        for j in 1..i do
            row_output.append(val)
            val = (val * (i - j)) / j
        end

        pascals_triangle.append(row_output)
    end

    return pascals_triangle
end

print generate(5)