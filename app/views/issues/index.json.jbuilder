json.issues do
  json.array!(@issues) do |issue|
    json.partial! "issue", issue: issue
  end
end
