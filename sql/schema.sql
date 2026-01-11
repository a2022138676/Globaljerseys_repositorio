CREATE DATABASE IF NOT EXISTS global_jerseys
  CHARACTER SET utf8mb4
  COLLATE utf8mb4_general_ci;

USE global_jerseys;

CREATE TABLE IF NOT EXISTS encourage_users (
  id INT AUTO_INCREMENT PRIMARY KEY,
  first_name VARCHAR(80) NOT NULL,
  last_name VARCHAR(80) NOT NULL,
  email VARCHAR(180) NOT NULL UNIQUE,
  password_hash VARCHAR(255) NOT NULL,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE IF NOT EXISTS addresses (
  id INT AUTO_INCREMENT PRIMARY KEY,
  user_id INT NOT NULL,
  full_name VARCHAR(160) NOT NULL,
  phone VARCHAR(40) NOT NULL,
  address1 VARCHAR(180) NOT NULL,
  address2 VARCHAR(180) NULL,
  city VARCHAR(120) NOT NULL,
  postal_code VARCHAR(20) NOT NULL,
  country VARCHAR(80) NOT NULL DEFAULT 'Portugal',
  district VARCHAR(120) NULL,
  is_default TINYINT(1) NOT NULL DEFAULT 1,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  CONSTRAINT fk_addresses_user
    FOREIGN KEY (user_id) REFERENCES encourage_users(id)
    ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS orders (
  id INT AUTO_INCREMENT PRIMARY KEY,
  user_id INT NULL,
  guest_email VARCHAR(180) NULL,
  guest_name VARCHAR(160) NULL,
  guest_phone VARCHAR(40) NULL,
  guest_address1 VARCHAR(180) NULL,
  guest_address2 VARCHAR(180) NULL,
  guest_city VARCHAR(120) NULL,
  guest_postal_code VARCHAR(20) NULL,
  guest_country VARCHAR(80) NULL,
  guest_district VARCHAR(120) NULL,
  payment_method VARCHAR(30) NOT NULL,
  payment_ref VARCHAR(120) NOT NULL,
  subtotal DECIMAL(10,2) NOT NULL,
  shipping DECIMAL(10,2) NOT NULL,
  total DECIMAL(10,2) NOT NULL,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  CONSTRAINT fk_orders_user
    FOREIGN KEY (user_id) REFERENCES encourage_users(id)
    ON DELETE SET NULL
);

CREATE TABLE IF NOT EXISTS order_items (
  id INT AUTO_INCREMENT PRIMARY KEY,
  order_id INT NOT NULL,
  product_id VARCHAR(80) NOT NULL,
  name VARCHAR(180) NOT NULL,
  league VARCHAR(80) NOT NULL,
  size VARCHAR(10) NOT NULL,
  price DECIMAL(10,2) NOT NULL,
  qty INT NOT NULL,
  image VARCHAR(220) NOT NULL,
  CONSTRAINT fk_items_order
    FOREIGN KEY (order_id) REFERENCES orders(id)
    ON DELETE CASCADE
);
