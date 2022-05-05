module TweetsHelper
  def humanize_number(number)
    number_to_human(number, format: '%n%u', precision: 2, units: { thousand: 'K', million: 'M', billion: 'B' })
  end
end
