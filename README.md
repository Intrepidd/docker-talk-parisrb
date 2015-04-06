# How to run it

    # Build the image from Dockerfile
    docker build --rm -t 'mini_ci' .
    # Bundle gems
    bundle install
    # Run it 
    ruby mini_ci.rb "https://github.com/Intrepidd/working_hours"
