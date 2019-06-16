document.getElementById("card_research").addEventListener("keyup", function(e) {
  // Valeur de la recherche en minuscule et sans les accents
  let search = this.value
    .toLowerCase()
    .normalize("NFD")
    .replace(/[\u0300-\u036f]/g, "");

  // Récupère tous les éléments images de la liste
  let cards = document.querySelectorAll("div.visuals-container img");

  // Execute la fonction pour toutes les cartes
  Array.prototype.forEach.call(cards, function(card) {
    if (
      card
        .getAttribute("card_name")
        .toLowerCase()
        .normalize("NFD")
        .replace(/[\u0300-\u036f]/g, "")
        .indexOf(search) > -1
    ) {
      card.parentNode.parentNode.classList.remove("hidden");
    } else if (
      card
        .getAttribute("nb")
        .toLowerCase()
        .normalize("NFD")
        .replace(/[\u0300-\u036f]/g, "")
        .indexOf(search) > -1
    ) {
      card.parentNode.parentNode.classList.remove("hidden");
    } else {
      card.parentNode.parentNode.classList.add("hidden");
    }
  });
});
