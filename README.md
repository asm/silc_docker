# SILC Docker
Simple docker file for SILC 

## Build and create
Do this once:

   docker build . -t silc
   docker container create --name silc -it silc

## Run
Your keys and config will be stored in a docker volume attached to the container above.  To reuse them, run:

   docker start -i silc
