echo 'Fetching Joomla'
echo 'Sorry this is a bit slow currently...'
# TODO make it skip the download if we already have the right version..

# New version tags can be gotten from https://github.com/joomla/joomla-cms/releases
curl -s -L -o joomla.zip 'https://github.com/joomla/joomla-cms/archive/3.9.23.zip'

rm -rf ./.docker/www
mkdir -p ./.docker/www

unzip -q joomla.zip -d ./.docker/www
mv ./.docker/www/*/* ./.docker/www/

rm -rf ./.docker/www/installation
rm -rf ./.docker/www/joomla-cms-*
rm joomla.zip