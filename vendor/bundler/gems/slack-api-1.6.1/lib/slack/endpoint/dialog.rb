# This file was auto-generated by lib/generators/tasks/generate.rb

module Slack
  module Endpoint
    module Dialog
      #
      # Open a dialog with a user
      #
      # @option options [Object] :dialog
      #   The dialog definition. This must be a JSON-encoded string.
      # @option options [Object] :trigger_id
      #   Exchange a trigger to post to the user.
      # @see https://api.slack.com/methods/dialog.open
      # @see https://github.com/aki017/slack-api-docs/blob/master/methods/dialog.open.md
      # @see https://github.com/aki017/slack-api-docs/blob/master/methods/dialog.open.json
      def dialog_open(options={})
        throw ArgumentError.new("Required arguments :dialog missing") if options[:dialog].nil?
        throw ArgumentError.new("Required arguments :trigger_id missing") if options[:trigger_id].nil?
        post("dialog.open", options)
      end

    end
  end
end