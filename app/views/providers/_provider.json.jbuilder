json.id provider.id.to_s
json.name provider.name
json.slug provider._slugs.first
json.uri provider_url(provider.to_param)