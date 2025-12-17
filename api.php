<?php
// api.php
session_start();
header('Content-Type: application/json; charset=utf-8');

require_once __DIR__ . '/db.php';

$action = $_GET['action'] ?? '';
$input = json_decode(file_get_contents("php://input"), true) ?? [];

function cart_count(): int {
  $c = 0;
  if (!empty($_SESSION['cart'])) {
    foreach ($_SESSION['cart'] as $it) $c += (int)$it['qty'];
  }
  return $c;
}

function user_name(): string {
  return $_SESSION['user']['first_name'] ?? '';
}

if (!isset($_SESSION['cart'])) $_SESSION['cart'] = [];

switch ($action) {

  case 'header_state': {
    echo json_encode([
      'ok' => true,
      'cartCount' => cart_count(),
      'userName' => user_name()
    ]);
    exit;
  }

  case 'cart_add': {
    $id = trim($input['id'] ?? '');
    if ($id === '') { echo json_encode(['ok'=>false]); exit; }

    $key = $id . '|' . ($input['size'] ?? 'M');

    if (!isset($_SESSION['cart'][$key])) {
      $_SESSION['cart'][$key] = [
        'id' => $id,
        'name' => $input['name'] ?? '',
        'league' => $input['league'] ?? '',
        'price' => (float)($input['price'] ?? 0),
        'image' => $input['image'] ?? '',
        'size' => $input['size'] ?? 'M',
        'qty' => 1
      ];
    } else {
      $_SESSION['cart'][$key]['qty'] += 1;
    }

    echo json_encode(['ok'=>true,'cartCount'=>cart_count()]);
    exit;
  }

  case 'cart_get': {
    echo json_encode(['ok'=>true,'items'=>array_values($_SESSION['cart'])]);
    exit;
  }

  case 'cart_set_qty': {
    $key = $input['key'] ?? '';
    $qty = (int)($input['qty'] ?? 1);
    if ($key === '' || !isset($_SESSION['cart'][$key])) { echo json_encode(['ok'=>false]); exit; }
    if ($qty <= 0) unset($_SESSION['cart'][$key]);
    else $_SESSION['cart'][$key]['qty'] = $qty;
    echo json_encode(['ok'=>true,'cartCount'=>cart_count()]);
    exit;
  }

  case 'cart_clear': {
    $_SESSION['cart'] = [];
    echo json_encode(['ok'=>true,'cartCount'=>0]);
    exit;
  }

  case 'auth_register': {
    $fn = trim($input['first_name'] ?? '');
    $ln = trim($input['last_name'] ?? '');
    $email = trim($input['email'] ?? '');
    $pass = (string)($input['password'] ?? '');

    if ($fn === '' || $ln === '') {
      echo json_encode(['ok' => false, 'msg' => 'Preenche o nome e apelido.']);
      exit;
    }

    if ($email === '' || !filter_var($email, FILTER_VALIDATE_EMAIL)) {
      echo json_encode(['ok' => false, 'msg' => 'Email inválido.']);
      exit;
    }

    if (strlen($pass) < 4) {
      echo json_encode(['ok' => false, 'msg' => 'A palavra-passe deve ter pelo menos 4 caracteres.']);
      exit;
    }

    try {
      $stmt = $pdo->prepare("SELECT id FROM encourage_users WHERE email=? LIMIT 1");
      $stmt->execute([$email]);
      if ($stmt->fetch()) {
        echo json_encode(['ok' => false, 'msg' => 'Esse email já existe.']);
        exit;
      }

      $hash = password_hash($pass, PASSWORD_BCRYPT);
      $ins = $pdo->prepare("INSERT INTO encourage_users(first_name,last_name,email,password_hash) VALUES(?,?,?,?)");
      $ins->execute([$fn, $ln, $email, $hash]);

      echo json_encode(['ok' => true, 'msg' => 'Conta criada com sucesso! Agora faz login.']);
      exit;
    } catch (Exception $e) {
      echo json_encode(['ok' => false, 'msg' => 'Erro ao criar conta. ' . $e->getMessage()]);
      exit;
    }
  }

  case 'auth_login': {
    $email = trim($input['email'] ?? '');
    $pass  = (string)($input['password'] ?? '');

    $stmt = $pdo->prepare("SELECT id, first_name, last_name, email, password_hash FROM encourage_users WHERE email=? LIMIT 1");
    $stmt->execute([$email]);
    $u = $stmt->fetch();

    if (!$u || !password_verify($pass, $u['password_hash'])) {
      echo json_encode(['ok'=>false,'msg'=>'Credenciais inválidas.']);
      exit;
    }

    $_SESSION['user'] = [
      'id' => (int)$u['id'],
      'first_name' => $u['first_name'],
      'last_name' => $u['last_name'],
      'email' => $u['email']
    ];

    echo json_encode(['ok'=>true,'userName'=>$u['first_name']]);
    exit;
  }

  case 'auth_logout': {
    unset($_SESSION['user']);
    echo json_encode(['ok'=>true]);
    exit;
  }

  case 'address_get': {
    if (empty($_SESSION['user']['id'])) { echo json_encode(['ok'=>false]); exit; }
    $uid = (int)$_SESSION['user']['id'];

    $stmt = $pdo->prepare("SELECT * FROM addresses WHERE user_id=? ORDER BY is_default DESC, id DESC LIMIT 1");
    $stmt->execute([$uid]);
    $a = $stmt->fetch();

    echo json_encode(['ok'=>true,'address'=>$a ?: null]);
    exit;
  }

  case 'address_save': {
    if (empty($_SESSION['user']['id'])) { echo json_encode(['ok'=>false,'msg'=>'Precisas de conta.']); exit; }
    $uid = (int)$_SESSION['user']['id'];

    $full = trim($input['full_name'] ?? '');
    $phone = trim($input['phone'] ?? '');
    $company = trim($input['company'] ?? '');
    $a1 = trim($input['address1'] ?? '');
    $a2 = trim($input['address2'] ?? '');
    $city = trim($input['city'] ?? '');
    $pc = trim($input['postal_code'] ?? '');
    $country = trim($input['country'] ?? 'Portugal');
    $district = trim($input['district'] ?? '');
    $isDefault = !empty($input['is_default']) ? 1 : 0;

    if ($full==='' || $phone==='' || $a1==='' || $city==='' || $pc==='') {
      echo json_encode(['ok'=>false,'msg'=>'Preenche os campos obrigatórios.']);
      exit;
    }

    if ($isDefault) {
      $pdo->prepare("UPDATE addresses SET is_default=0 WHERE user_id=?")->execute([$uid]);
    }

    $ins = $pdo->prepare("INSERT INTO addresses(user_id,full_name,phone,company,address1,address2,city,postal_code,country,district,is_default)
                          VALUES(?,?,?,?,?,?,?,?,?,?,?)");
    $ins->execute([$uid,$full,$phone,$company ?: null,$a1,$a2 ?: null,$city,$pc,$country,$district ?: null,$isDefault]);

    echo json_encode(['ok'=>true,'msg'=>'Morada guardada com sucesso!']);
    exit;
  }

  case 'orders_list': {
    if (empty($_SESSION['user']['id'])) { echo json_encode(['ok'=>true,'orders'=>[]]); exit; }
    $uid = (int)$_SESSION['user']['id'];

    $stmt = $pdo->prepare("SELECT id,total,created_at FROM orders WHERE user_id=? ORDER BY id DESC");
    $stmt->execute([$uid]);
    echo json_encode(['ok'=>true,'orders'=>$stmt->fetchAll()]);
    exit;
  }

  case 'checkout': {
    // Usa morada da conta se existir; senão usa dados do convidado
    $items = $_SESSION['cart'];
    if (empty($items)) { echo json_encode(['ok'=>false,'msg'=>'Carrinho vazio.']); exit; }

    $payment = $input['payment_method'] ?? 'MBWAY';
    $ref = trim($input['payment_ref'] ?? '');
    if ($ref==='') { echo json_encode(['ok'=>false,'msg'=>'Indica a referência de pagamento.']); exit; }

    $subtotal = 0.0;
    foreach ($items as $it) $subtotal += ((float)$it['price']) * ((int)$it['qty']);
    $shipping = ($subtotal > 0 ? 4.99 : 0.0);
    $total = $subtotal + $shipping;

    $uid = $_SESSION['user']['id'] ?? null;

    $guest = $input['guest'] ?? [];
    $guestEmail = trim($guest['email'] ?? '');
    $guestName = trim($guest['full_name'] ?? '');
    $guestPhone = trim($guest['phone'] ?? '');
    $guestA1 = trim($guest['address1'] ?? '');
    $guestA2 = trim($guest['address2'] ?? '');
    $guestCity = trim($guest['city'] ?? '');
    $guestPC = trim($guest['postal_code'] ?? '');
    $guestCountry = trim($guest['country'] ?? 'Portugal');
    $guestDistrict = trim($guest['district'] ?? '');

    if (!$uid) {
      if ($guestEmail==='' || $guestName==='' || $guestPhone==='' || $guestA1==='' || $guestCity==='' || $guestPC==='') {
        echo json_encode(['ok'=>false,'msg'=>'Preenche os dados de entrega.']);
        exit;
      }
    }

    $ins = $pdo->prepare("INSERT INTO orders(user_id,guest_email,guest_name,guest_phone,guest_address1,guest_address2,guest_city,guest_postal_code,guest_country,guest_district,payment_method,payment_ref,subtotal,shipping,total)
                          VALUES(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)");
    $ins->execute([
      $uid,
      $uid ? null : $guestEmail,
      $uid ? null : $guestName,
      $uid ? null : $guestPhone,
      $uid ? null : $guestA1,
      $uid ? null : ($guestA2 ?: null),
      $uid ? null : $guestCity,
      $uid ? null : $guestPC,
      $uid ? null : $guestCountry,
      $uid ? null : ($guestDistrict ?: null),
      $payment,
      $ref,
      $subtotal,
      $shipping,
      $total
    ]);

    $orderId = (int)$pdo->lastInsertId();

    $itIns = $pdo->prepare("INSERT INTO order_items(order_id,product_id,name,league,size,price,qty,image)
                            VALUES(?,?,?,?,?,?,?,?)");
    foreach ($items as $it) {
      $itIns->execute([
        $orderId,
        $it['id'],
        $it['name'],
        $it['league'],
        $it['size'],
        (float)$it['price'],
        (int)$it['qty'],
        $it['image']
      ]);
    }

    $_SESSION['cart'] = [];

    echo json_encode(['ok'=>true,'msg'=>'Encomenda confirmada com sucesso!','orderId'=>$orderId]);
    exit;
  }

  default:
    echo json_encode(['ok'=>false,'msg'=>'Ação inválida.']);
    exit;
}
