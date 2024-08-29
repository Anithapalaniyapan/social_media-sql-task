CREATE DATABASE SocialMedia_Management;
USE SocialMedia_Management;

CREATE TABLE Users (
    user_id INT PRIMARY KEY AUTO_INCREMENT,
    username VARCHAR(50),
    email VARCHAR(100),
    password VARCHAR(50),
    full_name VARCHAR(100),
    bio TEXT,
    created_at DATETIME
);

INSERT INTO Users (username, email, password, full_name, bio, created_at)
 VALUES( 'anitha_deivanai', 'anitha@example.com', 'password123', 'Anitha', 'Photographer', '2024-08-23 10:00:00'),
( 'deepa_in', 'deepa@example.com', 'password123', 'deepa', 'Love nature!', '2024-08-23 11:00:00'),
('dynamic_kavi', 'kavidharani@example.com', 'password123', 'kavi', 'Music fan', '2024-08-22 09:00:00'),
('Jeeva_Kutty31', 'jeevadharani@example.com', 'password123', 'Jeeva', 'Food blogger', '2024-08-21 09:30:00'),
('itz_selva_12', 'selva@example.com', 'password123', 'selva', 'Gamer', '2024-08-20 10:00:00'),
('itz_kavi_tosh', 'parkavi@example.com', 'password123', 'Parkavi', 'movie buff', '2024-08-19 10:30:00'),
('codomo_Edtech', 'edtech@example.com', 'password123', 'CODOMO EDtech', 'Developer', '2024-08-15 11:00:00'),
('codi.vation', 'codevation@example.com', 'password123', 'Code', 'Tech geek', '2024-08-12 11:30:00'),
('Karthickrolf', 'karthick@example.com', 'password123', 'Karthick Rofl', 'Fitness lover', '2024-08-11 12:00:00'),
('Nizar_offl', 'Nizar@example.com', 'password123', 'Nizar', 'Fashionista', '2024-08-10 12:30:00');

SELECT * FROM Users;

CREATE TABLE Posts (
    post_id INT PRIMARY KEY AUTO_INCREMENT ,
    user_id INT,
    image_url VARCHAR(255),
    caption TEXT,
    created_at DATETIME,
    location VARCHAR(100),
    FOREIGN KEY (user_id) REFERENCES Users(user_id)
);

INSERT INTO Posts (user_id, image_url, caption, created_at, location)
 VALUES(1,'beach_sunset.jpg','Amazing beach sunset!', '2024-08-23 12:00:00', 'Beach'),
(2,'nature_hike.jpg','Nature hike vibes', '2024-08-23 12:30:00', 'Hiking Trail'),
(3,'music_festival.jpg','Music festival fun!', '2024-08-22 14:00:00', 'Festival Grounds'),
(4,'delicious_meal.jpg','Delicious meal!', '2024-08-21 14:30:00', 'Restaurant'),
(5,'gaming_setup.jpg','Awesome gaming setup', '2024-08-20 15:00:00', 'Home'),
(6,'movie_screen.jpg','Movie night', '2024-08-19 15:30:00', 'Home Theater'),
(7,'tech_conference.jpg','Tech conference highlights', '2024-08-15 16:00:00', 'Conference Hall'),
(8,'code_review.jpg','Code review session', '2024-08-12 16:30:00', 'Office'),
(9,'gym_workout.jpg','Great workout session', '2024-08-11 17:00:00', 'Gym'),
(10,'fashion_show.jpg','Fashion show event', '2024-08-10 17:30:00', 'Event Hall');

 SELECT * FROM Posts;
 
CREATE TABLE Comments (
    comment_id INT PRIMARY KEY AUTO_INCREMENT ,
    post_id INT,
    user_id INT,
    comment_text TEXT,
    created_at DATETIME,
    FOREIGN KEY (post_id) REFERENCES Posts(post_id),
    FOREIGN KEY (user_id) REFERENCES Users(user_id)
);

INSERT INTO Comments (post_id, user_id, comment_text, created_at)
 VALUES(1, 2, 'Looks stunning!', '2024-08-23 12:10:00'),
(1, 3, 'I wish I was there!', '2024-08-23 12:20:00'),
(2, 4, 'The views are incredible!', '2024-08-23 12:35:00'),
(3, 5, 'Sounds like an amazing time!', '2024-08-22 14:10:00'),
(4, 6, 'That looks delicious!', '2024-08-21 14:45:00'),
(5, 7, 'Nice setup!', '2024-08-20 15:20:00'),
(6, 8, 'Enjoy your movie night!', '2024-08-19 15:40:00'),
(7, 9, 'Great conference!', '2024-08-15 16:10:00'),
(8, 10, 'Nice coding session!', '2024-08-12 16:45:00'),
(9, 1, 'Good workout!', '2024-08-11 17:10:00');

SELECT * FROM Comments;

CREATE TABLE Likes (
    like_id INT PRIMARY KEY AUTO_INCREMENT ,
    post_id INT,
    user_id INT,
    created_at DATETIME,
    FOREIGN KEY (post_id) REFERENCES Posts(post_id),
    FOREIGN KEY (user_id) REFERENCES Users(user_id)
);

INSERT INTO Likes (post_id, user_id, created_at) 
VALUES(1, 3, '2024-08-23 12:15:00'),
(2, 4, '2024-08-23 12:40:00'),
(3, 5, '2024-08-22 14:20:00'),
(4, 6, '2024-08-21 15:00:00'),
(5, 7, '2024-08-20 15:10:00'),
(6, 8, '2024-08-19 15:30:00'),
(7, 9, '2024-08-15 16:20:00'),
(8, 10, '2024-08-12 16:50:00'),
(9, 1, '2024-08-11 17:20:00'),
(10, 2, '2024-08-10 17:40:00');

SELECT * FROM Likes;

CREATE TABLE Followers (
    follower_id INT  PRIMARY KEY AUTO_INCREMENT,
    user_id INT,
    follower_user_id INT,
    created_at DATETIME,
    FOREIGN KEY (user_id) REFERENCES Users(user_id),
    FOREIGN KEY (follower_user_id) REFERENCES Users(user_id)
);

SELECT * FROM Followers;

INSERT INTO Followers (user_id, follower_user_id, created_at) 
VALUES(1, 2, '2024-08-23 13:00:00'),
(1, 3, '2024-08-23 13:10:00'),
(2, 4, '2024-08-23 13:20:00'),
(3, 5, '2024-08-22 13:30:00'),
(4, 6, '2024-08-21 13:40:00'),
(5, 7, '2024-08-20 13:50:00'),
(6, 8, '2024-08-19 14:00:00'),
(7, 9, '2024-08-15 14:10:00'),
(8, 10, '2024-08-12 14:20:00'),
(9, 1, '2024-08-11 14:30:00');


CREATE TABLE DirectMessages (
    message_id INT  PRIMARY KEY AUTO_INCREMENT ,
    sender_id INT,
    receiver_id INT,
    message_text TEXT,
    sent_at DATETIME,
    FOREIGN KEY (sender_id) REFERENCES Users(user_id),
    FOREIGN KEY (receiver_id) REFERENCES Users(user_id)
);

INSERT INTO DirectMessages (sender_id, receiver_id, message_text, sent_at) 
VALUES(1, 2, 'How was the sunset?', '2024-08-23 14:00:00'),
(2, 1, 'It was amazing!', '2024-08-23 14:10:00'),
(3, 4, 'Hope you enjoyed the festival!', '2024-08-22 14:20:00'),
(4, 3, 'I did, thanks!', '2024-08-22 14:30:00'),
(5, 6, 'What games are you playing?', '2024-08-20 15:40:00'),
(6, 5, 'Just some FPS games.', '2024-08-20 15:50:00'),
(7, 8, 'How was the conference?', '2024-08-15 16:30:00'),
(8, 7, 'It was very insightful!', '2024-08-15 16:40:00'),
(9, 10, 'How did the fashion show go?', '2024-08-10 17:50:00'),
(10, 9, 'It was fantastic!', '2024-08-10 18:00:00');

SELECT * FROM DirectMessages;

CREATE TABLE Stories (
    story_id INT PRIMARY KEY AUTO_INCREMENT ,
    user_id INT,
    story_url VARCHAR(255),
    created_at DATETIME,
    expires_at DATETIME,
    FOREIGN KEY (user_id) REFERENCES Users(user_id)
);

INSERT INTO Stories (user_id, story_url, created_at, expires_at)
 VALUES(1, 'sunset_story.jpg', '2024-08-23 15:00:00', '2024-08-24 15:00:00'),
(2, 'nature_story.jpg', '2024-08-23 15:30:00', '2024-08-24 15:30:00'),
(3, 'music_story.jpg', '2024-08-22 16:00:00', '2024-08-23 16:00:00'),
(4, 'food_story.jpg', '2024-08-21 16:30:00', '2024-08-22 16:30:00'),
(5, 'gaming_story.jpg', '2024-08-20 17:00:00', '2024-08-21 17:00:00'),
(6, 'movie_story.jpg', '2024-08-19 17:30:00', '2024-08-20 17:30:00'),
(7, 'tech_story.jpg', '2024-08-15 18:00:00', '2024-08-16 18:00:00'),
(8, 'coding_story.jpg', '2024-08-12 18:30:00', '2024-08-13 18:30:00'),
(9, 'workout_story.jpg', '2024-08-11 19:00:00', '2024-08-12 19:00:00'),
(10, 'fashion_story.jpg', '2024-08-10 19:30:00', '2024-08-11 19:30:00');

SELECT * FROM stories;

CREATE TABLE StoryViews (
    view_id INT PRIMARY KEY AUTO_INCREMENT ,
    story_id INT,
    user_id INT,
    viewed_at DATETIME,
    FOREIGN KEY (story_id) REFERENCES Stories(story_id),
    FOREIGN KEY (user_id) REFERENCES Users(user_id)
);

SELECT * FROM  storyviews;

INSERT INTO StoryViews (story_id, user_id, viewed_at) 
VALUES(1, 2, '2024-08-23 15:10:00'),
(1, 3, '2024-08-23 15:20:00'),
(2, 4, '2024-08-23 15:40:00'),
(3, 5, '2024-08-22 16:10:00'),
(4, 6, '2024-08-21 16:40:00'),
(5, 7, '2024-08-20 17:10:00'),
(6, 8, '2024-08-19 17:40:00'),
(7, 9, '2024-08-15 18:10:00'),
(8, 10, '2024-08-12 18:40:00'),
(9, 1, '2024-08-11 19:10:00');

CREATE TABLE Hashtags (
    hashtag_id INT PRIMARY KEY AUTO_INCREMENT ,
    hashtag_text VARCHAR(50)
);

INSERT INTO Hashtags (hashtag_text)
 VALUES('#sunset'),
('#nature'),
('#music'),
('#food'),
('#gaming'),
('#movie'),
('#tech'),
('#coding'),
('#workout'),
('#fashion');

SELECT * FROM  hashtags;

CREATE TABLE PostHashtags (
    post_hashtag_id INT PRIMARY KEY AUTO_INCREMENT ,
    post_id INT,
    hashtag_id INT,
    FOREIGN KEY (post_id) REFERENCES Posts(post_id),
    FOREIGN KEY (hashtag_id) REFERENCES Hashtags(hashtag_id)
);

INSERT INTO PostHashtags (post_id, hashtag_id) 
VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5),
(6, 6),
(7, 7),
(8, 8),
(9, 9),
(10, 10);

SELECT * FROM  PostHashtags;

CREATE TABLE Notification (
    notification_id INT PRIMARY KEY AUTO_INCREMENT ,
    user_id INT,
    notification_text TEXT,
    created_at DATETIME,
    is_read BOOLEAN,
    FOREIGN KEY (user_id) REFERENCES Users(user_id)
);

INSERT INTO Notification (user_id, notification_text, created_at, is_read)
 VALUES(1, 'Your post received a new like!', '2024-08-23 17:00:00', FALSE),
(2, 'You have a new follower!', '2024-08-23 17:05:00', FALSE),
(3, 'Your story is trending!', '2024-08-22 17:10:00', FALSE),
(4, 'New comment on your post!', '2024-08-21 17:15:00', FALSE),
(5, 'Your direct message was read!', '2024-08-20 17:20:00', FALSE),
(6, 'Someone viewed your story!', '2024-08-19 17:25:00', FALSE),
(7, 'You have a new follower!', '2024-08-15 17:30:00', FALSE),
(8, 'Your post got a new like!', '2024-08-12 17:35:00', FALSE),
(9, 'Your story received a view!', '2024-08-11 17:40:00', FALSE),
(10, 'You received a new direct message!', '2024-08-10 17:45:00', FALSE);

SELECT * FROM Notification;

CREATE TABLE UserActivity (
    activity_id INT PRIMARY KEY AUTO_INCREMENT ,
    user_id INT,
    activity_type VARCHAR(50),
    activity_date DATETIME,
    FOREIGN KEY (user_id) REFERENCES Users(user_id)
);

INSERT INTO UserActivity (user_id, activity_type, activity_date) 
VALUES(1, 'Post', '2024-08-23 12:00:00'),
(2, 'Follow', '2024-08-23 13:00:00'),
(3, 'Story', '2024-08-22 16:00:00'),
(4, 'Comment', '2024-08-21 14:30:00'),
(5, 'Direct Message', '2024-08-20 15:00:00'),
(6, 'Story', '2024-08-19 17:00:00'),
(7, 'Post', '2024-08-15 16:00:00'),
(8, 'Story', '2024-08-12 18:00:00'),
(9, 'Post', '2024-08-11 17:00:00'),
(10, 'Story', '2024-08-10 19:00:00');

SELECT * FROM UserActivity;

SELECT 
    Users.username, 
    Users.full_name, 
    Posts.image_url, 
    Posts.caption, 
    Posts.created_at, 
    Posts.location
FROM 
    Posts
INNER JOIN 
    Users ON Posts.user_id = Users.user_id;
