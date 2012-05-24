#require 'open-uri'
#require 'net/https'
#
#module Net
#  class HTTP
#    alias_method :original_use_ssl=, :use_ssl=
#    alias_method :original_ca_file=, :ca_file=
#
#    def use_ssl=(flag)
#      self.ca_file = Rails.root.join('lib/cert.pem').to_s
#      self.verify_mode = OpenSSL::SSL::VERIFY_PEER
#      self.original_use_ssl = flag
#    end
#
#    def ca_file=(flag)
#      self.original_ca_file = Rails.root.join('lib/cert.pem').to_s
#    end
#
#  end
#end