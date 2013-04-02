require File.expand_path(File.dirname(__FILE__) + '/edgecase')

# You need to write the triangle method in the file 'triangle.rb'
require 'triangle.rb'

def triangle(a, b, c)
	if a==0 && b==0 && c==0
    raise TriangleError, "This isn't a triangle"
  end
  if a <0 or b < 0 or c <0
    raise TriangleError, "Negative length - thats not right"
  end
  if a + b <= c  or a + c <= b or  b + c <= a
    raise TriangleError, "One length can't be more (or the same as) than the other two added together.  If it was the same, the whole thing would be a line.  If more, it wouldn't reach. "
  end   
  if  a == b && b == c
    return :equilateral
  elsif a ==b || b == c || a == c
    return :isosceles
  elsif a != b && a != c && b != c
    return :scalene
  end
end

class AboutTriangleProject2 < EdgeCase::Koan
  # The first assignment did not talk about how to handle errors.
  # Let's handle that part now.
  def test_illegal_triangles_throw_exceptions
    assert_raise(TriangleError) do triangle(0, 0, 0) end
    assert_raise(TriangleError) do triangle(3, 4, -5) end
    assert_raise(TriangleError) do triangle(1, 1, 3) end
    assert_raise(TriangleError) do triangle(2, 4, 2) end
    # HINT: for tips, see http://stackoverflow.com/questions/3834203/ruby-koan-151-raising-exceptions
 end
end

