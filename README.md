### Start with Docker

1. Clone this repository

2. Build and run docker container by ./docker/run.sh:

        bash <path-to-repo>/docker/run.sh

3. To open new bash session in container:

        bash <path-to-repo>/docker/into.sh

4. Find your service in container root directory.


5. To stop container:

        bash <path-to-repo>/docker/stop.sh

6. To remove docker-image:

        bash <path-to-repo>/docker/remove_image.sh


### Run Example

1. Generate corresponding zcm message types for python

        bash <path-to-repo>/generate_zcm_msgs.sh

2. Run Example

        python3 <path-to-repo>/simple_imu_reader.py

3. Run Log Player

        zcm-logplayer -u ipc <path-to-repo>/imu_orientus.zcm
