module MainsmsApi
  class Info
    include ActiveAttr::MassAssignment
    include Common

    attr_accessor :phones 

    def initialize(args = {})
      super(args)
    end

    alias_method :get, :response

    private

    def phones_string
      phones.try(:join, ',')
    end

    def params
      { project: project, phones: phones_string }
    end

    def path
      'api/mainsms/message/info'
    end
  end
end
