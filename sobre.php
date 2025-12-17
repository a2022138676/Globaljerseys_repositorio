<?php
session_start();
$active = 'sobre';
?>
<!DOCTYPE html>
<html lang="pt-PT">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>Global Jerseys - Sobre</title>
  <link rel="stylesheet" href="css/style.css" />
  <script src="script.js" defer></script>
</head>
<body>

<?php include __DIR__ . '/includes/header.php'; ?>

<main class="container page">
  <div class="section-title">
    <h2>Sobre a Global Jerseys</h2>
    <p>Uma loja online dedicada a camisolas de futebol das principais ligas europeias.</p>
  </div>

  <div class="panel">
    <p>
      A <strong>Global Jerseys</strong> nasceu com um objetivo simples:
      reunir num só local camisolas de vários clubes, com uma experiência de compra clara, rápida e intuitiva.
    </p>

    <div class="hr"></div>

    <h3>Ligas e clubes disponíveis</h3>
    <ul>
      <li><strong>La Liga:</strong> Barcelona, Real Madrid, Atlético de Madrid, Real Bétis</li>
      <li><strong>Premier League:</strong> Manchester City, Manchester United, Chelsea, Arsenal, Liverpool, Tottenham</li>
      <li><strong>Serie A:</strong> Nápoles, Milan, Inter de Milão, Juventus, Roma</li>
      <li><strong>Bundesliga:</strong> Bayern de Munique, Dortmund, Leverkusen, Leipzig</li>
      <li><strong>Ligue 1:</strong> PSG, Marselha, Mónaco, Lyon</li>
      <li><strong>Liga Portuguesa:</strong> Benfica, Porto, Sporting, Braga</li>
    </ul>

    <div class="hr"></div>

    <h3>Pagamentos e envios</h3>
    <p>
      Disponibilizamos métodos de pagamento como <strong>MB WAY</strong>, <strong>Visa</strong> e <strong>Mastercard</strong>.
      O custo de portes é calculado no checkout, sendo apresentado antes da confirmação final.
    </p>

    <div class="hr"></div>

    <h3>Contactos</h3>
    <p><strong>Email:</strong> globaljerseys@example.com</p>
    <p><strong>Instagram:</strong> @globaljerseys</p>
  </div>
</main>

<?php include __DIR__ . '/includes/footer.php'; ?>

</body>
</html>
