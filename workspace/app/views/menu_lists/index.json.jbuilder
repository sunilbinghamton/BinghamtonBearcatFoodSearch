json.array!(@menu_lists) do |menu_list|
  json.extract! menu_list, :id
  json.url menu_list_url(menu_list, format: :json)
end
