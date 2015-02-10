module FormattedForm
  class Railtie < ::Rails::Railtie
    initializer "formatted_form.configure_view_controller" do |app|
      ActiveSupport.on_load :action_view do
        include FormattedForm
      end
    end
  end
end
