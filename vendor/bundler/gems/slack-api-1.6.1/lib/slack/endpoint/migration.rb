# This file was auto-generated by lib/generators/tasks/generate.rb

module Slack
  module Endpoint
    module Migration
      #
      # For Enterprise Grid workspaces, map local user IDs to global user IDs
      #
      # @option options [Object] :users
      #   A comma-separated list of user ids, up to 400 per request
      # @option options [Object] :to_old
      #   Specify true to convert W global user IDs to workspace-specific U IDs. Defaults to false.
      # @see https://api.slack.com/methods/migration.exchange
      # @see https://github.com/aki017/slack-api-docs/blob/master/methods/migration.exchange.md
      # @see https://github.com/aki017/slack-api-docs/blob/master/methods/migration.exchange.json
      def migration_exchange(options={})
        throw ArgumentError.new("Required arguments :users missing") if options[:users].nil?
        post("migration.exchange", options)
      end

    end
  end
end
