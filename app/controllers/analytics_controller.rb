class AnalyticsController < ApplicationController
  def index
    @keywords = Keyword.all
    @formatted_keywords = Hash.new(0)

    # iterate over the array, counting duplicate entries

    @keywords.each { |keyword|
      @formatted_keywords[keyword[:query]] += 1
      if @formatted_keywords[keyword[:query]] < 1
        @formatted_keywords[:que
          ry] = keyword[:query]
      end
    }
  end
end
