json.partial! partial: 'providers/provider',
              collection: providers = providers.presence || @providers,
              as: :provider