# Wolke Torrent

Many ISP's and private networks block torrent traffic. Even in educational institutions, many sites for downloading resources directly or by using torrents are blocked. </br>
Wolke torrent provides a solution to this problem by downloading the torrent file / content from a standard download link on cloud and transferring it to a google drive. The google drive links generally do not have any restriction. 

**note that this work is not encouraging anyone to download illegal content via torrent** </br>
**use cases include many os realeases and data sets available as torrents**</br>

## Self Hosting
Please have a look at [cloud-torrent](https://github.com/jpillora/cloud-torrent) which serves the same purpose but is more user friendly and can be easily self hosted. You can host it easily on Amazon ec2 or Google GCE. </br>

The current implementation is experimental and uses the CI/CD pipeline provided by Github / Gitlab to get the work done. </br>
Both Github and Gitlab provide shared kubernetes runners for running the defined CI/CD pipeline. </br>
A kubernetes cluster for running CI/CD can be manually setup for running these jobs, I recommend this </br>

**please use the current working in free runners provided by github/gilab only for testing it out beforing setting up a private runner**
**the ci/cd pipelines should be ideally used for building and testing code, this is just an experiment**

## How to Use
Fork the repo, in the `to_download.sh` change the `NAME` to to the file name you want the final zip with the downloaded content to have </br>
Add the magnet link or the torrent file path (relative to the root of the repo in the `DOWNLOAD_LINK` variable </br>
If case of using a torrent file, add the torrent file too. </br>

I am assuming pipelines run on pull requests too, I haven't tested it :p </br>
In case a pipeline is triggered, your file will be downloaded and then uploaded to my shared google folder, which is currently only shared with a bunch of people, so not public. When it is made public, I will add the link to here. </br>

Meanwhile if you want to use it to upload to your account, it's a long process and I you can understand the requirements and the pipeline by looking at the project files.

## TODO
Contributions are always welcome. Currently there are few important things to do:
* Create identical github actions, currently CI/CD runs on gitlab for this repo
* Try to use a minimal torrent client container based on alpine linux, like aria2c
* Add support for general download links on top of torrents, using aria2c will fix this

_Wolke just means cloud in German xD_
