module MainsmsApi
  class Price
    include ActiveAttr::MassAssignment
    include Common

    attr_accessor :recipients, :message

    def initialize(args = {})
      super(args)
    end

    alias_method :calculate, :response

    private

    def recipients_string
      recipients.try(:join, ',')
    end

    def params
      { project: project, message: message, recipients: recipients_string }
    end

    def path
      'api/mainsms/message/price'
    end
  end
end
