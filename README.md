# NBA - BRONDATA - COL

### Overview
This is the source data of COL for the nba etl. Data is compressed.

### Requirements
You need a `sh` shell, `gzip` and `split` installed

### How to use

#### compress (before commit)
1. add the files to `filelist`
2. run `sh ./compress.sh`
3. add, commit and push

#### decompress (after pull/clone)
1. run `sh ./uncompress.sh`

### Updating .gitignore
The `.gitignore` file is build in reverse, so all files are excluded by default, and only specific files are added.
The default is
```
*
!README.md
!filelist
!*.sh
!*.gz.*
!.gitignore
```

