module Issues
  class Repo
    include Virtus

    attribute :name, String
    attribute :owner, User

    def self.find(handle)
      login, name = handle.split('/')
      new(name: name, owner: { login: login })
    end

    def milestones
      Milestone.all(self)
    end

    def handle
      "#{owner.login}/#{name}"
    end
  end
end
