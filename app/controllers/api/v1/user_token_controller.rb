class Api::V1::UserTokenController < Knock::AuthTokenController
  def entity_name
    # needed because knock uses User by default (based on what preceeds TokenController)
    # since it's namespaced to Api::V1, we need to specify `entity_name`
    'User'
  end
end
