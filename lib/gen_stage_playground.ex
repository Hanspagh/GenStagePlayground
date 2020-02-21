defmodule GenStagePlayground do

  alias GenStagePlayground.Booking

  @doc """
  Make a flow from a data file
  """
  def flow(datasouce \\ "sample.data", options \\ []) do
    path = Path.join(:code.priv_dir(:gen_stage_playground), datasouce)
    File.stream!(path, read_ahead: 100_000)
    |> Flow.from_enumerable(options)
    |> Flow.map(&Booking.string_to_booking/1)
  end


  @doc """
  Make a flow from a endless stream of booking data
  The STream hhould preferably be made into a GenStage producer
  """
  def flow_from_endless_stream(options \\ []) do
    GenStagePlayground.Data.get_stream(-1)
    |> Flow.from_enumerable(options)
    |> Flow.map(&Booking.string_to_booking/1)
  end



end
