1. I designed the 'user' entity and it can either behave as a video creator or as a video consumer. 

    - as a creator:
        1) can upload videos
		* The system will create a record of 'video_metadata' entity, after uploading and processing the video file.  
		* After the video is available for watching, the system will generate a record of 
		  'video_static_data' entity for this video (If the video fail to publish due to some issue, the 'video_static_data'
		  will not create.)

        2) can create channels.
		* The user can decide the channel subscription type paid or free. 

	* 'subscriber_count' field in 'user' entity is the total subscribers for all the user's channels.


    - as a consumer:
        1) can watch videos.
		* The system will generate a record of 'watching_history' entity, when user watch a video. 
		* The 'video_statistic_data' entity will update. 		

        2) can subscribe channels with the balance
		* The 'balance' field in user entity is designed for the user's income balance. 
		  The balance can be earn from video profits, and also can be spend on any paid 
		  channels subscription. 
		* If the user successfully subscribe a channel, the system will add a 'subscribe_info' 
		  record.

        3) can comment on videos
		* The system will add a record of 'comment' entity, then update the 'video_statistic_data'.

        4) can like or dislike on videos
		* The system will update the 'video_statistic_data'. 
        
	* 'subscription_count' field in 'user' entity is the number of channel the user subscribed. 

		
2. 'Sponsor' entity is for sponsors which can sponsor different videos, and if it sponsored a video, the 
   System will generate a record of 'sponsor_video_info'. The 'sponsor_video_info' entity is for bridge the many to many relationship         
   between 'Video' and 'sponsor'. Each user's subscription or channels' subscribed number are recored in the field   
   'subscription_count' and 'subscribe_count'.


3. The 'category' entity is for categorizing the videos, and a user can search videos based on different 'tags' and 'keywords'. 


4. The relationship between 'user' and 'channel' is many to many, so I designed a 'subscribe_info' entity for recording every subscription. 


5. Each video can be watched by different user and each user can watch different video, so I designed a 'watching_history' diagram for bridge this many to many relationship.


6. A user can create multiple comments on one video. A video can have multiple comments from one or more users. 