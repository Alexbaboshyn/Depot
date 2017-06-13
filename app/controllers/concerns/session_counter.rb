module SessionCounter

  def counter_increment
    session[:counter] ||= 0
    session[:counter] +=1
    if session[:counter] > 5
        @counter = session[:counter]
    else
        @counter = nil
    end
  end


  def reset_to_zero
    session[:counter] = 0
  end

end
