defmodule Validation do
  def uri(_field, value) do
    case URI.parse(value) do
      %URI{scheme: nil} -> [scheme: "cannot be blank"]
      %URI{host: nil} -> [host: "cannot be blank"]
      %URI{path: nil} -> [path: "cannot be blank"]
      _ -> []
    end
  end
end
