# Albion Offline

This is the source repository for the Albion Offline discord bot - If you are looking to add the bot to your server, then you can do so by visiting. 

[This Link](https://discordapp.com/api/oauth2/authorize?client_id=680919042130837539&permissions=3072&scope=bot)

Once the bot has joined your server, verify that the `Albion Offline` role can view the channel, and then have any user with the "Administrator", "Manage Server" or "Manage Channel" Discord permissions, enable the bot by sending `@status toggle` to the channel you would like to recieve updates. Repeat these steps for any other channels you would like to receive notifications.

# What does it do?
Albion Offline is a Discord bot which provides live updates regarding the Albion Online server status, some examples of notifications, can be seen below.

![Server Up](images/up.gif)


![Server Down](images/down.gifv)


# Building and deploying with Docker
The included Dockerfile can be used to create a container to run the bot.

First, add your discord bot token to the Dockerfile (where it says --discordToken= ...)

Build the image:

docker build -t albion_offline_image .

Run the image:

docker container run --publish 8000:8080 --detach --name albionoffline albion_offline_image
