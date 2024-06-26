import { Controller } from "@hotwired/stimulus"
import L from "leaflet"
import * as GeoSearch from "leaflet-geosearch"

export default class extends Controller {
  static targets = ["container", "address", "latitude", "longitude"]
  static values = { readonly: Boolean }

  connect() {
    let defaultLocation = [-3.8022486, -38.53052872]

    if (this.latitudeTarget.value.length > 0 && this.longitudeTarget.value.length > 0) {
      defaultLocation = [this.latitudeTarget.value, this.longitudeTarget.value]
    }

    this.map = L.map(this.containerTarget).setView(defaultLocation, 18);
    const provider = new GeoSearch.OpenStreetMapProvider({
      params: {
        countrycodes: 'BR'
      }
    });

    L.tileLayer('//{s}.tile.openstreetmap.org/{z}/{x}/{y}.png').addTo(this.map);

    if (!this.readonlyValue) {
      const search = new GeoSearch.GeoSearchControl({
        style: 'bar',
        provider: provider,
        marker: {
          draggable: true,
        },
      });

      this.map.addControl(search);

      const searchInput = search.searchElement.input
      searchInput.placeholder = "Digite seu endereço aqui"

      this.map.on('geosearch/showlocation', (event) => {
        let latLng = event.marker.getLatLng()

        this.addressTarget.value = event.location.label
        this.latitudeTarget.value = latLng.lat
        this.longitudeTarget.value = latLng.lng
      });

      this.map.on('geosearch/marker/dragend', (event) => {
        this.latitudeTarget.value = event.location.lat
        this.longitudeTarget.value = event.location.lng
      })

      if (this.addressTarget.value.length > 0) {
        let query = { query: this.addressTarget.value }

        provider.search(query).then((result) => {
          search.showResult(result[0], query)
        });

        search.searchElement.input.value = this.addressTarget.value
      }
    } else {
      L.marker(defaultLocation).addTo(this.map)
    }
  }

  disconnect(){
    this.map.remove()
  }
}
