async function api(action, data = {}) {
  const res = await fetch(`api.php?action=${encodeURIComponent(action)}`, {
    method: "POST",
    headers: { "Content-Type": "application/json" },
    body: JSON.stringify(data)
  });
  return res.json();
}

function toast(msg) {
  const el = document.getElementById("toast");
  if (!el) return;
  el.textContent = msg;
  el.classList.add("show");
  clearTimeout(window.__toastTimer);
  window.__toastTimer = setTimeout(() => el.classList.remove("show"), 1800);
}

async function refreshHeader() {
  const data = await api("header_state");
  const countEl = document.getElementById("cartCount");
  const chipEl = document.getElementById("userChip");

  if (countEl) countEl.textContent = data.cartCount ?? 0;
  if (chipEl) chipEl.textContent = data.userName ? `Olá ${data.userName}` : "";
}

document.addEventListener("click", async (e) => {
  const btn = e.target.closest("[data-add-to-cart]");
  if (!btn) return;

  const card = btn.closest("[data-product]");
  if (!card) return;

  const sizeSel = card.querySelector(".product-size");
  const size = sizeSel ? sizeSel.value : "M";

  const payload = {
    id: card.dataset.id,
    name: card.dataset.name,
    league: card.dataset.league,
    price: parseFloat(card.dataset.price),
    image: card.dataset.image,
    size
  };

  const out = await api("cart_add", payload);
  if (out.ok) {
    toast("Adicionado ao carrinho com sucesso!");
    await refreshHeader();
  }
});

document.addEventListener("DOMContentLoaded", async () => {
  await refreshHeader();
});

(function () {
  const methods = document.getElementById("paymentMethods");
  const mb = document.getElementById("mbwayFields");
  const card = document.getElementById("cardFields");

  if (!methods || !mb || !card) return;

  const mbInputs = mb.querySelectorAll("input");
  const cardInputs = card.querySelectorAll("input");

  function setRequired(list, val) {
    list.forEach(i => {
      if (val) i.setAttribute("required", "required");
      else i.removeAttribute("required");
    });
  }

  function update() {
    const selected = methods.querySelector('input[name="payment_method"]:checked')?.value || "MBWAY";
    const isCard = (selected === "VISA" || selected === "MASTERCARD");

    mb.style.display = isCard ? "none" : "block";
    card.style.display = isCard ? "block" : "none";

    setRequired(mbInputs, !isCard);
    setRequired(cardInputs, isCard);
  }

  methods.addEventListener("change", update);
  update();
})();
