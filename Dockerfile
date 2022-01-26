# -------------------------------------------------------------------
# Minimal dockerfile from alpine base
#
# Instructions:
# =============
# 1. Create an empty directory and copy this file into it.
#
# 2. Create image with: 
#	docker build --tag timeoff:latest .
#
# 3. Run with: 
#	docker run -d -p 3000:3000 --name alpine_timeoff timeoff
#
# 4. Login to running container (to update config (vi config/app.json): 
#	docker exec -ti --user root alpine_timeoff /bin/sh
# --------------------------------------------------------------------
FROM node:16

EXPOSE 3000

WORKDIR /app
RUN git clone https://github.com/PredatorCode/timeoff-management-application.git timeoff-management
WORKDIR /app/timeoff-management
#RUN git checkout tags/1.4.0
RUN apt-get update \
    && apt-get install -y postgresql-client
RUN npm install postgresql-client && npm install
#RUN npm install

CMD npm start

