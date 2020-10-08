defmodule PortMidi.Nifs.Input do
  @on_load {:init, 0}
  def init do
    :ok =
      :portmidi
      |> :code.priv_dir()
      |> :filename.join("portmidi_in")
      |> :erlang.load_nif(0)
  end

  def do_poll!(_stream), do: :erlang.nif_error(:nif_not_loaded)

  def do_read!(_stream, _buffer_size), do: :erlang.nif_error(:nif_not_loaded)

  def do_open!(_device_name), do: :erlang.nif_error(:nif_not_loaded)

  def do_close!(_stream), do: :erlang.nif_error(:nif_not_loaded)
end
