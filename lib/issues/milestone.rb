module Issues
  class Milestone
    include Virtus
    include Github::Resource
    
    attribute :number, Integer
    attribute :title, String

    def to_s
      "##{number} - #{title}"
    end

  end
end
