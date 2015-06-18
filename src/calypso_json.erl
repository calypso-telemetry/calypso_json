-module(calypso_json).
-author("Sergey Loguntsov").

%% API
-export([
  encode/1, decode/1,
  to_json/1, from_json/1
]).

encode(Term) ->
  { ok, Opt } = application:get_env(calypso_json, encode_option),
  jsx:encode(Term, Opt).

decode(Binary) ->
  jsx:decode(Binary).

to_json(undefined) -> null;
to_json(Any) -> Any.

from_json(null) -> undefined;
from_json(Any) -> Any.
