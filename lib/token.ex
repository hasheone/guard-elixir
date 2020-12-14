defmodule HasheGuard.Token do
  use Joken.Config

  @impl true
  def token_config do
    domain = Application.get_env(:hashe_guard, :domain)

    default_claims(skip: [:aud], iss: "hashe.one")
    |> add_claim("aud", domain)
  end

  def validate_jwt(token) do
    key = Application.get_env(:hashe_guard, :key)
    signer = Joken.Signer.create("HS256", key)
    verify_and_validate(token, signer)
  end
end
