CREATE TABLE user (
  user_id INT AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(255) NOT NULL,
  email VARCHAR(255) NOT NULL,
  age INT,
  address VARCHAR(255),
  balance DECIMAL(10, 2),
  subscriber_count INT,
  subscription_count INT
);


CREATE TABLE channel (
  channel_id INT AUTO_INCREMENT PRIMARY KEY,
  channel_name VARCHAR(255) NOT NULL,
  user_id INT NOT NULL,
  subscribe_count INT,
  create_time date DEFAULT (CURRENT_DATE),
  subscription_type ENUM('paid', 'free') NOT NULL,
--   subscription_type ENUM('paid', 'free') NOT NULL,
  FOREIGN KEY (user_id) REFERENCES user(user_id)
);



-- Insert 5 users
INSERT INTO user (name, email, age, address, balance, subscriber_count, subscription_count)
VALUES
  ('John Smith', 'john.smith@example.com', 30, '123 Main St, Anytown, USA', 100.00, 0, 0),
  ('Jane Doe', 'jane.doe@example.com', 25, '456 Oak St, Somewhere, USA', 50.00, 0, 0),
  ('Bob Johnson', 'bob.johnson@example.com', 40, '789 Elm St, Anywhere, USA', 200.00, 0, 0),
  ('Alice Brown', 'alice.brown@example.com', 35, '321 Maple St, Nowhere, USA', 75.00, 0, 0),
  ('Tom Wilson', 'tom.wilson@example.com', 28, '654 Pine St, Everywhere, USA', 150.00, 0, 0);

-- Insert 10 channels
INSERT INTO channel (channel_name, user_id, subscribe_count, create_time, subscription_type)
VALUES
  ('cars',1, 50, NOW(), 'free'),
  ('beauties', 1, 40, '2023-01-01', 'paid'),
  ('houses', 2, 4000, NOW(), 'free'),
  ('painting', 2, 25000, '2023-01-01', 'paid'),
  ('photos',3, 120, NOW(), 'free'),
  ('school', 3, 5430, '2023-01-01', 'paid'),
  ('talkshow', 4, 20, NOW(), 'free'),
  ('linkedin', 4, 40, '2023-01-01', 'paid'),
  ('jobs', 5, 130, NOW(), 'free'),
  ('guns', 5, 6540, NOW(), 'paid');


SELECT user.name, user.email, channel.channel_name, user. subscriber_count
from user
JOIN channel ON user.user_id = channel.user_id
WHERE channel.subscription_type = 'paid'
    AND channel.subscribe_count >  100
and channel.create_time = '2023-01-01';





