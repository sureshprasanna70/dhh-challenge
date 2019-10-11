require 'net/http'
require 'uri'

class Gitter
  
  def initialize(handle,scoring_params)
   @handle = handle
   @scoring_params = scoring_params
  end

  def score()
    events = get_events(build_gitter_url)
    score = get_score(events)
    puts "score for #{@handle} is #{score}"
  end

  private
  
  def build_gitter_url
    "https://api.github.com/users/#{@handle}/events/public"
  end
  
  def get_events(url)
    begin
      uri = URI.parse(url)
      response = Net::HTTP.get_response uri
      response.body
    rescue Timeout::Error => e
      puts "Request timed out"
    rescue Exception => e
      puts "Request failed with #{e.message}"
    end
  end

  def get_score(events)
    "calculated score"
  end

end
