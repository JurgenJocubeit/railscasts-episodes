class VersionsController < ApplicationController
  
  def revert
    @version = Version.find(params[:id])
    
    if @version.item.nil?
      controller_name = @version.item_type.pluralize.downcase
    else
      controller_name = @version.item.type.class_name.pluralize.downcase
    end
    
    if @version.reify
      @version.reify.save!
    else
      @version.item.destroy
    end
    
    link_name = params[:redo] == "true" ? "undo" : "redo"
    link = @template.link_to(link_name, revert_version_path(@version.next, :redo => !params[:redo]), :method => :post)
    flash[:notice] = "Reverted #{@version.event}. #{link}"
    index_url = url_for({:controller => controller_name, :action => "index"})
    
    if @version.event == "create"
      redirect_to index_url
    else
      redirect_back_or(index_url)
    end
  end
end
