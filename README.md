# HasheGuard

**TODO: Add description**

## Installation

The package can be installed by adding `hashe_guard` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:hashe_guard, "~> 0.1.0"}
  ]
end
```

# Add to config

```elixir
config :hashe_guard,
  key: "your_site_key",
  domain: "your_side_domain"
```

# Add plug
```elixir
plug HasheGuard
```