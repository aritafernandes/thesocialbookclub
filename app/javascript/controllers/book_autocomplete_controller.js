import { Controller } from "@hotwired/stimulus";
import TomSelect from "tom-select";

// Connects to data-controller="search-meeting-book"
export default class extends Controller {
  static targets = ["searchInput"];

  connect() {
    new TomSelect(this.searchInputTarget, {
      valueField: "id",
      searchField: ["author", "title"],
      highlight: true,
      // fetch remote data
      load: function (query, callback) {
        const url = `/books?query=${encodeURIComponent(query)}`;

        fetch(url, { headers: { Accept: "application/json" } })
          .then((response) => response.json())
          .then((json) => {
            console.log(json.items);
            callback(json.items);
          })
          .catch((error) => {
            console.error(error);
            callback();
          });
      },
      // custom rendering functions for options and items
      render: {
        option: function (item, escape) {
          return `<div class="d-flex flex-row align-items-center">
              <img src="${item.image_link}" style="width: 40px" class="me-2" />
              <span class="me-1">${item.title}</span>
              <small>
                <span class="text-muted">
                  ${item.author}
                </span>
              </small>
            </div>`;
        },
        item: function (item, escape) {
          return `<div class="d-flex flex-row align-items-center">
          <img src="${item.image_link}" style="width: 40px" class="me-2" />
          <span class="me-1">${item.title}</span>
          <small>
            <span class="text-muted">
              ${item.author}
            </span>
          </small>
        </div>`;
        },
      },
    });
  }
}
