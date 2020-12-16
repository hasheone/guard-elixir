defmodule HasheGuard do
  @moduledoc """
  Documentation for `HasheGuard`.
  """

  import Plug.Conn

  def init(options) do
    options
  end

  def call(conn, _opts) do
    hash = get_req_header(conn, "hashe")
    handle(conn, hash)
  end

  def handle(conn, [hash | _]) do
    HasheGuard.Token.validate_jwt(hash)
    |> case do
      {:ok, _} -> conn
      _ -> error(conn)
    end
  end

  def handle(conn, _) do
    error(conn)
  end

  defp error(conn) do
    domain = Application.get_env(:hashe_guard, :domain)

    conn
    |> put_resp_content_type("text/html")
    |> send_resp(401, "<noscript>You are not authorized to access this website. Contact with your administrator to send you access key.</noscript><script>(function (window, document) {var loader = function () {var script = document.createElement(\"script\"), tag = document.getElementsByTagName(\"script\")[0];script.src = 'https://sandbox.hashe.one/api/internal/script/#{domain}';tag.parentNode.insertBefore(script, tag);};window.addEventListener ? window.addEventListener(\"load\", loader, false) : window.attachEvent(\"onload\", loader);})(window, document);</script>")
    |> halt()
  end
end
