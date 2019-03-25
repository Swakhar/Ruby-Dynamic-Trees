class FindParent
  def self.call(children, parent_id, params_id, parent_ids)
    parent_ids = parent_ids
    children.each do |x|
      if x['id'] == params_id
        parent_ids.push({'id': x['id'], 'parent_id': parent_id.to_i})
        break
      elsif x['child'].length > 0
        parent_ids.push({'id': x['id'], 'parent_id': parent_id.to_i})
        FindParent.call(x['child'], x['id'], params_id, parent_ids)
      end
    end
    parent_ids.map {|x| x.values_at(:id)}.flatten.include?(params_id) ? parent_ids : []
  end
end
