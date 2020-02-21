defmodule GenStagePlayground.CustomerRegisterService do

  @ownermap %{ "a" => "Armani",
  "b" => "Bradly",
  "c" => "Carolina",
  "d" => "Danika",
  "e" => "Earl",
  "f" => "Fredy",
  "g" => "Guy",
  "h" => "Herminia",
  "i" => "Isaias",
  "j" => "Jimmie",
  "k" => "Kip",
  "l" => "Lillian",
  "m" => "Michaela",
  "n" => "Newell",
  "o" => "Ottis",
  "p" => "Pinkie",
  "q" => "Queen",
  "r" => "Rose",
  "s" => "Selmer",
  "t" => "Tyler",
  "u" => "Ulices",
  "v" => "Verda",
  "w" => "Waylon",
  "x" => "Xzavier",
  "y" => "Yesenia",
  "z" => "Zackery"
}


@doc """
Get a customer from a booking id
if latency above 0 is passed in we memic a slow task to eg. an api
"""
@spec get_owner(binary, :infinity | non_neg_integer) :: binary
def get_owner(booking_id, latency \\ 0) do
    first = String.slice(booking_id, 0,1)
    Process.sleep(latency)
    @ownermap[first]
  end

end
