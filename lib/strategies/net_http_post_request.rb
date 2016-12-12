require 'scraped'

class NetHttpPostRequest < Scraped::Request::Strategy
  def response
    { body: Net::HTTP.post_form(url, config[:params]).body }
  end
end
