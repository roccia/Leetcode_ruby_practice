# Given a string containing just the characters '(', ')', '{', '}', '[' and ']', determine if the input string is valid.
#
#     An input string is valid if:
#
#                                  Open brackets must be closed by the same type of brackets.
#     Open brackets must be closed in the correct order.
#     Note that an empty string is also considered valid.
#
#         Example 1:
#
#     Input: "()"
# Output: true
# Example 2:
#
#     Input: "()[]{}"
# Output: true
# Example 3:
#
#     Input: "(]"
# Output: false
# Example 4:
#
#     Input: "([)]"
# Output: false
# Example 5:
#
#     Input: "{[]}"
# Output: true
class ValidParentheses
  def is_valid(s)
    temp = []
    ary = s.chars
     ary.each do |i|
       if i == '('
          temp.push(')')
       elsif i == '{'
          temp.push('}')
       elsif i == '['
          temp.push(']')
       elsif temp.empty? || temp.pop != i
          return false
       end

     end
    temp.empty?
  end
end

v = ValidParentheses.new
p v.is_valid("()[]{}")