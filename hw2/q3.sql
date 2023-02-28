-- MySQL 8.0.32


-- drop tables
drop table if exists subscribe cascade;

drop table if exists channel cascade;

drop table if exists video_consumer cascade;

drop table if exists video_creator cascade;

drop table if exists user cascade;



CREATE TABLE user (
  user_id INT AUTO_INCREMENT,
  name VARCHAR(255) NOT NULL,
  email VARCHAR(255) NOT NULL,

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
    creation_time datetime,

    primary key (channel_id),
    foreign key (owner_user_id) references video_creator(user_id)

);

# based on sample in rubrics HW1, assume the 'channel_id' here is the 'channel_name'
create table subscribe(
    subscription_id int auto_increment,
    channel_id int,
    subscriber_id int,
    subscription_type ENUM('paid', 'free') NOT NULL,

    primary key (subscription_id, channel_id, subscriber_id),
    foreign key (channel_id) references channel(channel_id),
    foreign key (subscriber_id) references video_consumer(user_id)
);


# data creation
# 162 rows of user data
insert into user (name, email) values
  ('John Doe', 'johndoe@example.com'),
  ('Jane Smith', 'janesmith@example.com'),
  ('Bob Johnson', 'bobjohnson@example.com'),
  ('Sarah Lee', 'sarahlee@example.com'),
  ('Tom Wilson', 'tomwilson@example.com'),
  ('Amanda Davis', 'amandadavis@example.com'),
  ('Mike Brown', 'mikebrown@example.com'),
  ('Emily Taylor', 'emilytaylor@example.com'),
  ('David Jones', 'davidjones@example.com'),
  ('Jessica Miller', 'jessicamiller@example.com'),
  ('Mark Wilson', 'markwilson@example.com'),
  ('Julia Davis', 'juliadavis@example.com'),
  ('Chris Johnson', 'chrisjohnson@example.com'),
  ('Laura Lee', 'lauralee@example.com'),
  ('Erica Thomas', 'ericathomas@example.com'),
  ('Adam Smith', 'adamsmith@example.com'),
  ('Stephanie Brown', 'stephaniebrown@example.com'),
  ('Benjamin Davis', 'benjamindavis@example.com'),
  ('Rachel Jones', 'racheljones@example.com'),
  ('Kevin Wilson', 'kevinwilson@example.com'),
  ('Maria Garcia', 'mariagarcia@example.com'),
  ('Jason Smith', 'jasonsmith@example.com'),
  ('Linda Johnson', 'lindajohnson@example.com'),
  ('Matthew Lee', 'matthewlee@example.com'),
  ('Olivia Davis', 'oliviadavis@example.com'),
  ('Andrew Jones', 'andrewjones@example.com'),
  ('Vanessa Taylor', 'vanessataylor@example.com'),
  ('Christopher Johnson', 'christopherjohnson@example.com'),
  ('Karen Wilson', 'karenwilson@example.com'),
  ('Joshua Davis', 'joshuadavis@example.com'),
  ('Lauren Jones', 'laurenjones@example.com'),
  ('Ryan Wilson', 'ryanwilson@example.com'),
  ('Ashley Garcia', 'ashleygarcia@example.com'),
  ('Steven Smith', 'stevensmith@example.com'),
  ('Susan Johnson', 'susanjohnson@example.com'),
  ('Brian Lee', 'brianlee@example.com'),
  ('Natalie Davis', 'nataliedavis@example.com'),
  ('Timothy Jones', 'timothyjones@example.com'),
  ('Caroline Taylor', 'carolinetaylor@example.com'),
  ('William Johnson', 'williamjohnson@example.com'),
  ('Hannah Wilson', 'hannahwilson@example.com'),
  ('Patrick Davis', 'patrickdavis@example.com'),
  ('Rebecca Jones', 'rebeccajones@example.com'),
  ('Eric Wilson', 'ericwilson@example.com'),
  ('Christine Garcia', 'christinegarcia@example.com'),
  ('Jacob Smith', 'jacobsmith@example.com'),
  ('Megan Johnson', 'meganjohnson@example.com'),
  ('Brandon Lee', 'brandonlee@example.com'),
  ('Samantha Davis', 'samanthadavis@example.com'),
  ('Gregory Jones', 'gregoryjones@example.com'),
  ('Courtney Taylor', 'courtneytaylor@example.com'),
  ('Nicholas Wilson', 'nicholaswilson@example.com'),
  ('Katherine Garcia', 'katherinegarcia@example.com'),
  ('Daniel Smith', 'danielsmith@example.com'),
  ('Taylor Johnson', 'taylorjohnson@example.com'),
  ('Adam Parker', 'adamparker@example.com'),
  ('Allison Scott', 'allisonscott@example.com'),
  ('Brendan Lee', 'brendanlee@example.com'),
  ('Carly Davis', 'carlydavis@example.com'),
  ('Charlie Kim', 'charliekim@example.com'),
  ('Claire Johnson', 'clairejohnson@example.com'),
  ('Cody Wilson', 'codywilson@example.com'),
  ('Diana Garcia', 'dianagarcia@example.com'),
  ('Dominic Smith', 'dominicsmith@example.com'),
  ('Elise Jones', 'elisejones@example.com'),
  ('Elliott Wilson', 'elliottwilson@example.com'),
  ('Emilia Davis', 'emiliadavis@example.com'),
  ('Ethan Johnson', 'ethanjohnson@example.com'),
  ('Fiona Lee', 'fionalee@example.com'),
  ('Gina Taylor', 'ginataylor@example.com'),
  ('Graham Wilson', 'grahamwilson@example.com'),
  ('Haley Davis', 'haleydavis@example.com'),
  ('Hayden Kim', 'haydenkim@example.com'),
  ('Isaac Garcia', 'isaacgarcia@example.com'),
  ('Isabella Smith', 'isabellasmith@example.com'),
  ('Jack Johnson', 'jackjohnson@example.com'),
  ('Jasmine Lee', 'jasminelee@example.com'),
  ('Jaxon Wilson', 'jaxonwilson@example.com'),
  ('Jenna Davis', 'jennadavis@example.com'),
  ('Jesse Kim', 'jessekim@example.com'),
  ('Joey Johnson', 'joeyjohnson@example.com'),
  ('Jordan Taylor', 'jordantaylor@example.com'),
  ('Josh Kim', 'joshkim@example.com'),
  ('Julian Smith', 'juliansmith@example.com'),
  ('Kara Lee', 'karalee@example.com'),
  ('Katie Wilson', 'katiewilson@example.com'),
  ('Kayla Davis', 'kayladavis@example.com'),
  ('Kelsey Garcia', 'kelseygarcia@example.com'),
  ('Kenzie Jones', 'kenziejones@example.com'),
  ('Kyle Kim', 'kylekim@example.com'),
  ('Landon Johnson', 'landonjohnson@example.com'),
  ('Leah Taylor', 'leahtaylor@example.com'),
  ('Leo Smith', 'leosmith@example.com'),
  ('Lila Wilson', 'lilawilson@example.com'),
  ('Lilly Davis', 'lillydavis@example.com'),
  ('Logan Kim', 'logankim@example.com'),
  ('Lucas Garcia', 'lucasgarcia@example.com'),
  ('Lucy Jones', 'lucyjones@example.com'),
  ('Luke Johnson', 'lukejohnson@example.com'),
  ('Maddie Lee', 'maddielee@example.com'),
  ('Madison Wilson', 'madisonwilson@example.com'),
  ('Maggie Davis', 'maggiedavis@example.com'),
  ('Makayla Kim', 'makaylakim@example.com'),
  ('Mason Smith', 'masonsmith@example.com'),
  ('Maya Garcia', 'mayagarcia@example.com'),
  ('Megan Johnson', 'meganjohnson@example.com'),
  ('Melanie Taylor', 'melanietaylor@example.com'),
  ('Mia Lee', 'mialee@example.com'),
  ('Nathan Brown', 'nathanbrown@example.com'),
  ('Nina Thompson', 'ninathompson@example.com'),
  ('Oliver Scott', 'oliverscott@example.com'),
  ('Paige Davis', 'paigedavis@example.com'),
  ('Parker Lee', 'parkerlee@example.com'),
  ('Penelope Kim', 'penelopekim@example.com'),
  ('Peyton Johnson', 'peytonjohnson@example.com'),
  ('Phoenix Garcia', 'phoenixgarcia@example.com'),
  ('Piper Smith', 'pipersmith@example.com'),
  ('Quinn Wilson', 'quinnwilson@example.com'),
  ('Reagan Davis', 'reagandavis@example.com'),
  ('Rebecca Kim', 'rebeccakim@example.com'),
  ('Riley Johnson', 'rileyjohnson@example.com'),
  ('Ryan Taylor', 'ryantaylor@example.com'),
  ('Sadie Lee', 'sadielee@example.com'),
  ('Samuel Smith', 'samuelsmith@example.com'),
  ('Sara Davis', 'saradavis@example.com'),
  ('Savannah Kim', 'savannahkim@example.com'),
  ('Scarlett Johnson', 'scarlettjohnson@example.com'),
  ('Sebastian Garcia', 'sebastiangarcia@example.com'),
  ('Sienna Wilson', 'siennawilson@example.com'),
  ('Sophia Davis', 'sophiadavis@example.com'),
  ('Stella Kim', 'stellakim@example.com'),
  ('Summer Johnson', 'summerjohnson@example.com'),
  ('Sydney Taylor', 'sydneytaylor@example.com'),
  ('Tanner Lee', 'tannerlee@example.com'),
  ('Tatum Smith', 'tatumsmith@example.com'),
  ('Taylor Wilson', 'taylorwilson@example.com'),
  ('Thalia Davis', 'thaliadavis@example.com'),
  ('Theo Kim', 'theokim@example.com'),
  ('Thomas Johnson', 'thomasjohnson@example.com'),
  ('Timothy Garcia', 'timothygarcia@example.com'),
  ('Tristan Lee', 'tristanlee@example.com'),
  ('Tyler Smith', 'tylersmith@example.com'),
  ('Valerie Wilson', 'valeriewilson@example.com'),
  ('Victoria Davis', 'victoriadavis@example.com'),
  ('Vincent Kim', 'vincentkim@example.com'),
  ('Violet Johnson', 'violetjohnson@example.com'),
  ('Vivian Taylor', 'viviantaylor@example.com'),
  ('Wesley Lee', 'wesleylee@example.com'),
  ('William Smith', 'williamsmith@example.com'),
  ('Wyatt Wilson', 'wyattwilson@example.com'),
  ('Xander Davis', 'xanderdavis@example.com'),
  ('Xavier Kim', 'xavierkim@example.com'),
  ('Yara Johnson', 'yarajohnson@example.com'),
  ('Yasmine Taylor', 'yasminetaylor@example.com'),
  ('Yvette Lee', 'yvettelee@example.com'),
  ('Zachary Smith', 'zacharysmith@example.com'),
  ('Zara Davis', 'zaradavis@example.com'),
  ('Zeke Kim', 'zekkim@example.com'),
  ('Zoe Johnson', 'zoejohnson@example.com'),
  ('Zuri Wilson', 'zuriwilson@example.com'),
  ('Abby Brown', 'abbybrown@example.com'),
  ('Adrian Thompson', 'adrianthompson@example.com');


# creator 1 has channel: 1, 2, 3, subscribers:(120, 20, 161) sum=301
# creator 2 has channel: 4, 5, subscribers:(50， 110）sum=160
# creator 3 has channel: 6, 7, subscribers:(160, 40) sum=200
INSERT INTO video_creator (user_id, subscriber_count)
VALUES
  (1, 301),
  (2, 160),
  (3, 200);

# assuming video creators can subscribe their own channel as a video consumer
# channel 1 has subscribers' id from 1 to 120, paid, 2023-01-01, owner1
# channel 2 has subscribers' id from 1 to 20, paid, 2023-01-01, owner1
# channel 3 has subscribers' id from 1 to 161, paid, 2023-01-01, owner1
# channel 4 has subscribers' id from 1 to 50, free, 2020-01-01, owner2
# channel 5 has subscribers' id from 1 to 110, paid, 2023-01-01, owner2
# channel 6 has subscribers' id from 1 to 160, free, 2020-01-01, owner3
# channel 7 has subscribers' id from 1 to 40, free, 2023-01-01, owner3
insert into channel(channel_id, channel_name, owner_user_id, creation_date, creation_time)
values
    (1, 'Marvel Movies', 1, '2023-01-01', '2023-01-01 12:00:00'),
    (2, 'Marvel FreeVideo', 1, '2023-01-01', '2023-01-01 12:00:00'),
    (3, 'Music', 1, '2023-01-01', '2023-01-01 12:00:00'),
    (4, 'Action Movies', 2, '2020-01-01', '2020-01-01 12:00:00'),
    (5, 'Rock Music', 2, '2023-01-01', '2023-01-01 12:00:00'),
    (6, 'Studios', 3, '2020-01-01', '2020-01-01 12:00:00'),
    (7, 'Microsoft', 3, '2023-01-01', '2023-01-01 12:00:00');


insert into video_consumer(user_id, subscriber_count)
select user_id, 0 from user;

# subscribe channel 1
update video_consumer
set subscriber_count = subscriber_count + 1
where user_id <= 120;

insert into subscribe(channel_id, subscriber_id, subscription_type)
select 1, user_id, 'paid'
from video_consumer;

# subscribe channel 2
update video_consumer
set subscriber_count = subscriber_count + 1
where user_id <= 20;

insert into subscribe(channel_id, subscriber_id, subscription_type)
select 2, user_id, 'paid'
from video_consumer
where user_id <= 20;

# subscribe channel 3
update video_consumer
set subscriber_count = subscriber_count + 1
where user_id <= 161;

insert into subscribe(channel_id, subscriber_id, subscription_type)
select 3, user_id, 'paid'
from video_consumer
where user_id <= 161;

# subscribe channel 4
update video_consumer
set subscriber_count = subscriber_count + 1
where user_id <= 50;

insert into subscribe(channel_id, subscriber_id, subscription_type)
select 4, user_id, 'free'
from video_consumer
where user_id <= 50;

# subscribe channel 5
update video_consumer
set subscriber_count = subscriber_count + 1
where user_id <= 110;

insert into subscribe(channel_id, subscriber_id, subscription_type)
select 5, user_id, 'paid'
from video_consumer
where user_id <= 110;

# subscribe channel 6
update video_consumer
set subscriber_count = subscriber_count + 1
where user_id <= 60;

insert into subscribe(channel_id, subscriber_id, subscription_type)
select 6, user_id, 'free'
from video_consumer
where user_id <= 60;

# subscribe channel 7
update video_consumer
set subscriber_count = subscriber_count + 1
where user_id <= 40;

insert into subscribe(channel_id, subscriber_id, subscription_type)
select 7, user_id, 'free'
from video_consumer
where user_id <= 40;



select user.name, user.email, c.channel_name, vc.subscriber_count
from user
join video_creator vc on user.user_id = vc.user_id
join channel c on vc.user_id = c.owner_user_id
join subscribe s on c.channel_id = s.channel_id
where s.subscription_type = 'paid' and c.creation_date='2023-01-01'
group by c.channel_id
having count(*) > 100;





