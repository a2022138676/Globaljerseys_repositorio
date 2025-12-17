<?php
// includes/header.php
if (session_status() === PHP_SESSION_NONE) session_start();

$active = $active ?? '';
$userName = $_SESSION['user']['first_name'] ?? '';
$cartCount = 0;
if (!empty($_SESSION['cart'])) {
  foreach ($_SESSION['cart'] as $it) $cartCount += (int)$it['qty'];
}
?>
<header class="header">
  <div class="container">
    <nav class="nav">
      <a class="logo" href="index.php">Global Jerseys</a>

      <ul class="nav-links">
        <li><a href="index.php" class="<?= $active==='inicio'?'active':'' ?>">Início</a></li>
        <li><a href="catalogo.php" class="<?= $active==='catalogo'?'active':'' ?>">Catálogo</a></li>
        <li><a href="pedidos.php" class="<?= $active==='pedidos'?'active':'' ?>">Pedidos</a></li>
        <li><a href="sobre.php" class="<?= $active==='sobre'?'active':'' ?>">Sobre</a></li>
        <li><a href="conta.php" class="<?= $active==='conta'?'active':'' ?>">Conta</a></li>
      </ul>

      <div class="nav-right">
        <span id="userChip" class="user-chip">
          <?= $userName ? 'Olá ' . htmlspecialchars($userName) : '' ?>
        </span>

        <a class="cart-pill" href="pedidos.php" aria-label="Carrinho">
          Carrinho <span id="cartCount" class="cart-count"><?= (int)$cartCount ?></span>
        </a>
      </div>
    </nav>
  </div>
</header>

<div id="toast" class="toast" role="status" aria-live="polite"></div>
