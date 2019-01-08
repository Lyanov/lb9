# CalculatorController controller handles calculations
class CalculatorController < ApplicationController
  def armstrong_number?(arg)
    number = arg.to_s.length
    arg == arg.to_s.split('').map(&:to_i).map { |elem| elem**number }.inject(&:+)
  end

  def input; end

  def result
    if params[:param] == '' || params[:param].to_i.nil? || params[:param].to_i.zero?
      @result = 'There is no data or the data is incorrect'
      nil
    elsif params[:param].to_i >= 6
      @result = 'Number is too big'

    else
      @result = []
      ((10**(params[:param].to_i - 1))..(10**params[:param].to_i - 1))
        .each do |i|
        @result << i if armstrong_number?(i)
      end


    end
    respond_to do |format|
      format.html
      format.json do
        render json:
        {type: @result.class.to_s, value: @result}
      end
    end
  end
end
