-- MySQL 8.0.32

-- Q2. Find the ratio of likes to views of each video belonging to any of the channels owned by users having
-- the word “Marvel Entertainment” in them. Display the Video Title,
-- channel name and the ratio in the ascending order of the title.

# assume there is no data in the database
# drop tables if there exists the same name tables in the database
# drop table if exists statics;
#
# drop table if exists upload_request;
#
# drop table if exists channel;
#
# drop table if exists user;
#
# drop table if exists video;


# create tables
# only video_url, video are required in this problem
create table video (
    video_url varchar(255),
    title varchar(255),

    primary key (video_url)
);

create table statics(
    video_url varchar(255),
    likes int default 0,
    dislikes int default 0,
    views int default 0,

    primary key (video_url),
    foreign key (video_url) references video(video_url)
);

create table user(
    user_id int auto_increment,
    name varchar(255),
    email varchar(255),

    primary key (user_id)
);

create table channel(
    channel_name varchar(255),
    owner_user_id int not null ,
    creation_date date,
    creation_time datetime,

    primary key (channel_name),
    foreign key (owner_user_id) references user(user_id)

);

create table upload_request (
    uploader_id int,
    channel_name varchar(255),
    video_url varchar(255),
    upload_date date,
    upload_time datetime,

    primary key (uploader_id, channel_name, video_url),
    foreign key (uploader_id) references user(user_id),
    foreign key (channel_name) references channel(channel_name),
    foreign key (video_url) references video(video_url)
);

# data creation
INSERT INTO video (video_url, title) VALUES
('https://www.youtube.com/watch?v=QdpxoFcdORI', 'Avengers: Endgame - Trailer (2019)'),
('https://www.youtube.com/watch?v=1qsp3PIsCBU', 'Marvel Studios Black Widow - Final Trailer'),
('https://www.youtube.com/watch?v=rq_P3XCJZL4', 'Marvel Studios Captain Marvel - Trailer 2'),
('https://www.youtube.com/watch?v=2Vv-BfVoq4g', 'Marvel Studios Shang-Chi and The Legend of The Ten Rings | Official Teaser'),
('https://www.youtube.com/watch?v=TeKCZ-5KZJg', 'Marvel Studios Eternals | Final Trailer'),
('https://www.youtube.com/watch?v=dQw4w9WgXcQ', 'Rick Astley - Never Gonna Give You Up'),
('https://www.youtube.com/watch?v=j5a0jTc9S10', 'The Beatles - Hey Jude'),
('https://www.youtube.com/watch?v=U06jlgpMtQs', 'Queen - Bohemian Rhapsody');

INSERT INTO statics (video_url, likes, dislikes, views) VALUES
('https://www.youtube.com/watch?v=QdpxoFcdORI', 100, 10, 54254),
('https://www.youtube.com/watch?v=1qsp3PIsCBU', 50, 5, 8756),
('https://www.youtube.com/watch?v=rq_P3XCJZL4', 200, 20, 87434),
('https://www.youtube.com/watch?v=2Vv-BfVoq4g', 150, 15, 431414),
('https://www.youtube.com/watch?v=TeKCZ-5KZJg', 75, 7, 6543),
('https://www.youtube.com/watch?v=dQw4w9WgXcQ', 34, 1, 43141),
('https://www.youtube.com/watch?v=j5a0jTc9S10', 432, 34, 431000),
('https://www.youtube.com/watch?v=U06jlgpMtQs', 659, 58, 88430);

INSERT INTO user (name, email) VALUES
('Marvel Entertainment', 'me@gmail.com'),
('Free Clips', 'pm@gmail.com'),
('Movie Star', 'ws@gmail.com'),
('Studios', 'us@gmail.com'),
('Sony Music', 'sm@gmail.com');

INSERT INTO channel (channel_name, owner_user_id, creation_date, creation_time) VALUES
('Marvel Movies', 1, '2020-01-01', '2020-01-01 12:00:00'),
('Marvel FreeVideo', 1, '2020-01-01', '2020-01-01 12:00:00'),
('Music', 5, '2020-01-01', '2020-01-01 12:00:00'),
('Action Movies', 2, '2020-01-01', '2020-01-01 12:00:00'),
('Rock Music', 5, '2020-01-01', '2020-01-01 12:00:00');

INSERT INTO upload_request (uploader_id, channel_name, video_url, upload_date, upload_time) VALUES
(2, 'Action Movies', 'https://www.youtube.com/watch?v=QdpxoFcdORI', '2020-01-01', '2020-01-01 12:00:00'),
(1, 'Marvel Movies', 'https://www.youtube.com/watch?v=1qsp3PIsCBU', '2020-01-01', '2020-01-01 12:00:00'),
(1, 'Marvel FreeVideo', 'https://www.youtube.com/watch?v=rq_P3XCJZL4', '2020-01-01', '2020-01-01 12:00:00'),
(2, 'Action Movies', 'https://www.youtube.com/watch?v=2Vv-BfVoq4g', '2020-01-01', '2020-01-01 12:00:00'),
(1, 'Marvel Movies', 'https://www.youtube.com/watch?v=TeKCZ-5KZJg', '2020-01-01', '2020-01-01 12:00:00'),
(5, 'Music','https://www.youtube.com/watch?v=dQw4w9WgXcQ', '2020-01-01', '2020-01-01 12:00:00'),
(5, 'Music','https://www.youtube.com/watch?v=j5a0jTc9S10', '2020-01-01', '2020-01-01 12:00:00'),
(5, 'Rock Music','https://www.youtube.com/watch?v=U06jlgpMtQs', '2020-01-01', '2020-01-01 12:00:00');



SELECT v.title as video_title,
       ur.channel_name,
       s.likes/s.views as ratio
FROM statics s
JOIN video v ON s.video_url = v.video_url
JOIN upload_request ur ON ur.video_url = v.video_url
JOIN user u ON ur.uploader_id = u.user_id
WHERE u.name LIKE '%Marvel Entertainment%'
ORDER BY v.title ASC;



