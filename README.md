# Wolke Torrent

**Advisable to configure your own kubernetes cluster for gitlab runners instead of using shared runners** </br>

Wolke torrent provides a solution to this problem by downloading a torrent or a download url of choice in the cloud and transferring it to a shared google drive folder. There probably aren't any restrictions to download from google drive. Adding a file directly from the url to google drive without the user needed to download can be handy in some cases. </br>

## Self Hosting
The current code is not being hosted anywhere. The operations (pipeline) runs on the free Gitlab CI/CD runners which have no limitation for public repositories. Github also has the same feature. For Private repositories github and gitlab have a limitation of 2000 CI minutes, which should still be good enough. </br>

Google cloud offers a free $300 ($500 if you signup through gitlab) credits for fresh users. You can create a kubernetes cluster and configure it to work with gitlab and also github for CI/CD, if you want more control and security on where and how your pipelines run. Amazon's k8s clusters don't come under the free trail or AWS educate for students</br>
[Here](https://youtu.be/RAn4D7-_MrA) is a very good video explaining CI/CD of gitlab and how to use GKE with it. </br>

You would also need a service account for uploading to google drive without authentication, which can be a little tedious. Upon creating the account, you can create a json key which you can store in the CI/CD secrets of Gitlab and Github. I stored it with the name `WOLKE_TORRENT_KEY` which is being used in the pipeline. The folder to upload to can be changed in [`gdrive.py`](gdrive.py)</br>

CI/CD pipeline should be ideally used for code building, testing and deployment over multiple environments. This is just a cool experiment to examine a few possiblities. For a more "proper" solution, I would recommend hosting [cloud-torrent](https://github.com/jpillora/cloud-torrent) on Aws ec2 or Google GKE.

## How to Use
Fork the repo, in the [`to_download.sh`](to_download.sh) change the `NAME` to the file name you want the final zip with the downloaded content to have </br>
Add the magnet link or the torrent file path (relative to the root of the repo) in the `DOWNLOAD_LINK` variable </br>
If case of using a torrent file, add / upload a torrent file in your commit </br>

I am assuming pipelines run on pull requests too, I haven't tested it :p </br>
The safest way is to setup a service account and pipeline on your own, currently the pipeline gets triggered by commits. </br>
In case a pipeline is triggered, your file will be downloaded and then uploaded to the google drive folder that you have specified </br>

**note that this work is not encouraging anyone to download illegal content via torrent** </br>

## TODO
Contributions are always welcome. Currently there are few important things to do:
* Create identical github actions, currently CI/CD runs on gitlab for this repo
* Try to use a minimal torrent client container based on alpine linux, like aria2c
* Add support for general download links on top of torrents, using aria2c will fix this

_Wolke just means cloud in German xD_
