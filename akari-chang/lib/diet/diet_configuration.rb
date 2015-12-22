module Slappy
  module Diet
    class Slappy::Configuration
      attr_accessor :diet
    end

    def self.extended(config)
      config.diet = Slappy::Diet::Configuration.new
    end

    class Configuration
      attr_accessor :client_id, :client_secret, :reflash_token, :sheet_id

      def client_id
        @client_id || ENV['OAUTH_CLIENT']
      end

      def client_secret
        @client_secret || ENV['OAUTH_SECRET']
      end

      def refresh_token
        @refresh_token || ENV['OAUTH_REFRESH']
      end

      def sheet_id
        @sheet_id || ENV['DIET_SHEET_ID']
      end
    end
  end
end
