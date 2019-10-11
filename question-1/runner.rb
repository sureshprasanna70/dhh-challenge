require './gitter.rb'
scoring_params = {"IssuesEvent" => 7,"IssueCommentEvent" => 6,"PushEvent" => 5,"PullRequestReviewCommentEvent" => 4,"WatchEvent" => 3,"CreateEvent" => 2}
dhh = Gitter.new("dhh",scoring_params)
dhh.score()
