## Installing Robot Service on Linux

Follow the steps below to install the robot.service in raspberry pi

```
# move to the services directory
$ sudo cp robot.service /etc/systemd/system

# start the service
$ sudo systemctl start robot.service
$ sudo systemctl enable robot.service

```