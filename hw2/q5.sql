-- Q5. Find the minimum and maximum age of viewers who watched the
-- most commented on video on Taylor Swift’s channel.
-- Display the video title, minimum age and the maximum age.


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
#     category varchar(255),
    primary key (video_url)
);


create table channel(
    channel_id int auto_increment,
    channel_name varchar(255),
    owner_user_id int not null ,
    creation_date date,
    creation_time datetime,

    primary key (channel_id),
    foreign key (owner_user_id) references user(user_id)
);


create table comment(
    comment_id int auto_increment,
    video_url varchar(255),
    commenter_id int,
    comment_text varchar(255),
    sentiment int,

    primary key (comment_id, video_url),
    foreign key (video_url) references video(video_url),
    foreign key (commenter_id) references user(user_id)
);
