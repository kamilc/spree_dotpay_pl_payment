require 'spree_core'
require 'spree_dotpay_pl_payment_hooks'

module SpreeDotpayPlPayment
  class Engine < Rails::Engine

    config.autoload_paths += %W(#{config.root}/lib)

    def self.activate
      Dir.glob(File.join(File.dirname(__FILE__), "../app/**/*_decorator*.rb")) do |c|
        Rails.env.production? ? require(c) : load(c)
      end
#     debugger
      Rails.application.config.spree.payment_methods.push(PaymentMethod::DotpayPl)
      
    end

    config.to_prepare &method(:activate).to_proc
  end
end
