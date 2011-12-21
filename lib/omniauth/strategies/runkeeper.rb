require 'omniauth-oauth2'
require 'multi_json'

module OmniAuth
  module Strategies
    class RunKeeper < OmniAuth::Strategies::OAuth2
      option :client_options, {
        :site          => 'http://api.runkeeper.com',
        :authorize_url => 'https://runkeeper.com/apps/authorize',
        :token_url     => 'https://runkeeper.com/apps/token'
      }

      uid { raw_info['userID'] }

      info do
        name     = raw_info['name'].to_s
        username = raw_info['profile'][/[^\/]+$/]
        {
          'name'     => name.empty? ? username : name,
          'nickname' => username,
          'location' => raw_info['location'],
          'image'    => raw_info['small_picture'],
          'urls'     => { 'RunKeeper' => raw_info['profile'] },
        }
      end

      extra do
        { :raw_info => raw_info }
      end

      def raw_info
        @raw_info ||= begin
          user    = MultiJson.decode(access_token.get('/user').body)
          profile = MultiJson.decode(access_token.get(user['profile']).body)
          { 'userID' => user['userID'] }.merge(profile)
        end
      end
    end
  end
end

OmniAuth.config.add_camelization 'runkeeper', 'RunKeeper'
