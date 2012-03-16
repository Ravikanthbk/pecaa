module SitesHelper
  def link_to_remove_fields(name, f)
    f.hidden_field(:_destroy) + link_to(name, "#", :class=>"remove_fields")
  end
  
  def link_to_add_fields(name, f, association)
      new_object = f.object.class.reflect_on_association(association).klass.new
      fields = f.fields_for(association, [new_object], :child_index => "new_#{association}") do |builder|
        render(association.to_s.singularize + "_fields", :f => builder)
      end
      button_to_function('', ("add_fields(this, \"#{association}\", \"#{escape_javascript(fields)}\")"), :class=>"btnAddContact")
    end

  # def link_to_add_fields(name, f, association)
  #     new_object = f.object.class.reflect_on_association(association).klass.new
  #     fields = f.fields_for(association, [new_object], :index => "new_#{association}") do |builder|
  #       render(association.to_s.singularize + "_fields", :f => f, :poll_answer => new_object)
  #     end
  #     #     button_to_function('', ("add_fields(this, \"#{association}\", \"#{escape_javascript(fields)}\")"), :class=>"btnAddContact")
  # 
  #   end
  # 
  
  # def link_to_add_fields(name, f, association)
  #     new_object = f.object.class.reflect_on_association(association).klass.new
  #       fields = f.fields_for(association, :child_index => "new") do |builder|
  #               render(association.to_s.singularize + "_fields", :f => builder)
  #     end
  #     button_to_function('', ("add_fields(this, \"#{association}\", \"#{escape_javascript(fields)}\")"), :class=>"btnAddContact")
  #   end
  #   
end