module Polar
  BASE_URL = "http://api.renren.com/restserver.do"
  VERSION = [0, 0, 7]

  def self.version
    VERSION * "."
  end
end
