module MainsmsApi
  class Cancel
    include ActiveAttr::MassAssignment
    include Common

    attr_accessor :message_ids

    def initialize(args = {})
      super(args)
    end

    alias_method :cancel, :response

    private

    def message_ids_string
      message_ids.try(:join, ',')
    end

    def params
      { project: project, messages_id: message_ids_string }
    end

    def path
      'api/mainsms/message/cancel'
    end
  end
end
