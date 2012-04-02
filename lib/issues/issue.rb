module Issues
  class Issue
    include Virtus
    include Github::Resource

    attribute :number, Integer
    attribute :state, String
    attribute :assignee, User
    attribute :milestone, Milestone
    attribute :title, String
    attribute :body, String
    attribute :html_url, String
    attribute :labels, Set[Label]
    
    def to_s
      "##{number} - #{title}"
    end

  end
  
end
