module MainsmsApi
  class Status
    include ActiveAttr::MassAssignment
    include Common

    attr_accessor :message_ids

    def initialize(args = {})
      super(args)
    end

    alias_method :check, :response

    private

    def message_ids_string
      message_ids.try(:join, ',')
    end

    def params
      { project: project, messages_id: message_ids_string }
    end

    def path
      'api/mainsms/message/status'
    end
  end
end
