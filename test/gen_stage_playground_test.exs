defmodule GenStagePlaygroundTest do
  use ExUnit.Case
  doctest GenStagePlayground

  test "greets the world" do
    assert GenStagePlayground.hello() == :world
  end
end
