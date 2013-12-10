module RestaurantsHelper

  def rating_to_words(rating)
    case rating
      when 0
        return 'zeroPtZero'
      when 1
        return 'onePtZero'
      when 2
        return 'twoPtZero'
      when 3
        return 'threePtZero'
      when 4
        return 'fourPtZero'
      when 5
        return 'fivePtZero'
    end
  end

end
