module ApplicationHelper
  def current_page
    ( params[:page] || 1 ).to_i
  end

  def max_page 
    (User.count.to_f / 50).ceil
  end

end
