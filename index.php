<?php
session_start();
$active = 'inicio';
?>
<!DOCTYPE html>
<html lang="pt-PT">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>Global Jerseys - Início</title>
  <link rel="stylesheet" href="css/style.css" />
  <script src="script.js" defer></script>
</head>
<body>

<?php include __DIR__ . '/includes/header.php'; ?>

<main class="container">

  <section class="hero">
    <div class="hero-inner">
      <img src="imgs/relvado.jpg" alt="Relvado" />
      <div class="hero-content">
        <h1 class="hero-title">Leva 3 camisolas pelo preço de 2</h1>
        <p class="hero-text">Camisolas 25/26 com envio rápido e checkout simples.</p>
        <a class="hero-cta" href="catalogo.php">Ver catálogo</a>
      </div>
    </div>
  </section>

  <div class="section-title">
    <h2>Camisolas em destaque</h2>
    <p>Novas épocas 25/26 • Stock limitado</p>
  </div>

  <section class="grid">

    <article class="card" data-product data-id="benfica-2526" data-league="Liga Portuguesa"
      data-name="Benfica 25/26" data-price="39.99" data-image="imgs/benfica.jpg">
      <div class="card-media"><img src="imgs/benfica.jpg" alt="Benfica 25/26"></div>
      <div class="card-body">
        <h3 class="card-title">Benfica 25/26</h3>
        <div class="card-meta"><span class="price">39,99€</span><span>Home</span></div>
        <div class="controls">
          <select class="select product-size" aria-label="Tamanho">
            <option value="S">S</option><option value="M" selected>M</option><option value="L">L</option><option value="XL">XL</option>
          </select>
          <button class="btn btn-primary" type="button" data-add-to-cart>Adicionar ao carrinho</button>
        </div>
      </div>
    </article>

    <article class="card" data-product data-id="barcelona-2526" data-league="La Liga"
      data-name="Barcelona 25/26" data-price="39.99" data-image="imgs/barcelona.jpg">
      <div class="card-media"><img src="imgs/barcelona.jpg" alt="Barcelona 25/26"></div>
      <div class="card-body">
        <h3 class="card-title">Barcelona 25/26</h3>
        <div class="card-meta"><span class="price">39,99€</span><span>Home</span></div>
        <div class="controls">
          <select class="select product-size" aria-label="Tamanho">
            <option value="S">S</option><option value="M" selected>M</option><option value="L">L</option><option value="XL">XL</option>
          </select>
          <button class="btn btn-primary" type="button" data-add-to-cart>Adicionar ao carrinho</button>
        </div>
      </div>
    </article>

    <article class="card" data-product data-id="city-2526" data-league="Premier League"
      data-name="Manchester City 25/26" data-price="39.99" data-image="imgs/city.jpg">
      <div class="card-media"><img src="imgs/city.jpg" alt="Manchester City 25/26"></div>
      <div class="card-body">
        <h3 class="card-title">Manchester City 25/26</h3>
        <div class="card-meta"><span class="price">39,99€</span><span>Home</span></div>
        <div class="controls">
          <select class="select product-size" aria-label="Tamanho">
            <option value="S">S</option><option value="M" selected>M</option><option value="L">L</option><option value="XL">XL</option>
          </select>
          <button class="btn btn-primary" type="button" data-add-to-cart>Adicionar ao carrinho</button>
        </div>
      </div>
    </article>

    <article class="card" data-product data-id="liverpool-2526" data-league="Premier League"
      data-name="Liverpool 25/26" data-price="39.99" data-image="imgs/liverpool.jpg">
      <div class="card-media"><img src="imgs/liverpool.jpg" alt="Liverpool 25/26"></div>
      <div class="card-body">
        <h3 class="card-title">Liverpool 25/26</h3>
        <div class="card-meta"><span class="price">39,99€</span><span>Home</span></div>
        <div class="controls">
          <select class="select product-size" aria-label="Tamanho">
            <option value="S">S</option><option value="M" selected>M</option><option value="L">L</option><option value="XL">XL</option>
          </select>
          <button class="btn btn-primary" type="button" data-add-to-cart>Adicionar ao carrinho</button>
        </div>
      </div>
    </article>

  </section>

</main>

<?php include __DIR__ . '/includes/footer.php'; ?>

</body>
</html>
