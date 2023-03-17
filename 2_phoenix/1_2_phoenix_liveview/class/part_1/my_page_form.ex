defmodule Deel1Web.MyPageForm do
  use Phoenix.LiveView

  def mount(_params, _session, socket) do
    socket =
      socket
      |> assign(:airport_code, "")
      |> assign(:airports, [])

    {:ok, socket}
  end

  def render(assigns) do
    ~H"""
    <form phx-submit="airport_code_search">
      <fieldset>
        <label for="nameField">Airport Code</label>
        <input type="text" name="airport_code" value="{airport_code}"
        placeholder="e.g. FRA"
        autofocus autocomplete="off" />
        <input class="button-primary" type="submit" value="Search Airport">
      </fieldset>
    </form>

    <%= unless @airports == [] do %>
      <h2>Search Results</h2>
        <table>
          <thead>
            <tr>
              <th>Airport Code</th>
            <th>Name</th>
            </tr>
          </thead>
          <tbody>
            <%= for airport <- @airports do %>
              <tr>
                <td><%= airport.code %></td>
                <td><%= airport.name %></td>
               </tr>
            <% end %>
          </tbody>
        </table>
    <% end %>
    """
  end

  def handle_event(
        "airport_code_search",
        %{"airport_code" => airport_code},
        socket
      ) do
    airport_code = String.upcase(airport_code)

    socket =
      socket
      |> assign(:airport_code, airport_code)
      |> assign(:airports, search_by_code(airport_code))

    {:noreply, socket}
  end

  defp search_by_code(""), do: []

  defp search_by_code(code) do
    list_airports()
    |> Enum.filter(&String.starts_with?(&1.code, code))
  end

  defp list_airports do
    [
      %{name: "Berlin Brandenburg", code: "BER"},
      %{name: "Berlin Schönefeld", code: "SXF"},
      %{name: "Berlin Tegel", code: "TXL"},
      %{name: "Bremen", code: "BRE"},
      %{name: "Köln/Bonn", code: "CGN"},
      %{name: "Dortmund", code: "DTM"},
      %{name: "Dresden", code: "DRS"},
      %{name: "Düsseldorf", code: "DUS"},
      %{name: "Frankfurt", code: "FRA"},
      %{name: "Frankfurt-Hahn", code: "HHN"},
      %{name: "Hamburg", code: "HAM"},
      %{name: "Hannover", code: "HAJ"},
      %{name: "Leipzig Halle", code: "LEJ"},
      %{name: "München", code: "MUC"},
      %{name: "Münster Osnabrück", code: "FMO"},
      %{name: "Nürnberg", code: "NUE"},
      %{name: "Paderborn Lippstadt", code: "PAD"},
      %{name: "Stuttgart", code: "STR"}
    ]
  end


end
