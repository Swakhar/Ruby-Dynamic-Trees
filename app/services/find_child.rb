class FindChild
  def self.call(children, params_id, list_of_child)
    list_of_child = list_of_child
    children.each do |x|
      if x['id'] == params_id
        list_of_child.push({"id": x['id'], "child": x['child']})
      else
        FindChild.call(x['child'], params_id, list_of_child) if list_of_child.length < 1
      end
    end
    list_of_child
  end
end
