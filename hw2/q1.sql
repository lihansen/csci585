-- MySQL 8.0.32


-- drop tables for debugging or testing
# drop table if exists sponsor_video_log cascade;
# drop table if exists sponsor cascade;
# drop table if exists video cascade;


CREATE TABLE sponsor (
  sponsor_id INT AUTO_INCREMENT,
  name VARCHAR(255),
  phone VARCHAR(20),
  address VARCHAR(255),
  primary key (sponsor_id)
);

create table video (
    video_url varchar(255),
    title varchar(255),
    thumbnail varchar(255),
    primary key (video_url)
);


create table sponsor_video_log(
  video_url varchar(255),
  sponsor_id integer,
  amount DECIMAL (10, 2),
  PRIMARY KEY (video_url, sponsor_id),
  FOREIGN KEY (video_url) REFERENCES video(video_url) ,
  FOREIGN KEY (sponsor_id) REFERENCES sponsor(sponsor_id)
);


INSERT INTO sponsor (name, phone, address) VALUES
('Sponsor 1', '123-456-7890', '123 Main St'),
('Sponsor 2', '456-789-0123', '456 Second St'),
('Sponsor 3', '789-012-3456', '789 Third St'),
('Sponsor 4', '012-345-6789', '012 Fourth St'),
('Sponsor 5', '345-678-9012', '345 Fifth St');

INSERT INTO video (video_url, title, thumbnail) VALUES
('https://www.youtube.com/watch?v=dQw4w9WgXcQ', 'Never Gonna Give You Up', 'https://i.ytimg.com/vi/dQw4w9WgXcQ/hqdefault.jpg'),
('https://www.youtube.com/watch?v=Z1jK8rhOGkM', 'All Star', 'https://i.ytimg.com/vi/Z1jK8rhOGkM/hqdefault.jpg'),
('https://www.youtube.com/watch?v=gjBRyRHZG8o', 'Take on Me', 'https://i.ytimg.com/vi/gjBRyRHZG8o/hqdefault.jpg'),
('https://www.youtube.com/watch?v=J---aiyznGQ', 'Smooth Criminal', 'https://i.ytimg.com/vi/J---aiyznGQ/hqdefault.jpg'),
('https://www.youtube.com/watch?v=fHiGbolOJfU', 'Sweet Child O Mine', 'https://i.ytimg.com/vi/fHiGbolOJfU/hqdefault.jpg');

INSERT INTO sponsor_video_log (video_url, sponsor_id, amount) VALUES
('https://www.youtube.com/watch?v=dQw4w9WgXcQ', 1, 100.00),
('https://www.youtube.com/watch?v=Z1jK8rhOGkM', 2, 275.00),
('https://www.youtube.com/watch?v=gjBRyRHZG8o', 1, 50.00),
('https://www.youtube.com/watch?v=J---aiyznGQ', 3, 200.00),
('https://www.youtube.com/watch?v=fHiGbolOJfU', 4, 150.00),
('https://www.youtube.com/watch?v=dQw4w9WgXcQ', 5, 125.00),
('https://www.youtube.com/watch?v=Z1jK8rhOGkM', 3, 100.00),
('https://www.youtube.com/watch?v=gjBRyRHZG8o', 2, 75.00),
('https://www.youtube.com/watch?v=J---aiyznGQ', 4, 50.00),
('https://www.youtube.com/watch?v=fHiGbolOJfU', 1, 200.00);


-- https://piazza.com/class/lcpi8pdga7s186/post/295

# Q1. Find the sponsor who has sponsored the highest amount in YouTube.
# Display the sponsor’s name, phone number and the total amount sponsored.


-- amount_sponsored is for calculating the total amount sponsored
SELECT sponsor.name, sponsor.phone, sum(sponsor_video_log.amount) as amount_sponsored
FROM sponsor_video_log
join sponsor on sponsor.sponsor_id = sponsor_video_log.sponsor_id
group by sponsor.name, sponsor.phone
having amount_sponsored = ( -- calculating the max amount, and it maybe more than one max results
    select max(total_amount.sum_amt)
    from (
        select sum(amount) as sum_amt
        from sponsor_video_log
        group by sponsor_id
         ) as total_amount
    );


