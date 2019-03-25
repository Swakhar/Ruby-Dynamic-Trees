class DynamicTreesController < ApplicationController
  before_action :tree
  before_action :param_tree, except: :index

  def index
    render json: @tree
  end

  def show
    render json: @param_tree
  end

  def parent
    parent_ids = [{'id': params[:tree_id], 'parent_id': nil}]
    list_of_parent_ids = FindParent.call(@param_tree['child'], params[:tree_id], params[:id], [])
    list_of_parent_ids.empty? ? [] : parent_ids.push(list_of_parent_ids)
    render json: list_of_parent_ids
  end

  def child
    render json: FindChild.call(@param_tree['child'], params[:id], [])
  end

  private

  def tree
    @tree ||= begin
      url = 'https://random-tree.herokuapp.com/'
      response = Net::HTTP.get_response(URI.parse(url))
      JSON.parse(response.body)
    end
  end

  def param_tree
    @param_tree ||= @tree.select { @tree['id'] == params[:tree_id].to_i }
  end
end
