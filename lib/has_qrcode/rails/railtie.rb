module HasQrcode
  class Railtie < Rails::Railtie
    initializer "load qrcode modules" do
      HasQrcode::Hooks.init
      AWS.config(:logger => Rails.logger) if defined?(AWS) and AWS.respond_to?(:config)
    end
    
    rake_tasks do
      load "has_qrcode/rails/qrcode.rake"
    end
  end
end
