require 'net/http'
require 'uri'
require 'json'

class Gitter
  
  def initialize(handle,scoring_params)
   @handle = handle
   @scoring_params = scoring_params
  end

  def score
    events = get_events(build_gitter_url)
    puts get_score(events) unless events.nil?
  end

  private
  
  def build_gitter_url
    "https://api.github.com/users/#{@handle}/events/public"
  end
  
  def get_events(url)
    begin
      uri = URI.parse(url)
      response = Net::HTTP.get_response uri
      response_body = JSON.parse(response.body)
      if response_body.is_a? Array
        return response_body
      elsif response_body.key?("message")
        raise Exception.new response_body["message"]
      else
        raise Exception.new "Unknown error"
      end
    rescue Timeout::Error => e
      puts "Request timed out"
    rescue Exception => e
      puts "Request failed with #{e.message}"
    end
  end

  def get_score(events)
     grouped = events.group_by{|h| h["type"]}.values
     score = grouped.map { |g|
     event_type = g.first["type"].strip
      event_score = @scoring_params[event_type]
      unless event_score.nil?
        event_score * g.count
      else
        1
      end
    }.sum
    score
  end

end
