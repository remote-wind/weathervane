Jbuilder.encode do |json|

  json.array! @providers, partial: 'providers/provider', as: :provider

end