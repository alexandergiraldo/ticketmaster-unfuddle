module TicketMaster::Provider
  module Unfuddle
    # Ticket class for ticketmaster-unfuddle
    #
    
    class Ticket < TicketMaster::Provider::Base::Ticket
      API = UnfuddleAPI::Ticket # The class to access the api's tickets
      # declare needed overloaded methods here
      
      def title
        self.summary
      end
      
      def created_at
        @created_at ||= self[:created_at] ? Time.parse(self[:created_at]) : nil
      end
      
      def updated_at
        @updated_at ||= self[:updated_at] ? Time.parse(self[:updated_at]) : nil
      end
      
      def project_id
        self.prefix_options[:project_id]
      end
      
      def assignee
        @assignee ||= begin
          UnfuddleAPI::People.find(self[:assignee_id]).username
          rescue
          ''
          end
      end
      
      def requestor
        @requestor ||= begin
          UnfuddleAPI::People.find(self[:reporter_id]).username
          rescue
          ''
          end
      end
      
    end
  end
end
