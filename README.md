# divvy-rush
---

A simple web app that tracks the status of all 300 Divvy stations in Chicago.

Uses sidekiq and redis to manage the API calls to Divvy, which occur every minute. The clockwork gem handles scheduling the CRON jobs.

A work in progress. Next step is to incorporate google maps api. I need to find the time to work on it though. I also need to find a cheap server, because $35 for heroku to run a full-time worker per month is lame.

Tweet me: @graytist