class Calculate

  def summ(obj)
    obj.inject(0) do |result, i|
      result + i.inject(0) do |s, x|
          if x.size == 3 && result <= 11
            x = 11
          elsif x.size == 3 && result > 11
            x = 1
          elsif x.size > 3
            x = 10
          end
          s + x.to_i
        end
      end
  end
end
