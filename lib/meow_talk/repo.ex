defmodule MeowTalk.Repo do
  use Ecto.Repo,
    otp_app: :meow_talk,
    adapter: Ecto.Adapters.MyXQL
end
