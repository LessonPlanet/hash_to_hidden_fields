require 'active_support/core_ext/object/to_query'
require 'action_view'
require 'action_view/helpers'

module ActionView
  module Helpers
    module HashToHiddenFields
      def hash_to_hidden_fields(hash)
        pairs        = hash.to_query.split(Rack::Utils::DEFAULT_SEP)

        tags = pairs.map do |pair|
          key, value = pair.split('=', 2).map { |str| Rack::Utils.unescape(str) }
          hidden_field_tag(key, value)
        end

        tags.join("\n").html_safe
      end
    end
  end
end
