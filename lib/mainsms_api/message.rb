module MainsmsApi
  class Message
    include ActiveAttr::MassAssignment
    include Common

    attr_accessor :project, :sender, :message, :recipients, :run_at, :test

    def initialize(args = {})
      super(args)
    end

    alias_method :post, :response

    private

    def recipients_string
      recipients.try(:join, ',')
    end

    def params
      { project: project, sender: sender , message: message, recipients: recipients_string, run_at: run_at, test: test }
    end

    def path
      'api/mainsms/message/send'
    end
  end
end
