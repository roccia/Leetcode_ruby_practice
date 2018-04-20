# Given n pairs of parentheses, write a function to generate all combinations of well-formed parentheses.
#
#     For example, given n = 3, a solution set is:
#
#                                                  [
#                                                      "((()))",
#                                                      "(()())",
#                                                      "(())()",
#                                                      "()(())",
#                                                      "()()()"
#                                                  ]

class GenerateParentheses
  def generate_parenthesis(n)
    ary = []
    back_track(ary,"",0,0,n)
    ary
  end

  def back_track(ary,cur,open,close,max)
    if cur.length == max*2
      ary << cur
      return
    end

    if open < max
      back_track(ary,cur+'(',open+1,close,max)
    end
    if close < open
      back_track(ary,cur+')',open,close+1,max)
    end
     
  end

end