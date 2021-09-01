# frozen_string_literal: true

require_relative "valuer/version"

# a person whose job is to estimate the value of something that is to be purchased.
module Valuer
  class Error < StandardError; end

  class MinimumError < StandardError; end

  class MaximumError < StandardError; end

  def self.value(type, value, opts = {})
    result = nil
    begin
      result = case type.name
               when "Integer"
                 Integer value
               when "Float"
                 Float value
               when "TrueClass"
                 case value
                 when "yes"
                   true
                 else
                   value == true
                 end
               when "FalseClass"
                 case value
                 when "no"
                   true
                 else
                   value == true
                 end
               end
    rescue StandardError => e
      return opts[:default] if opts[:default]

      raise Valuer::Error, e.to_s
    end

    raise Valuer::MinimumError, "minimum is #{opts[:min]}" if opts[:min] && result < opts[:min]
    raise Valuer::MaximumError, "maximum is #{opts[:max]}" if opts[:max] && result > opts[:max]

    result
  end
end
