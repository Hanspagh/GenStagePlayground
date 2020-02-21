defmodule GenStagePlayground.Booking do

    alias GenStagePlayground.Booking

  defstruct [:to, :from, :container_type, :container_size, :amount, :booking_id, :ts]


  def string_to_booking(string) do
    items = String.trim(string)
    |> String.split(",") |> Enum.map(&String.trim/1)
    %Booking{
      to: Enum.at(items, 0),
      from: Enum.at(items, 1),
      container_type: Enum.at(items, 2),
      container_size: Enum.at(items, 3),
      amount: Enum.at(items, 4),
      booking_id: Enum.at(items, 5),
      ts: Enum.at(items, 6) |> String.to_integer()
    }
  end
end
