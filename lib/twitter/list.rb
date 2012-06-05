require 'twitter/creatable'
require 'twitter/identifiable'
require 'twitter/user'

module Twitter
  class List < Twitter::Identifiable
    include Twitter::Creatable
        attr_reader :description, :following, :full_name, :member_count,
      :mode, :name, :slug, :subscriber_count, :uri
    alias :following? :following

    # @param other [Twitter::List]
    # @return [Boolean]
    def ==(other)
      super || (other.class == self.class && other.id == self.id)
    end

    # @return [Twitter::User]
    def user
      @user ||= Twitter::User.new(@attrs['user']) unless @attrs['user'].nil?
    end

  end
end
