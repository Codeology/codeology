Design Document for Interview Matching System
=============================================

## Userflow
1. Log in (already implemented)
2. Post time availability (backlog: # of interviews)
   - Copy when2meet's design?
   - Utilize 30 minute intervals as opposed to 15
   - Able to modify availability
   - No overbooking (2 interviews at same time)
3. Receive Email once a match has been made
4. Can view upcoming matches/interviews on dashboard

## Tasks

### Task 1: Post time

#### Constraints and Considerations
1. Users may specify how many interviews they can be scheduled for within varying amounts of availability
   - e.g. 1 interview on Sunday anytime between 2-5 pm
   - e.g. 2 interviews this week any day during 10-11 am
2. Users may or may not be able to post several times
   - e.g. posting for separate times
3. Should postings be public?
   - Probably not since we're copying interviewing.io's userflow
   - What if someone keeps posting but never gets results because no one else is matching their time?
   - Users can just manually match (sign up for someone's slot)

#### Architecture
1. Time data abstraction (library?)
   - Simpler data is better for manipulation
2. Interviewer vs. Interviewee different submission pages
   - Interviewer:
     - How often? "We'll never schedule more than _x_ a week"
     - When? "I'm available from _y_ to _z_ on _w_"
     - Upcoming unavailable Dates: used to mark off days
   - Interviewee:
     - Select 1 hour slots from interviewer's availabilities

#### Data Structures, and Functions
1. Form for POSTing availability data to server
2. Form for POSTing request data (when interviewee wants an interview) to server
3. WIP/TBD/OMW/DMR/ETC

### Task 2: Matchmaking
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
