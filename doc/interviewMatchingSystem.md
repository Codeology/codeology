Design Document for Interview Matching System
=============================================

## Userflow
1. Log in (already implemented)
2. Post time availability (backlog: # of interviews)
   - Copy Interviewing.io design
<<<<<<< c1e98e88dffce532704bd36be45df7c48edde093
   - Utilize ~~30 minute~~ hour intervals ~~as opposed to hourly~~
=======
   - Utilize 30 minute intervals as opposed to hourly
>>>>>>> Updated Design Doc
   - Able to modify availability
3. Receive Email once an interviewee signs up for a slot
   - No overbooking (2 interviews at same time)
     - Look into Mutex/Locks for ruby if necessary
<<<<<<< c1e98e88dffce532704bd36be45df7c48edde093
     - ~~Look into [simplybook.me api](https://simplybook.me/api/developer-api "simplybook.me api documentation")~~ (too expensive)
=======
     - Look into [simplybook.me api](https://simplybook.me/api/developer-api "simplybook.me api documentation")
>>>>>>> Updated Design Doc
4. Can view upcoming matches/interviews on dashboard

## Tasks

<<<<<<< c1e98e88dffce532704bd36be45df7c48edde093
### Task 1: Database Schema

#### Tables and Models to implement (tables to be designed - only high level view for now)
1. Calendar 
   - Table that represents the aggregate data of Interviewer Availability
   - Used for interviewees to view available timeslots
   - Show a week in advance
     - Reset at 00:00 -> delete current day and add day at end of table
       - i.e. delete sunday, add next week's sunday at end of current week.
   - 7 x 24 hour slots
     - Every entry will have a counter representing # of interviewers for that slot
     - if 0: unavailable; if > 0: available
   - Update on every availability update by inc/decrementing the counter
     - decrement if no available persons
     - increment if new available person

2. User Interview Data (modify existing table?)
   - Store upcoming interviews to view on dashboard
   - Store past interviews so user can look at past progression/feedback
   - Store availility time slots to be pulled to Calendar model
   - Store Max Interviews a week
   - Store two counters *current_week* and *next_week* to keep track of limits

### Task 2: Post time (controller and model)
=======
### Task 1: Post time (controller and model)
>>>>>>> Updated Design Doc

#### Constraints and Considerations
1. Users may specify how many interviews they can be scheduled for within varying amounts of availability
   - e.g. 1 interview on Sunday anytime between 2-5 pm
   - e.g. 2 interviews this week any day during 10-11 am
2. Should postings be public? - Yes (for interviewees to see)
   - Users can just manually match (sign up for interviewer's slot)
3. If multiple interviewers are available during same time slot and someone signs up for that slot how do we decide who to pair up with?
   - Random?
   - Least paired with (would require counters for each interviewer)
4. Users may only sign up for a limited amount of mock interviews per week (as to not have someone take all slots)
   - Perhaps some load balancing algo needed
   - Limit to 2 at a time?

#### Architecture
1. Time data abstraction (library?)
   - Simpler data is better for manipulation
2. Interviewer vs. Interviewee different submission pages
   - Interviewer:
     - How often? "We'll never schedule more than _x_ a week"
     - When? "I'm available from _y_ to _z_ on _w_"
     - Upcoming unavailable Dates: used to mark off days
   - Interviewee:
     - Select 1 hour slot from interviewers' availabilities
3. Central data table for all interviewer availabilities
   - This model will be used to display slots(current postings) for interviewees
   - Bookings modify this table and subsequently individual interviewer data
4. Individual data tables for each user for their specific availabilities (We probably won't need this)
   - This model will be used to display slots(current postings) on interviewer's dashboard
   - Data here is pushed to central data table
   - Bookings are pulled from central data table for updates
5. Individual data tables for each interviewee that store their upcoming interviews
   - Data here is pushed to user dashboard to view upcoming interviews
   - Data received from controller when user submits a successful interview request

#### Data Structures and Functions
1. Form for POSTing availability data to server
   - Checks if interviewer is already booked at that time
2. Form for POSTing request data (when interviewee wants an interview) to server
<<<<<<< c1e98e88dffce532704bd36be45df7c48edde093
3. bookSlot (for interviewees)
   - Books a slot for an interviewee
   - Modifies slot table
   - Modifies upcoming interview table
   - Returns success or fail
   - Removes slot from slot table
4. pullAllAvailability (for interviewees)
   - Pulls data from slot table for all availabilities for interviewees to see when choosing an interview slot
5. pullAvailability (for interviewers)
   - Pulls data from slot table for posted slots for dashboard display
7. pullInterviews (for both)
   - Pulls data from upcoming interview data table for upcoming interviews for dashboard display
8. cancelInterview (for both)
   - Delete interview from upcoming interview table
=======
3. pushAvailability
   - Pushes new interviewer availability data to central data table
4. bookSlot (for interviewees)
   - Books a slot for an interviewee
   - Modifies central data table
   - Returns success or fail
   - Decrements interviewer's # of available interviews
5. pullAllAvailability (for interviewees)
   - Pulls data from central data table for all availabilities for interviewees to see when choosing an interview slot
6. pullAvailability (for interviewers)
   - Pulls data from individual data table for posted slots for dashboard display
7. pullInterviews (for both)
   - Pulls data from individual data table for upcoming interviews for dashboard display
8. cancelInterview (for both)
   - Sends cancellation to both parties' data tables to delete interview
>>>>>>> Updated Design Doc
   - Attach notification to other party's data table to display cancellation on dashboard
   - Send email for cancellation
   - (optional) attach message as to why interview is cancelled
9. updateAvailability (could possibly just reuse pushAvailability)
<<<<<<< c1e98e88dffce532704bd36be45df7c48edde093
   - Modify slot table
   - Can add new ones or delete old ones

## Task 3: Implement views (Front End)
=======
   - Modify interviewer's slots

## Task 2: Implement views
>>>>>>> Updated Design Doc

#### Views
1. Dashboard
2. Submit (interviewer)
3. Submit (interviewee)
4. SubmitCancellation (both)
5. Successful submit (interviewer) (not sure if 2 or 1 successful submit page needed yet)
6. Successful submit (interviewee)
7. Successful cancellation (both)
8. Fail(submit/cancel) (both)


## Deprecated

### Task x: Automatic Matchmaking
1. Will need to do further research on algorithms before I fill this in
2. WIP/TBD/OMW/DMR/ETC

#### Constraints and Considerations
1. Users cannot be booked for multiple interviews at the same time
2. Users can only be booked with another of the opposite type (interview/interviewee)
3. Should users only be allowed 1 match at a time?
   - Makes matching making simpler
   - Perhaps give prompt for user to "Continue searching for additional matches" to schedule more than 1 interview at a time
     - This would allow user to redefine their time availability if they wish (don't want 2 back-to-back interviews; or even worse 2 back-to-back with the same partner)
4. Need to ensure no one gets left out
   - Pair in a way s.t. everyone (optimally) gets a match
5. Optionally ensure variability
   - Match users with as many different users as possible
   - More coverage in subjective feedback and interview/er/ee styles
   - Enables better growth feedback (bigger difference after 1 week of practice as opposed to 1 day) between same pairings

#### Architecture
1. WIP/TBD/OMW/DMR/ETC
#### Data Structures, and Functions
1. WIP/TBD/OMW/DMR/ETC
