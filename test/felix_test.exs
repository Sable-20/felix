defmodule FelixTest do
  use ExUnit.Case
  doctest Felix

  test "greets the world" do
    assert Felix.hello() == :world
  end
end
