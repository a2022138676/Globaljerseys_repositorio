<?php
session_start();
$active = 'pedidos';
?>
<!DOCTYPE html>
<html lang="pt-PT">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>Global Jerseys - Pedidos</title>
  <link rel="stylesheet" href="css/style.css" />
  <script src="script.js" defer></script>
</head>
<body>

<?php include __DIR__ . '/includes/header.php'; ?>

<main class="container page">
  <div class="section-title">
    <h2>Finalizar encomenda</h2>
    <p>Confirma o carrinho, os dados de entrega e escolhe o método de pagamento.</p>
  </div>

  <div class="checkout">

    <section class="panel">
      <h3>O teu carrinho</h3>
      <div id="cartBox" class="muted">A carregar…</div>

      <div class="hr"></div>

      <div class="total-line"><span>Subtotal</span><span id="subt">0,00€</span></div>
      <div class="total-line"><span>Portes</span><span id="ship">0,00€</span></div>
      <div class="total-line"><strong>Total</strong><strong id="tot">0,00€</strong></div>

      <button id="btnClear" class="btn btn-outline" style="width:100%; margin-top:12px;">Limpar carrinho</button>
    </section>

    <section class="panel">
      <h3>Entrega</h3>
      <p class="muted">Se tiveres conta e uma morada guardada, os dados serão preenchidos automaticamente.</p>

      <div class="form-grid" id="deliveryForm">
        <div class="full">
          <div class="label">E-mail</div>
          <input id="gEmail" class="input" type="email" placeholder="email@exemplo.com">
        </div>
        <div class="full">
          <div class="label">Nome completo</div>
          <input id="gName" class="input" type="text" placeholder="Nome e apelido">
        </div>

        <div>
          <div class="label">Telemóvel</div>
          <input id="gPhone" class="input" type="text" placeholder="9XXXXXXXX">
        </div>
        <div>
          <div class="label">Código postal</div>
          <input id="gPC" class="input" type="text" placeholder="0000-000">
        </div>

        <div class="full">
          <div class="label">Morada 1</div>
          <input id="gA1" class="input" type="text" placeholder="Rua, número, andar">
        </div>
        <div class="full">
          <div class="label">Morada 2 (opcional)</div>
          <input id="gA2" class="input" type="text" placeholder="Complemento">
        </div>

        <div>
          <div class="label">Cidade</div>
          <input id="gCity" class="input" type="text" placeholder="Cidade">
        </div>

        <div>
          <div class="label">País</div>
          <input id="gCountry" class="input" type="text" value="Portugal">
        </div>

        <div class="full">
          <div class="label">Distrito / Província (opcional)</div>
          <input id="gDistrict" class="input" type="text" placeholder="Ex.: Aveiro">
        </div>
      </div>

      <div class="hr"></div>

      <h3>Pagamento</h3>

      <div class="radio-row">
        <label class="radio-card">
          <span class="radio-left">
            <input type="radio" name="pay" value="MBWAY" checked>
            MB WAY
          </span>
          <img src="imgs/mbway.png" alt="MBWay" onerror="this.style.display='none'">
        </label>

        <label class="radio-card">
          <span class="radio-left">
            <input type="radio" name="pay" value="VISA">
            Visa
          </span>
          <img src="imgs/visa.png" alt="Visa" onerror="this.style.display='none'">
        </label>

        <label class="radio-card">
          <span class="radio-left">
            <input type="radio" name="pay" value="MASTERCARD">
            Mastercard
          </span>
          <img src="imgs/mastercard.png" alt="Mastercard" onerror="this.style.display='none'">
        </label>
      </div>

      <div class="label" style="margin-top:12px;">Referência / Número</div>
      <input id="payRef" class="input" type="text" placeholder="Ex.: MB WAY 9XXXXXXXX ou nº do cartão">

      <button id="btnCheckout" class="btn btn-primary" style="width:100%; margin-top:12px;">Confirmar encomenda</button>

      <p class="muted" style="margin:10px 0 0;">
        Ao confirmar, concordas com os <a href="termos.php" style="font-weight:900; text-decoration:underline;">Termos e Condições</a>.
      </p>
    </section>

  </div>
</main>

<?php include __DIR__ . '/includes/footer.php'; ?>

<script>
async function api(action, data={}) {
  const r = await fetch(`api.php?action=${encodeURIComponent(action)}`,{
    method:'POST', headers:{'Content-Type':'application/json'},
    body: JSON.stringify(data)
  });
  return r.json();
}
function toast(msg){
  const el=document.getElementById('toast'); if(!el) return;
  el.textContent=msg; el.classList.add('show');
  clearTimeout(window.__t); window.__t=setTimeout(()=>el.classList.remove('show'),1800);
}

function money(n){ return (n||0).toFixed(2).replace('.',',')+'€'; }

async function loadCart(){
  const out = await api('cart_get',{});
  const box = document.getElementById('cartBox');
  if(!out.ok){ box.textContent='Erro a carregar.'; return; }

  const items = out.items || [];
  if(!items.length){
    box.innerHTML = `O carrinho está vazio. Vai ao <a href="catalogo.php" style="text-decoration:underline; font-weight:900;">catálogo</a>.`;
    document.getElementById('subt').textContent = money(0);
    document.getElementById('ship').textContent = money(0);
    document.getElementById('tot').textContent  = money(0);
    return;
  }

  // reconstruir do session (preciso de key = id|size)
  const sessionItems = <?= json_encode($_SESSION['cart'] ?? [], JSON_UNESCAPED_UNICODE) ?>;

  let subtotal = 0;
  const rows = [];
  for (const key in sessionItems){
    const it = sessionItems[key];
    subtotal += (parseFloat(it.price)*parseInt(it.qty));
    rows.push(`
      <div class="cart-row">
        <div class="cart-thumb"><img src="${it.image}" alt=""></div>
        <div>
          <strong>${it.name}</strong><br>
          <span class="muted">${it.league} • Tamanho ${it.size}</span><br>
          <span class="muted">${money(parseFloat(it.price))}</span>
        </div>
        <div class="qty">
          <button data-dec="${key}">−</button>
          <strong>${it.qty}</strong>
          <button data-inc="${key}">+</button>
        </div>
      </div>
    `);
  }

  box.innerHTML = rows.join('');
  const ship = subtotal > 0 ? 4.99 : 0;
  const total = subtotal + ship;

  document.getElementById('subt').textContent = money(subtotal);
  document.getElementById('ship').textContent = money(ship);
  document.getElementById('tot').textContent  = money(total);

  box.querySelectorAll('[data-inc]').forEach(b=>{
    b.addEventListener('click', async ()=>{
      const k=b.dataset.inc;
      const cur=sessionItems[k].qty;
      await api('cart_set_qty',{key:k, qty: cur+1});
      location.reload();
    });
  });
  box.querySelectorAll('[data-dec]').forEach(b=>{
    b.addEventListener('click', async ()=>{
      const k=b.dataset.dec;
      const cur=sessionItems[k].qty;
      await api('cart_set_qty',{key:k, qty: cur-1});
      location.reload();
    });
  });
}

async function prefillIfAccount(){
  const addr = await api('address_get',{});
  if(addr.ok && addr.address){
    const a = addr.address;
    // Se tem conta, não obriga preencher: mas pode mostrar preenchido
    document.getElementById('gEmail').value = '<?= htmlspecialchars($_SESSION['user']['email'] ?? '') ?>';
    document.getElementById('gName').value = a.full_name;
    document.getElementById('gPhone').value = a.phone;
    document.getElementById('gA1').value = a.address1;
    document.getElementById('gA2').value = a.address2 || '';
    document.getElementById('gCity').value = a.city;
    document.getElementById('gPC').value = a.postal_code;
    document.getElementById('gCountry').value = a.country;
    document.getElementById('gDistrict').value = a.district || '';
  }
}

document.addEventListener('DOMContentLoaded', async ()=>{
  await loadCart();
  await prefillIfAccount();

  document.getElementById('btnClear').addEventListener('click', async ()=>{
    await api('cart_clear',{});
    toast('Carrinho limpo.');
    setTimeout(()=>location.reload(), 300);
  });

  document.getElementById('btnCheckout').addEventListener('click', async ()=>{
    const payment_method = document.querySelector('input[name="pay"]:checked').value;
    const payment_ref = document.getElementById('payRef').value.trim();

    const guest = {
      email: document.getElementById('gEmail').value.trim(),
      full_name: document.getElementById('gName').value.trim(),
      phone: document.getElementById('gPhone').value.trim(),
      address1: document.getElementById('gA1').value.trim(),
      address2: document.getElementById('gA2').value.trim(),
      city: document.getElementById('gCity').value.trim(),
      postal_code: document.getElementById('gPC').value.trim(),
      country: document.getElementById('gCountry').value.trim() || 'Portugal',
      district: document.getElementById('gDistrict').value.trim()
    };

    const out = await api('checkout',{payment_method, payment_ref, guest});
    if(out.ok){
      toast(out.msg);
      setTimeout(()=>location.href='conta.php?tab=encomendas', 700);
    }else{
      toast(out.msg || 'Erro ao confirmar.');
    }
  });
});
</script>

</body>
</html>
