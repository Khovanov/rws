module StiCarriagesHelper
  
  def sti_carriage_helper_path(type = "carriage", carriage = nil, action = nil)
    send "#{format_sti(action, type, carriage)}_path", carriage
  end

  def format_sti(action, type, carriage)
    # action || carriage ? "#{format_action(action)}#{type.underscore}" : "#{type.underscore.pluralize}"
    action || carriage ? "#{format_action(action)}sti_#{type.underscore}" : "sti_#{type.underscore.pluralize}"
  end

  def format_action(action)
    action ? "#{action}_" : ""
  end

end
