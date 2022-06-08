require 'omniauth/strategies/oauth2'
require 'omniauth-oauth2'
require 'uri'

module OmniAuth
  module Strategies
    class FattureInCloud < OmniAuth::Strategies::OAuth2
      option :name, :fatture_in_cloud

      option :token_params, {grant_type: 'authorization_code'}

      # option :authorize_options, %i[scope permissions prompt]

      option :client_options, {
        site: "https://api-v2.fattureincloud.it",
        authorize_url: "/oauth/authorize",
        token_url: "/oauth/token",
      }

      uid{ raw_info["data"]['id'] }

      info do
        {
          :name => raw_info["data"]['name'],
          :email => raw_info["data"]['email']
        }
      end

      extra do
        {
          :company_id => @raw_info_extra["data"]["companies"][0]['id'],
          :company_name => @raw_info_extra["data"]["companies"][0]['name'],
        }
      end

      def raw_info
        @raw_info ||= access_token.get('/user/info').parsed
        @raw_info_extra ||= access_token.get('/user/companies').parsed
      end

      def callback_url
        full_host + script_name + callback_path
      end

    end
  end
end
