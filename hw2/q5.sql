-- MySQL 8.0.32


drop table if exists comment cascade;
drop table if exists upload_request cascade;
drop table if exists channel cascade;
drop table if exists viewer_log cascade;
drop table if exists user cascade;
drop table if exists video cascade;


-- creator or consumer are not required in this problem
-- assume the user can be both video owner or video viewer
create table user(
    user_id int auto_increment,
    name varchar(255),
    email varchar(255),
    age int,

    primary key (user_id)
);


create table video (
    video_url varchar(255),
    title varchar(255),

    primary key (video_url)
);


create table viewer_log(
  video_url varchar(255),
  viewer_id int,
  view_time datetime,

  primary key (video_url, viewer_id, view_time),
  foreign key (video_url) references video(video_url),
  foreign key (viewer_id) references user(user_id)
);


create table channel(
    channel_id int auto_increment,
    channel_name varchar(255),
    owner_user_id int not null ,
    creation_date date,

    primary key (channel_id),
    foreign key (owner_user_id) references user(user_id)
);


create table comment(
    comment_id int auto_increment,
    video_url varchar(255),
    commenter_id int,
    comment_text varchar(255),

    primary key (comment_id, video_url),
    foreign key (video_url) references video(video_url),
    foreign key (commenter_id) references user(user_id)
);


create table upload_request (
    uploader_id int,
    channel_id int,
    video_url varchar(255),
    upload_date date,
    upload_time datetime,

    primary key (uploader_id, channel_id, video_url),
    foreign key (uploader_id) references user(user_id),
    foreign key (channel_id) references channel(channel_id),
    foreign key (video_url) references video(video_url)
);

-- Insert 8 users
INSERT INTO user (name, email, age) VALUES
('John Doe', 'johndoe@example.com', 25),
('Jane Doe', 'janedoe@example.com', 27),
('Alex Smith', 'alexsmith@example.com', 30),
('Emily Jones', 'emilyjones@example.com', 22),
('Michael Johnson', 'michaeljohnson@example.com', 28),
('Amanda Lee', 'amandalee@example.com', 24),
('David Wilson', 'davidwilson@example.com', 29),
('Taylor Swift', 'taylorswift@example.com', 32);

-- Insert channels for Taylor Swift
INSERT INTO channel (channel_name, owner_user_id, creation_date) VALUES
('music', 8, '2022-01-01'),
('song', 8, '2022-01-02');

-- Insert videos for Taylor Swift's music channel
INSERT INTO video (video_url, title) VALUES
('https://www.youtube.com/watch?v=e-ORhEE9VVg', 'Shake It Off'),
('https://www.youtube.com/watch?v=nfWlot6h_JM', 'Blank Space'),
('https://www.youtube.com/watch?v=Jgk8WYwzVaY', 'Bad Blood');

-- Insert videos for Taylor Swift's song channel
INSERT INTO video (video_url, title) VALUES
('https://www.youtube.com/watch?v=3tmd-ClpJxA', 'Love Story'),
('https://www.youtube.com/watch?v=8xg3vE8Ie_E', 'You Belong With Me'),
('https://www.youtube.com/watch?v=VuNIsY6JdUw', 'Wildest Dreams');

-- Insert comments on Taylor Swift's music channel videos
INSERT INTO comment (video_url, commenter_id, comment_text) VALUES
('https://www.youtube.com/watch?v=e-ORhEE9VVg', 1, 'Love this song!'),
('https://www.youtube.com/watch?v=e-ORhEE9VVg', 3, 'One of my favorites'),
('https://www.youtube.com/watch?v=nfWlot6h_JM', 2, 'Such a great video!'),
('https://www.youtube.com/watch?v=Jgk8WYwzVaY', 4, 'This song gets me pumped!');

-- Insert comments on Taylor Swift's song channel videos
INSERT INTO comment (video_url, commenter_id, comment_text) VALUES
('https://www.youtube.com/watch?v=3tmd-ClpJxA', 5, 'This is a classic'),
('https://www.youtube.com/watch?v=3tmd-ClpJxA', 1, 'fantastic'),
('https://www.youtube.com/watch?v=8xg3vE8Ie_E', 6, 'One of her best'),
('https://www.youtube.com/watch?v=VuNIsY6JdUw', 7, 'I could listen to this all day!');


-- Insert viewer_log entries
INSERT INTO viewer_log (video_url, viewer_id, view_time) VALUES
('https://www.youtube.com/watch?v=e-ORhEE9VVg', 1, '2022-02-01 10:00:00'),
('https://www.youtube.com/watch?v=e-ORhEE9VVg', 2, '2022-02-02 11:00:00'),
('https://www.youtube.com/watch?v=e-ORhEE9VVg', 3, '2022-02-03 12:00:00'),
('https://www.youtube.com/watch?v=e-ORhEE9VVg', 4, '2022-02-04 13:00:00'),
('https://www.youtube.com/watch?v=nfWlot6h_JM', 5, '2022-02-05 14:00:00'),
('https://www.youtube.com/watch?v=nfWlot6h_JM', 6, '2022-02-06 15:00:00'),
('https://www.youtube.com/watch?v=nfWlot6h_JM', 7, '2022-02-07 16:00:00'),
('https://www.youtube.com/watch?v=Jgk8WYwzVaY', 1, '2022-02-08 17:00:00'),
('https://www.youtube.com/watch?v=Jgk8WYwzVaY', 2, '2022-02-09 18:00:00'),
('https://www.youtube.com/watch?v=Jgk8WYwzVaY', 3, '2022-02-10 19:00:00'),
('https://www.youtube.com/watch?v=3tmd-ClpJxA', 4, '2022-02-11 20:00:00'),
('https://www.youtube.com/watch?v=3tmd-ClpJxA', 5, '2022-02-12 21:00:00'),
('https://www.youtube.com/watch?v=3tmd-ClpJxA', 6, '2022-02-13 22:00:00'),
('https://www.youtube.com/watch?v=8xg3vE8Ie_E', 7, '2022-02-14 23:00:00'),
('https://www.youtube.com/watch?v=8xg3vE8Ie_E', 1, '2022-02-15 00:00:00'),
('https://www.youtube.com/watch?v=8xg3vE8Ie_E', 2, '2022-02-16 01:00:00'),
('https://www.youtube.com/watch?v=VuNIsY6JdUw', 3, '2022-02-17 02:00:00'),
('https://www.youtube.com/watch?v=VuNIsY6JdUw', 4, '2022-02-18 03:00:00'),
('https://www.youtube.com/watch?v=VuNIsY6JdUw', 5, '2022-02-19 04:00:00');

-- Insert upload_request
INSERT INTO upload_request (uploader_id, channel_id, video_url, upload_date, upload_time) VALUES
(8, 1, 'https://www.youtube.com/watch?v=e-ORhEE9VVg', '2022-02-20', '2022-02-20 10:00:00'),
(8, 1, 'https://www.youtube.com/watch?v=nfWlot6h_JM', '2022-02-22', '2022-02-22 11:00:00'),
(8, 1, 'https://www.youtube.com/watch?v=Jgk8WYwzVaY', '2022-02-22', '2022-02-22 11:00:00'),
(8, 2, 'https://www.youtube.com/watch?v=3tmd-ClpJxA', '2022-02-23', '2022-02-23 12:00:00'),
(8, 2, 'https://www.youtube.com/watch?v=8xg3vE8Ie_E', '2022-02-23', '2022-02-23 12:00:00'),
(8, 2, 'https://www.youtube.com/watch?v=VuNIsY6JdUw', '2022-02-25', '2022-02-25 13:00:00');



-- Q5. Find the minimum and maximum age of viewers who watched the
-- most commented on video on Taylor Swift’s channel.
-- Display the video title, minimum age and the maximum age.

select v.title,
       MIN(viewer.age) as min_age,
       MAX(viewer.age) as max_age
from video v
join viewer_log vl on v.video_url = vl.video_url
join user viewer on viewer.user_id = vl.viewer_id
where v.video_url in (
        select v2.video_url
        from user owner
        join channel c2 on owner.user_id = c2.owner_user_id
        join upload_request r on c2.channel_id = r.channel_id
        join video v2 on r.video_url = v2.video_url
        join comment ct on ct.video_url = v2.video_url
        where owner.name = 'Taylor Swift'
        group by v2.video_url
        having count(ct.comment_id) = (
            select max(total_cmt.cmt_sum)
            from (
                select count(comment.comment_id) as cmt_sum
                from comment
                group by comment.video_url
                 )as total_cmt
            )
    )
group by v.video_url
;


