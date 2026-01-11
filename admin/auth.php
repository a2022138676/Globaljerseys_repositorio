<?php
// Proteção da área de administração
// Requer sessão iniciada e utilizador com email de admin.
if (session_status() === PHP_SESSION_NONE) { session_start(); }

$ADMIN_EMAIL = 'admin@globaljerseys.com';

if (empty($_SESSION['user']) || empty($_SESSION['user']['email']) || $_SESSION['user']['email'] !== $ADMIN_EMAIL) {
    header('Location: ../conta.php?err=admin');
    exit;
}
?>
