echo 'Moving stripe into our src directory'

# Remove anything that already exists
rm -rf ./src/site/libraries/stripe/*

# Make a fresh directory
mkdir -p ./src/site/libraries/stripe

# Copy the bits we want
cp ./vendor/stripe/stripe-php/init.php ./src/site/libraries/stripe/init.php
cp -r ./vendor/stripe/stripe-php/lib ./src/site/libraries/stripe/lib
cp ./vendor/stripe/stripe-php/VERSION ./src/site/libraries/stripe/VERSION