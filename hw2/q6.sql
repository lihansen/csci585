-- MySQL 8.0.32


-- Q6. Find all the content creators living in the US who have consistently posted at
-- least 1 video each week of the last month. Display their username, channel/s they own
-- and their total subscriber count.
drop table if exists subscribe cascade;

drop table if exists upload_request cascade;

drop table if exists channel cascade;

drop table if exists video cascade;

drop table if exists video_consumer cascade;

drop table if exists video_creator cascade;

drop table if exists user cascade;


create table video (
    video_url varchar(255),
    title varchar(255),

    primary key (video_url)
);


CREATE TABLE user (
    user_id INT AUTO_INCREMENT,
    name VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL,
    address varchar (255) not null,

    primary key (user_id)
);


create table video_creator(
    user_id int,
    subscriber_count INT,

    primary key (user_id),
    foreign key (user_id) references user(user_id)
);

create table video_consumer(
    user_id int,
    subscriber_count INT,

    primary key (user_id),
    foreign key (user_id) references user(user_id)
);



create table channel(
    channel_id int auto_increment,
    channel_name varchar(255),
    owner_user_id int not null ,
    creation_date date,

    primary key (channel_id),
    foreign key (owner_user_id) references user(user_id)
);


create table upload_request (
    uploader_id int,
    channel_id int,
    video_url varchar(255),
    upload_date date,

    primary key (uploader_id, channel_id, video_url),
    foreign key (uploader_id) references user(user_id),
    foreign key (channel_id) references channel(channel_id),
    foreign key (video_url) references video(video_url)
);

-- Subscribe table is for counting the channel subscribers
create table subscribe(
    subscription_id int auto_increment,
    channel_id int,
    subscriber_id int,
#     subscription_type ENUM('paid', 'free') NOT NULL,

    primary key (subscription_id, channel_id, subscriber_id),
    foreign key (channel_id) references channel(channel_id),
    foreign key (subscriber_id) references video_consumer(user_id)
);


INSERT INTO user (name, email, address)
VALUES
('John Smith', 'john.smith@gmail.com', '123 Main St, USA'),
('Jane Doe', 'jane.doe@gmail.com', '456 Oak St, USA'),
('David Lee', 'david.lee@gmail.com', '789 Elm St, USA'),
('Sarah Johnson', 'sarah.johnson@gmail.com', '1010 Pine St, USA'),
('Michael Brown', 'michael.brown@gmail.com', '1111 Cedar St, UK'),
('Emily Wilson', 'emily.wilson@gmail.com', '1212 Maple St, Canada'),
('Oliver Thompson', 'oliver.thompson@gmail.com', '1313 Spruce St, Canada'),
('Sophia Garcia', 'sophia.garcia@gmail.com', '1414 Birch St, UK'),
('William Rodriguez', 'william.rodriguez@gmail.com', '1515 Oak St, UK'),
('Avery Davis', 'avery.davis@gmail.com', '1616 Elm St, UK');

-- The subscriber_count not for the final result, it is a random number here
INSERT INTO video_creator (user_id, subscriber_count)
VALUES
(1, 123),
(2, 321),
(3, 321),
(4, 321),
(5, 432);

INSERT INTO video_consumer (user_id, subscriber_count)
VALUES
(6, 5000),
(7, 7000),
(8, 6000),
(9, 8000),
(10, 9000);


-- insert videos
INSERT INTO video (video_url, title)
VALUES
('https://www.youtube.com/watch?v=abcdefghijk', 'How to make a perfect steak'),
('https://www.youtube.com/watch?v=lmno123456', 'Exploring the hidden gems of Paris'),
('https://www.youtube.com/watch?v=qrstuvwxy', '10-minute workout routine for busy people'),
('https://www.youtube.com/watch?v=123xyz789', '5 skincare hacks for a glowing complexion'),
('https://www.youtube.com/watch?v=789abc123', 'Michaels top 10 favorite songs of all time'),
('https://www.youtube.com/watch?v=lmno456789', 'Authentic Italian pasta recipe'),
('https://www.youtube.com/watch?v=uvwxyz12345', 'Hiking in the Grand Canyon'),
('https://www.youtube.com/watch?v=5678abcd90', '30-day yoga challenge for beginners'),
('https://www.youtube.com/watch?v=2345efghij', '10 tips for flawless makeup'),
('https://www.youtube.com/watch?v=mnopqr1234', 'Michael\'s favorite indie artists'),
('https://www.youtube.com/watch?v=abc123xyz', 'How to make a DIY face mask'),
('https://www.youtube.com/watch?v=efg456hijk', 'Interview with a professional athlete'),
('https://www.youtube.com/watch?v=lmno7890pq', 'The best pizza in town'),
('https://www.youtube.com/watch?v=123456xyzk', 'The latest fashion trends for summer'),
('https://www.youtube.com/watch?v=uvwxyza789', 'Delicious smoothie recipes to try'),
('https://www.youtube.com/watch?v=defg12345a', '5 easy hairstyles for short hair'),
('https://www.youtube.com/watch?v=2345pqrszt', 'Exploring abandoned buildings'),
('https://www.youtube.com/watch?v=uvw456xyz0', 'Baking a cake from scratch'),
('https://www.youtube.com/watch?v=jklmno1234', 'The science of sleep'),
('https://www.youtube.com/watch?v=bcdefg6789', 'Tips for a successful job interview');

-- insert channels
INSERT INTO channel (channel_name, owner_user_id, creation_date)
VALUES
('Cooking ', 1, '2022-01-01'),
('Travel ', 1, '2022-01-01'),
('Fitness ', 3, '2022-01-01'),
('Beauty ', 3, '2022-01-01'),
('Music  ', 2, '2022-01-01'),
('Food', 4, '2022-01-01'),
('Sport ', 5, '2022-01-01');


insert into subscribe (channel_id, subscriber_id)
values
(1,10),
(1,6),
(1,7),
(1,8),
(1,9),

(2,6),
(2,7),
(2,8),

(3,9),

(4,6),
(4,7),
(4,8),
(4,9),

(5,6),
(5,7),
(6,10),
(7,7);



-- insert upload requests
-- assume last month is from 2023-01-01 to 2023-01-31
-- week 1: 2023-01-02 ~ 2023-01-08
-- week 2: 2023-01-09 ~ 2023-01-15
-- week 3: 2023-01-16 ~ 2023-01-22
-- week 4: 2023-01-23 ~ 2023-01-29
INSERT INTO upload_request (uploader_id, channel_id, video_url, upload_date)
VALUES
(1,1, 'https://www.youtube.com/watch?v=abcdefghijk', '2023-01-03'),
(1,1, 'https://www.youtube.com/watch?v=lmno123456', '2023-01-11'),
(1,1, 'https://www.youtube.com/watch?v=qrstuvwxy', '2023-01-19'),
(1,1, 'https://www.youtube.com/watch?v=123xyz789', '2023-01-25'),

(1,2, 'https://www.youtube.com/watch?v=789abc123', '2023-01-04'),
(1,2, 'https://www.youtube.com/watch?v=lmno456789', '2023-01-12'),
(1,2, 'https://www.youtube.com/watch?v=uvwxyz12345', '2023-01-13'),
(1,2, 'https://www.youtube.com/watch?v=5678abcd90', '2023-01-17'),
(1,2, 'https://www.youtube.com/watch?v=2345efghij', '2023-01-24'),

(1,3, 'https://www.youtube.com/watch?v=mnopqr1234', '2023-01-01'),

(3,4, 'https://www.youtube.com/watch?v=abc123xyz', '2023-01-05'),
(3,4, 'https://www.youtube.com/watch?v=efg456hijk', '2023-01-13'),
(3,4, 'https://www.youtube.com/watch?v=lmno7890pq', '2023-01-17'),
(3,4, 'https://www.youtube.com/watch?v=123456xyzk','2023-01-28'),

(2,5, 'https://www.youtube.com/watch?v=uvwxyza789', '2023-02-01'),
(4,6, 'https://www.youtube.com/watch?v=defg12345a','2023-02-01'),
(4,6, 'https://www.youtube.com/watch?v=2345pqrszt', '2023-01-15'),
(4,6, 'https://www.youtube.com/watch?v=uvw456xyz0','2023-01-14'),
(5,7, 'https://www.youtube.com/watch?v=jklmno1234', '2023-01-16'),
(5,7, 'https://www.youtube.com/watch?v=bcdefg6789', '2023-01-20');

-- Q6. Find all the content creators living in the US who have consistently posted at
-- least 1 video each week of the last month.
-- Display their username, channel/s they own and their total subscriber count.


# https://piazza.com/class/lcpi8pdga7s186/post/362
# https://piazza.com/class/lcpi8pdga7s186/post/409


# It is the channel name and consistent channel's sub count

select u.name,
       c.channel_name,
       c.channel_id,
       count(*) as channel_subscriber
from user u
join video_creator vc on u.user_id = vc.user_id
join channel c on u.user_id = c.owner_user_id
join subscribe s on c.channel_id = s.channel_id
where u.address like '%USA'
and
    (
        select count(upload_request.channel_id) as times
        from upload_request
        where upload_request.channel_id = c.channel_id
          and
            upload_request.upload_date between '2023-01-02' and '2023-01-08'
#           and
#             upload_request.upload_date between '2023-01-09' and '2023-01-15'
    )
and
    (
        select count(upload_request.channel_id) as times
        from upload_request
        where upload_request.channel_id = c.channel_id
#           and
#             upload_request.upload_date between '2023-01-02' and '2023-01-08'
          and
            upload_request.upload_date between '2023-01-09' and '2023-01-15'
    )

group by c.channel_id



;

#
#     select count(upload_request.channel_id) as times
#     from upload_request
#     where channel_id = 1 and
#         upload_date between '2023-01-02' and '2023-01-08';

# SELECT COUNT(*) FROM viewer_log
# WHERE view_time >= '2022-01-01 00:00:00' AND view_time < '2022-02-01 00:00:00';

# SELECT u.name AS username, GROUP_CONCAT(c.channel_name) AS channels_owned, SUM(s.subscriber_count) AS total_subscribers
# FROM user u
# JOIN channel c ON u.user_id = c.owner_user_id
# JOIN video v ON v.video_url = c.channel_name
# JOIN viewer_log vl ON vl.video_url = v.video_url
# JOIN subscriber s ON s.channel_name = c.channel_name
# WHERE u.country = 'US'
# AND vl.view_time >= DATE_SUB(NOW(), INTERVAL 1 MONTH)
# GROUP BY u.name
# HAVING COUNT(DISTINCT WEEK(vl.view_time)) >= 4
