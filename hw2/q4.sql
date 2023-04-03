-- MySQL 8.0.32

-- Q4. Find the average sentiment score for each keyword category.
-- Display the keyword name along with average score
-- such that the highest score is displayed first.

-- drop tables for debugging or testing
# drop table if exists comment cascade;
#
# drop table if exists informational_video cascade;
#
# drop table if exists user cascade;
#
# drop table if exists video cascade;



create table video (
    video_url varchar(255),
    title varchar(255),
#     category varchar(255),
    primary key (video_url)
);

create table user(
    user_id int auto_increment,
    name varchar(255),
    email varchar(255),

    primary key (user_id)
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

create table informational_video(
    video_url varchar(255),
    keyword varchar(255),

    foreign key (video_url) references video(video_url)
);

# create table entertainment_video(
#     video_url varchar(255),
#     tag varchar(255),
#
#     primary key (video_url),
#     foreign key (video_url) references video(video_url)
# );

insert into user (name, email)
values
  ('Karen Wilson', 'karenwilson@example.com'),
  ('Joshua Davis', 'joshuadavis@example.com'),
  ('Lauren Jones', 'laurenjones@example.com');


INSERT INTO video (video_url, title)
VALUES
  ('https://www.youtube.com/watch?v=abc123', '10 Delicious and Easy Food Recipes'),
  ('https://www.youtube.com/watch?v=def456', '5 Quick and Healthy Breakfast Ideas'),
  ('https://www.youtube.com/watch?v=ghi789', 'How to Make the Perfect Grilled Cheese Sandwich' ),
  ('https://www.youtube.com/watch?v=jkl012', 'Top 10 Sports Cars of 2022' ),
  ('https://www.youtube.com/watch?v=mno345', '2022 Tesla Model S Test Drive and Review' ),
  ('https://www.youtube.com/watch?v=pqr678', 'The Best Budget Cars of 2022' ),
  ('https://www.youtube.com/watch?v=stu901', 'Introduction to Artificial Intelligence' ),
  ('https://www.youtube.com/watch?v=vwx345', 'How to Learn Data Science for Free' ),
  ('https://www.youtube.com/watch?v=klm678', 'The History of Ancient Rome: A Crash Course' ),
  ('https://www.youtube.com/watch?v=nop123', 'What is Artificial Intelligence?' ),
  ('https://www.youtube.com/watch?v=qwe456', 'The Future of AI and Machine Learning' ),
  ('https://www.youtube.com/watch?v=asd789', 'How AI is Changing Healthcare' ),
  ('https://www.youtube.com/watch?v=zxc012', '5 Easy and Delicious Cookout Recipes' ),
  ('https://www.youtube.com/watch?v=klm789', 'The Basics of Baking: How to Make Perfect Cookies' ),
  ('https://www.youtube.com/watch?v=def012', '10 Minute Meals: Quick and Easy Dinner Ideas' );


-- assume different commenter can comment on one video,
-- and one user can comment multiple times on one video
insert into comment (video_url, commenter_id, comment_text, sentiment)
values
  ('https://www.youtube.com/watch?v=abc123', 1, 'good', 5),
  ('https://www.youtube.com/watch?v=abc123', 2, 'i dont like it', 3),
  ('https://www.youtube.com/watch?v=abc123', 3, 'so cute', 8),
  ('https://www.youtube.com/watch?v=def456', 2, 'excellent', 9),
  ('https://www.youtube.com/watch?v=ghi789', 3, 'very good', 6),
#   ('https://www.youtube.com/watch?v=jkl012', 2, 'bad', 4),
#   ('https://www.youtube.com/watch?v=mno345', 3, 'not bad',7),
#   ('https://www.youtube.com/watch?v=pqr678', 1, 'awesome', 9),
  ('https://www.youtube.com/watch?v=stu901', 2, 'perfect', 10),
  ('https://www.youtube.com/watch?v=vwx345', 1, 'nice', 8),
  ('https://www.youtube.com/watch?v=klm678', 3, 'looks good', 7),
  ('https://www.youtube.com/watch?v=nop123', 3, 'excellent', 10),
  ('https://www.youtube.com/watch?v=qwe456', 1, 'beautiful', 8),
  ('https://www.youtube.com/watch?v=asd789', 2, 'ugly', 3),
  ('https://www.youtube.com/watch?v=zxc012', 1, 'rude', 4),
  ('https://www.youtube.com/watch?v=klm789', 2, 'delicious', 8),
  ('https://www.youtube.com/watch?v=def012', 3, 'sucks', 3),
  ('https://www.youtube.com/watch?v=def012', 3, 'looks better now', 7);



insert into informational_video(video_url, keyword)
values
  ('https://www.youtube.com/watch?v=abc123', 'Foods'),
  ('https://www.youtube.com/watch?v=def456', 'Foods'),
  ('https://www.youtube.com/watch?v=def456', 'Cook'),
  ('https://www.youtube.com/watch?v=ghi789', 'Foods'),
  ('https://www.youtube.com/watch?v=ghi789', 'Cook'),
  ('https://www.youtube.com/watch?v=jkl012', 'Cars'),
  ('https://www.youtube.com/watch?v=mno345', 'Cars'),
  ('https://www.youtube.com/watch?v=pqr678', 'Cars'),
  ('https://www.youtube.com/watch?v=stu901', 'Education'),
  ('https://www.youtube.com/watch?v=stu901', 'AI'),
  ('https://www.youtube.com/watch?v=vwx345', 'Education'),
  ('https://www.youtube.com/watch?v=klm678', 'Education'),
  ('https://www.youtube.com/watch?v=nop123', 'AI'),
  ('https://www.youtube.com/watch?v=qwe456', 'AI'),
  ('https://www.youtube.com/watch?v=asd789', 'AI'),
  ('https://www.youtube.com/watch?v=zxc012', 'Cook'),
  ('https://www.youtube.com/watch?v=klm789', 'Cook'),
  ('https://www.youtube.com/watch?v=def012', 'Cook');

-- Q4. Find the average sentiment score for each keyword category.
-- Display the keyword name along with average score
-- such that the highest score is displayed first.

# https://piazza.com/class/lcpi8pdga7s186/post/495

select keyword,
       -- if there is no comment on this keyword of videos, the score will be zero
       IF(avg(c.sentiment) is NULL, 0, avg(c.sentiment)) AS average_score -- calculate avg sentiment score
from informational_video iv
left join comment c on iv.video_url = c.video_url -- left join for keywords, comment may not exist
group by keyword
order by average_score desc; -- highest score display first, desc order


