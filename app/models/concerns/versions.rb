module Versions

  DEFAULT_VERSION = '0.0.1'
  extend ActiveSupport::Concern

  included do


    before_save :assert_version

    def increment_patch
      increment_part('patch', 1)
    end

    def increment_minor
      increment_part('minor', 1)
    end

    def increment_major
      increment_part('major', 1)
    end

    private

    def assert_version
      self.version ||= Versions::DEFAULT_VERSION
    end

    def increment_part(position, value)
      assert_version
      positions = Hash[['major', 'minor', 'patch'].zip([0, 1, 2])]
      parts = self.version.split(".")
      index = positions[position]
      values = 3.times.map do |i|
        if i < index
          parts[i]
        elsif i == index
          parts[i].to_i + value.to_i
        else
          0
        end
      end
      self.version = values.join('.')
    end

  end

end