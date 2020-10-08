defmodule PortMidi.Nifs.Devices do
  @on_load :init
  def init do
    :portmidi
    |> :code.priv_dir()
    |> :filename.join("portmidi_devices")
    |> :erlang.load_nif(0)
  end

  def do_list, do: :erlang.nif_error(:nif_not_loaded)
end
