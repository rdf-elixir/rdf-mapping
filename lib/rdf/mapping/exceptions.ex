defmodule RDF.Mapping.Schema.TypeError do
  @moduledoc """
  Raised when a property value doesn't match the specified type during decoding from RDF.
  """
  defexception [:message, :type, :value]

  def exception(opts) do
    type = Keyword.fetch!(opts, :type)
    value = Keyword.fetch!(opts, :value)
    msg = opts[:message] || "value #{inspect(value)} does not match type #{inspect(type)}"
    %__MODULE__{message: msg, type: type, value: value}
  end
end

defmodule RDF.Mapping.InvalidValueError do
  @moduledoc """
  Raised when an invalid literal is encountered during decoding from RDF.
  """
  defexception [:message, :value]

  def exception(opts) do
    value = Keyword.fetch!(opts, :value)
    msg = opts[:message] || "invalid value: #{inspect(value)}"
    %__MODULE__{message: msg, value: value}
  end
end
