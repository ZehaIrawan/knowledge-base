class AnalyticsController < ApplicationController
  def index
    @keywords = Keyword.all
    @formatted_keywords = Hash.new(0)

# iterate over the array, counting duplicate entries

# print names
# print hash
print @formatted_keywords
print @keywords

@keywords.each { |keyword|
  print keyword[:query]
  print "\n"
  @formatted_keywords[keyword[:query]] += 1
  @formatted_keywords[:query] = keyword[:query]
}

print @formatted_keywords


  end
end
