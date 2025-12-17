<?php
session_start();
$active = 'conta';
?>
<!DOCTYPE html>
<html lang="pt-PT">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>Global Jerseys - Conta</title>
  <link rel="stylesheet" href="css/style.css" />
  <script src="script.js" defer></script>
</head>
<body>

<?php include __DIR__ . '/includes/header.php'; ?>

<main class="container page">

<?php if (empty($_SESSION['user'])): ?>

  <div class="section-title">
    <h2>Iniciar sessão</h2>
    <p>Introduz os teus dados para entrar na tua conta.</p>
  </div>

  <div class="panel" style="max-width:520px; margin:0 auto;">
    <div class="label">E-mail</div>
    <input id="loginEmail" class="input" type="email" placeholder="email@exemplo.com">

    <div class="label" style="margin-top:10px;">Palavra-passe</div>
    <input id="loginPass" class="input" type="password" placeholder="••••••••">

    <button id="btnLogin" class="btn btn-primary" style="width:100%; margin-top:12px;">Iniciar sessão</button>

    <p class="muted" style="margin:14px 0 0;">
      Ainda não tens conta? <a href="#" id="openRegister" style="font-weight:900; text-decoration:underline;">Cria a tua agora</a>.
    </p>
  </div>

  <div id="registerBox" class="panel" style="max-width:520px; margin:16px auto 0; display:none;">
    <div class="section-title" style="margin:0 0 10px;">
      <h2>Criar conta</h2>
      <p>Preenche as informações para criar a tua conta.</p>
    </div>

    <div class="label">Nome próprio</div>
    <input id="regFn" class="input" type="text" placeholder="Nome">

    <div class="label" style="margin-top:10px;">Apelido</div>
    <input id="regLn" class="input" type="text" placeholder="Apelido">

    <div class="label" style="margin-top:10px;">E-mail</div>
    <input id="regEmail" class="input" type="email" placeholder="email@exemplo.com">

    <div class="label" style="margin-top:10px;">Palavra-passe</div>
    <input id="regPass" class="input" type="password" placeholder="••••••••">

    <button id="btnRegister" class="btn btn-primary" style="width:100%; margin-top:12px;">Criar conta</button>

    <p class="muted" style="margin-top:12px;">
      Já tens conta? <a href="#" id="closeRegister" style="font-weight:900; text-decoration:underline;">Iniciar sessão</a>
    </p>
  </div>

<?php else: ?>

  <?php
    $tab = $_GET['tab'] ?? 'encomendas';
    if (!in_array($tab, ['encomendas','enderecos'], true)) $tab = 'encomendas';
    $fn = $_SESSION['user']['first_name'];
  ?>

  <div class="section-title">
    <h2>A minha conta</h2>
    <p>Olá <strong><?= htmlspecialchars($fn) ?></strong></p>
  </div>

  <div class="account">
    <aside class="menu">
      <a href="conta.php?tab=encomendas" class="<?= $tab==='encomendas'?'active':'' ?>">As minhas encomendas</a>
      <a href="conta.php?tab=enderecos" class="<?= $tab==='enderecos'?'active':'' ?>">Os meus endereços</a>
      <a href="#" id="btnLogout" class="logout">Terminar sessão</a>
    </aside>

    <section class="panel">
      <?php if ($tab==='encomendas'): ?>
        <h3>As minhas encomendas</h3>
        <p class="muted">Aqui aparecem as encomendas confirmadas.</p>
        <div id="ordersBox" class="muted">A carregar…</div>
      <?php else: ?>
        <div style="display:flex; justify-content:space-between; align-items:center; gap:10px;">
          <h3 style="margin:0;">Os meus endereços</h3>
        </div>
        <p class="muted">Guarda a tua morada para agilizar as próximas encomendas.</p>

        <div id="addressSaved" class="panel" style="background:#fafafa; border-style:dashed; margin:12px 0;">
          <strong>Morada guardada</strong>
          <div id="addressPreview" class="muted">Ainda não tens morada guardada.</div>
        </div>

        <div class="form-grid">
          <div class="full">
            <div class="label">Nome do destinatário</div>
            <input id="aFull" class="input" type="text" placeholder="Nome e apelido">
          </div>

          <div>
            <div class="label">Telemóvel</div>
            <input id="aPhone" class="input" type="text" placeholder="9XXXXXXXX">
          </div>

          <div>
            <div class="label">Empresa (opcional)</div>
            <input id="aCompany" class="input" type="text" placeholder="Empresa">
          </div>

          <div class="full">
            <div class="label">Morada 1</div>
            <input id="a1" class="input" type="text" placeholder="Rua, número, andar">
          </div>

          <div class="full">
            <div class="label">Morada 2 (opcional)</div>
            <input id="a2" class="input" type="text" placeholder="Complemento">
          </div>

          <div>
            <div class="label">Cidade</div>
            <input id="aCity" class="input" type="text" placeholder="Cidade">
          </div>

          <div>
            <div class="label">Código postal</div>
            <input id="aPC" class="input" type="text" placeholder="0000-000">
          </div>

          <div class="full">
            <div class="label">País</div>
            <input id="aCountry" class="input" type="text" value="Portugal">
          </div>

          <div class="full">
            <div class="label">Distrito / Província (opcional)</div>
            <input id="aDistrict" class="input" type="text" placeholder="Ex.: Aveiro">
          </div>

          <div class="full" style="display:flex; gap:10px; align-items:center;">
            <input id="aDefault" type="checkbox" checked style="width:18px;height:18px;">
            <label for="aDefault" style="font-weight:800;">Definir como morada padrão</label>
          </div>

          <div class="full">
            <button id="btnSaveAddress" class="btn btn-primary" style="width:100%;">Guardar morada</button>
          </div>
        </div>
      <?php endif; ?>
    </section>
  </div>

<?php endif; ?>

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

document.addEventListener('DOMContentLoaded', async () => {
  const open = document.getElementById('openRegister');
  const close = document.getElementById('closeRegister');
  const box = document.getElementById('registerBox');

  if(open && box){ open.addEventListener('click', (e)=>{e.preventDefault(); box.style.display='block'; window.scrollTo({top: box.offsetTop-90, behavior:'smooth'});}); }
  if(close && box){ close.addEventListener('click', (e)=>{e.preventDefault(); box.style.display='none';}); }

  const btnLogin = document.getElementById('btnLogin');
  if(btnLogin){
    btnLogin.addEventListener('click', async ()=>{
      const email = document.getElementById('loginEmail').value.trim();
      const password = document.getElementById('loginPass').value;
      const out = await api('auth_login',{email,password});
      if(out.ok){ toast('Sessão iniciada com sucesso!'); location.href='conta.php'; }
      else toast(out.msg || 'Erro ao iniciar sessão.');
    });
  }

  const btnRegister = document.getElementById('btnRegister');
  if(btnRegister){
    btnRegister.addEventListener('click', async ()=>{
      const first_name = document.getElementById('regFn').value.trim();
      const last_name = document.getElementById('regLn').value.trim();
      const email = document.getElementById('regEmail').value.trim();
      const password = document.getElementById('regPass').value;
      const out = await api('auth_register',{first_name,last_name,email,password});
      if(out.ok){ toast(out.msg); box.style.display='none'; }
      else toast(out.msg || 'Erro ao criar conta.');
    });
  }

  const btnLogout = document.getElementById('btnLogout');
  if(btnLogout){
    btnLogout.addEventListener('click', async (e)=>{
      e.preventDefault();
      await api('auth_logout',{});
      location.href='index.php';
    });
  }

  // Endereços
  const btnSave = document.getElementById('btnSaveAddress');
  if(btnSave){
    const addr = await api('address_get',{});
    if(addr.ok && addr.address){
      const a = addr.address;
      const prev = document.getElementById('addressPreview');
      if(prev){
        prev.innerHTML = `
          <div><strong>${a.full_name}</strong></div>
          <div>${a.address1}${a.address2 ? ', '+a.address2 : ''}</div>
          <div>${a.postal_code} ${a.city} • ${a.country}</div>
          <div>Tel.: ${a.phone}${a.district ? ' • '+a.district : ''}</div>
        `;
      }
    }

    btnSave.addEventListener('click', async ()=>{
      const payload = {
        full_name: document.getElementById('aFull').value.trim(),
        phone: document.getElementById('aPhone').value.trim(),
        company: document.getElementById('aCompany').value.trim(),
        address1: document.getElementById('a1').value.trim(),
        address2: document.getElementById('a2').value.trim(),
        city: document.getElementById('aCity').value.trim(),
        postal_code: document.getElementById('aPC').value.trim(),
        country: document.getElementById('aCountry').value.trim() || 'Portugal',
        district: document.getElementById('aDistrict').value.trim(),
        is_default: document.getElementById('aDefault').checked
      };
      const out = await api('address_save', payload);
      if(out.ok){
        toast(out.msg);
        const addr2 = await api('address_get',{});
        if(addr2.ok && addr2.address){
          const a = addr2.address;
          document.getElementById('addressPreview').innerHTML = `
            <div><strong>${a.full_name}</strong></div>
            <div>${a.address1}${a.address2 ? ', '+a.address2 : ''}</div>
            <div>${a.postal_code} ${a.city} • ${a.country}</div>
            <div>Tel.: ${a.phone}${a.district ? ' • '+a.district : ''}</div>
          `;
        }
      } else {
        toast(out.msg || 'Erro ao guardar.');
      }
    });
  }

  // Encomendas
  const ordersBox = document.getElementById('ordersBox');
  if(ordersBox){
    const out = await api('orders_list',{});
    if(out.ok && out.orders.length){
      ordersBox.innerHTML = out.orders.map(o=>(
        `<div class="panel" style="margin:10px 0;">
          <strong>Encomenda #${o.id}</strong><br>
          Total: <strong>${parseFloat(o.total).toFixed(2).replace('.',',')}€</strong><br>
          Data: ${o.created_at}
        </div>`
      )).join('');
    } else {
      ordersBox.innerHTML = `
        <div class="muted">Ainda não tens encomendas.</div>
        <p style="margin-top:10px;"><a class="btn btn-primary" href="catalogo.php">Faz a tua primeira encomenda</a></p>
      `;
    }
  }
});
</script>

</body>
</html>
