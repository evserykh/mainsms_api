module MainsmsApi
  class Balance
    include ActiveAttr::MassAssignment
    include Common

    def initialize(args = {})
      super(args)
    end

    alias_method :check, :response

    private

    def params
      { project: project }
    end

    def path
      'api/mainsms/message/balance'
    end
  end
end
