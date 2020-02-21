defmodule GenStagePlayground.Data do
  @alphabet Enum.to_list(?a..?z)
  @container_type ~w(dry reef)
  @container_size ~w(20 40)

  def get_stream(limit) do
    Stream.resource(fn -> 0 end, fn num -> generate_with_stream(num, limit) end, fn(a) -> a end)
  end

  def generate_with_stream(num, limit) do
    case limit do
      -1 -> {[random_booking()], num+1}
      limit when limit > num -> {[random_booking()], num+1}
      _ -> {:halt, random_booking()}
    end
  end

  def to_file(stream, name \\ "data.data") do
    path = Path.join(:code.priv_dir(:gen_stage_playground), name)
    stream
    |> Stream.map(&(&1 <> "\n"))
    |> Stream.into(File.stream!(path, [:write, :utf8]))
    |> Stream.run()
  end


  def generate_with_flow(num) do
    1..num
    |> Flow.from_enumerable()
    |> Flow.map(fn _ -> random_booking() end)
  end

  def random_booking() do
    to = Faker.Address.country()
    from = Faker.Address.country()
    type = Enum.take_random(@container_type, 1)
    size = Enum.take_random(@container_size, 1)
    amount = :rand.uniform(500)
    booking_id = random_string(6)
    ts = DateTime.utc_now() |> DateTime.to_unix()

    "#{from}, #{to}, #{type}, #{size}, #{amount}, #{booking_id}, #{ts}"
  end

  def random_string(size) do
    Enum.take_random(@alphabet, size) |> to_string()
  end

end
