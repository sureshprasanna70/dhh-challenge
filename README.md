## DHH score challenge

David Heinemeier Hansson is creator of Ruby on Rails. His github url is https://github.com/dhh .

Github provides information about his public commits in JSON format at
https://api.github.com/users/dhh/events/public .

In the JSON data there is an attribute called "type" which denotes what kind of commit it was.

Let's say that we give following score to DHH based on the "type" of the commit.

```
IssuesEvent = 7
IssueCommentEvent = 6
PushEvent = 5
PullRequestReviewCommentEvent = 4
WatchEvent = 3
CreateEvent = 2

Any other event = 1
```

### Task

Write a ruby program which when executed prints the total score of https://github.com/dhh .
Total scorei is the sum of all score given to DHH based on the type of the commit.

The answer printed on the terminal should be like this.

```
$ ruby exercise.rb
DHH's github score is xxx
```

Calculate the total score based on the data returned from only the first page of that API call.
Do not worry about pagination.

