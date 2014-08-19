Exauth
======

Elixir wrapper around the [Erlang OAuth](https://github.com/tim/erlang-oauth) library.

This gem is a duplicate of [Oauthex](https://github.com/marcelog/oauthex) with the difference that is adds a bit cleaner configuration possibility (using ETS) and it doesn't provide http endpoints. This project is only intended to sign requests to use with ones favorite HTTP library.

## Usage

Currenlty this library only supports signing of request for which a consumer key, consumer secret, token and token secret is already known.

Sign a request:
```elixir
  Exauth.sign(method, url) # or
  Exauth.sign(method, url, params)
```

If you are looking to construct Auth headers, a method is already provided:
```elixir
  Exauth.sign_header(method, url) #or
  Exauth.sign_header(method, url, params)
```

The latter will return the `OAuth ...` header that has to be used as the value of the `Authorization` header key.
