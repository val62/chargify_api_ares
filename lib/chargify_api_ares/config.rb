module Chargify
  class << self
    attr_accessor :subdomain, :api_key, :site, :format, :timeout, :shared_key

    def configure
      yield self

      Base.user      = api_key
      Base.password  = 'X'
      Base.timeout   = timeout unless (timeout.blank?)
      
      self.site ||= "https://#{subdomain}.chargify.com"
      Base.site = site
    end
  end
end
