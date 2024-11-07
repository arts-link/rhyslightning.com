## AWS Setup

login with your profile.
```bash
aws configure
```

## Deploy 

```bash
hugo deploy
```

## Invalidate the cloudfront distribution after deploy

```bash
aws cloudfront create-invalidation --distribution-id E1J7PVZ8DBPM0V --paths "/*"
```

## New deploy script

now you can just run 

```bash
./deploy.sh
```
 to get to the right profile, invalidate the cache and build and deploy.

## Create content for a gallery

```bash
hugo new galleries/<date> --kind gallery
```