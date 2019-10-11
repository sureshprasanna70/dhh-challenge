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
    "build url"
  end
  
  def get_events(url)
    "events"
  end

  def get_score(events)
    "calculated score"
  end

end
