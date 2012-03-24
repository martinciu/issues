module Issues
  class Milestone
    include Virtus
    include Github::Resource
    
    attribute :number, Integer
    attribute :title, String
    attribute :repo, Repo

    def self.all(repo)
      body = github.get("/repos/#{repo.handle}/milestones").body
      JSON.parse(body).map {|attributes| new(attributes.merge(repo: repo)) }
    end

    def to_s
      "##{number} - #{title} (#{repo.handle})"
    end

  end
end
