require 'rubygems'
require 'bundler/setup'
require "github_api"
require "bitbucket_rest_api"
require "trollop"

opts = Trollop::options do
  opt :username, "Username", required: true, type: String
  opt :password, "Password", required: true, type: String
  opt :repo, "Name of repository to create issue", required: true, type: String
  opt :title, "Bug title", required: true, type: String
  opt :github, "Create issue on Github", default: true
  opt :bitbucket, "Create issue on BitBucket", default: true
end

class RepoGateway
  def initialize(opts)
    @username = opts.username
    @password = opts.password
    @repo = opts.repo
    @use_github = opts.github
    @use_bitbucket = opts.bitbucket
  end

  def create_issue(title)
    if @use_github
      @api = Github::Issues.new login: @username, password: @password, user: @username, repo: @repo
      @api.create title: title
    end

    if @use_bitbucket
      @api = BitBucket::Issues.new login: @username, password: @password
      @api.create @username, @repo, title: title
    end
  end
end

repo = RepoGateway.new opts
repo.create_issue(opts.title)

# github = Github::Issues.new login: opts.username, password: "", user: 'jvalentini', repo: 'new_hire_test'
# github.create title: "New bug", body: "Bug description goes here"

# bitbucket = BitBucket.new login: opts.username, password: ""
# bitbucket.issues.create "jvalentini", "new_hire_test", title: "New bug"
