<?php
session_start();
$active = 'catalogo';

$products = [
  // La Liga
  ['id'=>'barcelona-2526','name'=>'Barcelona 25/26','league'=>'La Liga','price'=>49.99,'image'=>'imgs/barcelona.jpg'],
  ['id'=>'atletico-2526','name'=>'Atlético de Madrid 25/26','league'=>'La Liga','price'=>49.99,'image'=>'imgs/atletico.jpg'],
  ['id'=>'real-2526','name'=>'Real Madrid 25/26','league'=>'La Liga','price'=>49.99,'image'=>'imgs/real.jpg'],
  ['id'=>'betis-2526','name'=>'Real Bétis 25/26','league'=>'La Liga','price'=>49.99,'image'=>'imgs/betis.jpg'],

  // Serie A
  ['id'=>'napoles-2526','name'=>'Nápoles 25/26','league'=>'Serie A','price'=>49.99,'image'=>'imgs/napoles.jpg'],
  ['id'=>'milan-2526','name'=>'Milan 25/26','league'=>'Serie A','price'=>49.99,'image'=>'imgs/milan.jpg'],
  ['id'=>'inter-2526','name'=>'Inter de Milão 25/26','league'=>'Serie A','price'=>49.99,'image'=>'imgs/inter.jpg'],
  ['id'=>'juventus-2526','name'=>'Juventus 25/26','league'=>'Serie A','price'=>49.99,'image'=>'imgs/juventus.jpg'],
  ['id'=>'roma-2526','name'=>'Roma 25/26','league'=>'Serie A','price'=>49.99,'image'=>'imgs/roma.jpg'],

  // Liga Portuguesa
  ['id'=>'benfica-2526','name'=>'Benfica 25/26','league'=>'Liga Portuguesa','price'=>49.99,'image'=>'imgs/benfica.jpg'],
  ['id'=>'sporting-2526','name'=>'Sporting 25/26','league'=>'Liga Portuguesa','price'=>49.99,'image'=>'imgs/sporting.jpg'],
  ['id'=>'porto-2526','name'=>'Porto 25/26','league'=>'Liga Portuguesa','price'=>49.99,'image'=>'imgs/porto.jpg'],
  ['id'=>'braga-2526','name'=>'Braga 25/26','league'=>'Liga Portuguesa','price'=>49.99,'image'=>'imgs/braga.jpg'],

  // Bundesliga
  ['id'=>'dortmund-2526','name'=>'Dortmund 25/26','league'=>'Bundesliga','price'=>49.99,'image'=>'imgs/dortmund.jpg'],
  ['id'=>'bayern-2526','name'=>'Bayern de Munique 25/26','league'=>'Bundesliga','price'=>49.99,'image'=>'imgs/bayern.jpg'],
  ['id'=>'leverkusen-2526','name'=>'Bayer Leverkusen 25/26','league'=>'Bundesliga','price'=>49.99,'image'=>'imgs/leverkusen.jpg'],
  ['id'=>'leipzig-2526','name'=>'Leipzig 25/26','league'=>'Bundesliga','price'=>49.99,'image'=>'imgs/leipzig.jpg'],

  // Ligue 1
  ['id'=>'psg-2526','name'=>'PSG 25/26','league'=>'Ligue 1','price'=>49.99,'image'=>'imgs/psg.jpg'],
  ['id'=>'marselha-2526','name'=>'Marselha 25/26','league'=>'Ligue 1','price'=>49.99,'image'=>'imgs/marselha.jpg'],
  ['id'=>'monaco-2526','name'=>'Mónaco 25/26','league'=>'Ligue 1','price'=>49.99,'image'=>'imgs/monaco.jpg'],
  ['id'=>'lyon-2526','name'=>'Lyon 25/26','league'=>'Ligue 1','price'=>49.99,'image'=>'imgs/lyon.jpg'],

  // Premier League
  ['id'=>'city-2526','name'=>'Manchester City 25/26','league'=>'Premier League','price'=>54.99,'image'=>'imgs/city.jpg'],
  ['id'=>'manunited-2526','name'=>'Manchester United 25/26','league'=>'Premier League','price'=>54.99,'image'=>'imgs/manunited.jpg'],
  ['id'=>'chelsea-2526','name'=>'Chelsea 25/26','league'=>'Premier League','price'=>49.99,'image'=>'imgs/chelsea.jpg'],
  ['id'=>'arsenal-2526','name'=>'Arsenal 25/26','league'=>'Premier League','price'=>49.99,'image'=>'imgs/arsenal.jpg'],
  ['id'=>'liverpool-2526','name'=>'Liverpool 25/26','league'=>'Premier League','price'=>49.99,'image'=>'imgs/liverpool.jpg'],
  ['id'=>'tottenham-2526','name'=>'Tottenham 25/26','league'=>'Premier League','price'=>49.99,'image'=>'imgs/tottenham.jpg'],
];

$leagues = ['Todas as ligas','La Liga','Liga Portuguesa','Premier League','Ligue 1','Serie A','Bundesliga'];
?>
<!DOCTYPE html>
<html lang="pt-PT">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>Global Jerseys - Catálogo</title>
  <link rel="stylesheet" href="css/style.css" />
  <script src="script.js" defer></script>
</head>
<body>

<?php include __DIR__ . '/includes/header.php'; ?>

<main class="container page">
  <div class="section-title">
    <h2>Catálogo completo</h2>
    <p>Procura por clube ou filtra por liga e adiciona as tuas camisolas ao carrinho.</p>
  </div>

  <div class="tools">
    <input id="searchInput" class="search" type="search" placeholder="Pesquisar camisola..." />
    <select id="leagueSelect" class="select" style="max-width:260px">
      <?php foreach($leagues as $l): ?>
        <option value="<?= htmlspecialchars($l) ?>"><?= htmlspecialchars($l) ?></option>
      <?php endforeach; ?>
    </select>
  </div>

  <section id="catalogGrid" class="grid">
    <?php foreach($products as $p): ?>
      <article class="card"
        data-product
        data-id="<?= htmlspecialchars($p['id']) ?>"
        data-name="<?= htmlspecialchars($p['name']) ?>"
        data-league="<?= htmlspecialchars($p['league']) ?>"
        data-price="<?= number_format($p['price'],2,'.','') ?>"
        data-image="<?= htmlspecialchars($p['image']) ?>"
      >
        <div class="card-media">
          <img src="<?= htmlspecialchars($p['image']) ?>" alt="<?= htmlspecialchars($p['name']) ?>">
        </div>
        <div class="card-body">
          <h3 class="card-title"><?= htmlspecialchars($p['name']) ?></h3>
          <div class="card-meta">
            <span class="price"><?= number_format($p['price'],2,',','.') ?>€</span>
            <span><?= htmlspecialchars($p['league']) ?></span>
          </div>

          <div class="controls">
            <select class="select product-size" aria-label="Tamanho">
              <option value="S">S</option>
              <option value="M" selected>M</option>
              <option value="L">L</option>
              <option value="XL">XL</option>
            </select>
            <button class="btn btn-primary" type="button" data-add-to-cart>Adicionar ao carrinho</button>
          </div>
        </div>
      </article>
    <?php endforeach; ?>
  </section>
</main>

<?php include __DIR__ . '/includes/footer.php'; ?>

<script>
// filtro/pesquisa 
const searchInput = document.getElementById('searchInput');
const leagueSelect = document.getElementById('leagueSelect');
const cards = Array.from(document.querySelectorAll('[data-product]'));

function applyFilters(){
  const q = (searchInput.value || '').toLowerCase().trim();
  const league = leagueSelect.value;

  cards.forEach(c => {
    const name = (c.dataset.name || '').toLowerCase();
    const l = c.dataset.league || '';
    const okQ = !q || name.includes(q);
    const okL = (league === 'Todas as ligas') || (l === league);
    c.style.display = (okQ && okL) ? '' : 'none';
  });
}
searchInput.addEventListener('input', applyFilters);
leagueSelect.addEventListener('change', applyFilters);
</script>

</body>
</html>
