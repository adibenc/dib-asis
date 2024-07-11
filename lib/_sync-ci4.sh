__baserepo=edatun_admin
__baserepo=edatun_admin

mkdir public
rsync -a -logt --info=progress2 /media/data2/links/htdocs/$__baserepo/bundle/ ./bundle/
rsync -a -logt --info=progress2 /media/data2/links/htdocs/$__baserepo/public/ ./public/
rsync -a -logt --info=progress2 /media/data2/links/htdocs/$__baserepo/writable/ ./writable/
rsync -a -logt --info=progress2 /media/data2/links/htdocs/$__baserepo/app/Controllers/BaseController.php ./app/Controllers/BaseController.php
rsync -a -logt --info=progress2 /media/data2/links/htdocs/edatun_admin/app/Controllers/BaseCtrlTrait.php ./app/Controllers/BaseCtrlTrait.php
rsync -a -logt --info=progress2 /media/data2/links/htdocs/edatun_admin/app/Controllers/ResourceController.php ./app/Controllers/ResourceController.php
git add -f writable/*/.gitignore
git add -f public/assets/js/*
git add -f public/assets/css/*
git add -f bundle/common.php
git add -f bundle/loader.php