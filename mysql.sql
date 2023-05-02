CREATE TABLE IF NOT EXISTS users (
  id INT AUTO_INCREMENT PRIMARY KEY,
  username VARCHAR(255) UNIQUE NOT NULL,
  email VARCHAR(255) UNIQUE NOT NULL,
  password VARCHAR(255) NOT NULL
);

CREATE TABLE IF NOT EXISTS posts (
  id INT AUTO_INCREMENT PRIMARY KEY,
  user_id INT NOT NULL,
  content TEXT NOT NULL,
  FOREIGN KEY (user_id) REFERENCES users (id) ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS post_images (
  id INT AUTO_INCREMENT PRIMARY KEY,
  post_id INT NOT NULL,
  image_path TEXT NOT NULL,
  display_order INT,
  FOREIGN KEY (post_id) REFERENCES posts (id) ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS tags (
  id INT AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(255) UNIQUE NOT NULL
);

CREATE TABLE IF NOT EXISTS post_tags (
  id INT AUTO_INCREMENT PRIMARY KEY,
  post_id INT NOT NULL,
  tag_id INT NOT NULL,
  FOREIGN KEY (post_id) REFERENCES posts (id) ON DELETE CASCADE,
  FOREIGN KEY (tag_id) REFERENCES tags (id) ON DELETE CASCADE
);

-- ユーザーテーブルにダミーデータを挿入
INSERT INTO users (username, email, password) VALUES
('user1', 'user1@example.com', 'password1'),
('user2', 'user2@example.com', 'password2'),
('user3', 'user3@example.com', 'password3');

-- 投稿テーブルにダミーデータを挿入
INSERT INTO posts (user_id, content) VALUES
(1, 'This is user1 post content.'),
(2, 'This is user2 post content.'),
(3, 'This is user3 post content.');

-- 投稿画像テーブルにダミーデータを挿入
INSERT INTO post_images (post_id, image_path, display_order) VALUES
(1, 'path/to/image1.jpg', 1),
(1, 'path/to/image2.jpg', 2),
(2, 'path/to/image3.jpg', 1),
(3, 'path/to/image4.jpg', 1),
(3, 'path/to/image5.jpg', 2);

-- タグテーブルにダミーデータを挿入
INSERT INTO tags (name) VALUES
('tag1'),
('tag2'),
('tag3');

-- 投稿タグテーブルにダミーデータを挿入
INSERT INTO post_tags (post_id, tag_id) VALUES
(1, 1),
(1, 2),
(2, 1),
(3, 3);
