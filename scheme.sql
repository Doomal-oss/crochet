CREATE TABLE IF NOT EXISTS posts (
  id SERIAL PRIMARY KEY,
  title TEXT,
  author TEXT,
  text TEXT,
  time TEXT,
  votes INTEGER,
  comments INTEGER
);

CREATE TABLE IF NOT EXISTS communities (
  name TEXT PRIMARY KEY,
  members TEXT,
  online INTEGER
);

CREATE TABLE IF NOT EXISTS embroidery_schemes (
  id SERIAL PRIMARY KEY,
  title TEXT,
  tags TEXT,
  image TEXT,
  difficulty TEXT,
  description TEXT,
  materials JSONB,
  instructions JSONB
);

CREATE TABLE IF NOT EXISTS crochet_schemes (
  id SERIAL PRIMARY KEY,
  title TEXT,
  colors TEXT,
  image TEXT,
  description TEXT,
  instructions JSONB
);

-- Создание таблицы пользователей
CREATE TABLE IF NOT EXISTS users (
    id SERIAL PRIMARY KEY,
    username VARCHAR(50) UNIQUE NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    password_hash VARCHAR(255) NOT NULL,
    full_name VARCHAR(100),
);

-- Создание таблицы ролей
CREATE TABLE IF NOT EXISTS roles (
    id SERIAL PRIMARY KEY,
    name VARCHAR(50) UNIQUE NOT NULL,
    description TEXT,
);

-- Создание промежуточной таблицы для связи пользователей и ролей
CREATE TABLE IF NOT EXISTS user_roles (
    user_id INTEGER REFERENCES users(id) ON DELETE CASCADE,
    role_id INTEGER REFERENCES roles(id) ON DELETE CASCADE,
    PRIMARY KEY (user_id, role_id)
);

-- Создание индексов для оптимизации запросов
CREATE INDEX idx_users_username ON users(username);
CREATE INDEX idx_users_email ON users(email);
CREATE INDEX idx_roles_name ON roles(name);
CREATE INDEX idx_user_roles_user_id ON user_roles(user_id);
CREATE INDEX idx_user_roles_role_id ON user_roles(role_id);

