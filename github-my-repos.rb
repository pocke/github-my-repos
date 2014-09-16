require 'octokit'

Octokit.auto_paginate = true

def get_repos(user)
  u = Octokit.user(user)
  repos = u.rels[:repos].get.data

  return repos.map do |repo|
    repo.html_url
  end
end

get_repos(ARGV[0]).each do |url|
  puts url
end
