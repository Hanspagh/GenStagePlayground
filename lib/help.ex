defmodule GenStagePlayground.Help do

    alias GenStagePlayground.Booking

    # Example of a Fixed window with a print
    def fixed_window_example(flow, milis \\1) do
      window = Flow.Window.fixed(milis, :millisecond, fn %Booking{ts: ts} -> ts end)
      flow
      |> Flow.partition(window: window, stages: 1)
      |> Flow.reduce(fn -> 0 end, fn _booking, acc ->
        acc + 1
      end)
      |> Flow.on_trigger(fn state, _index, {:fixed, ts, :done} ->
        IO.inspect(" Number of bookings #{state} for ts #{ts}")
        {[], state} end)
      |> Flow.start_link()
    end


    @doc """
    Exmaple of running a slow process in many different stages
    """
    def spead_slow_tasks_on_many_stages() do
      GenStagePlayground.flow("sample.data", stages: 500, max_demand: 1)
      |>
      Flow.map(fn %Booking{booking_id: id} ->
        GenStagePlayground.CustomerRegisterService.get_owner(id, 1000)
      end)
    end

end
