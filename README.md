# Portland Permaculture Project

#### Find Information to Create Your Garden, 3/7/2016

#### By Charles Carter, Cory Meyers, Blair Peterson, Will Murphy, and Michelle Brecunier

## Description

This site provides information for people looking to start their own permaculture project in the Pacific Northwest region. Users can create an account to search and select plants that will meet their needs.

## Setup/Installation Requirements

* Clone this repository.
* Make sure you have Java and Gradle installed.
    * For Java:
        * Download and install [Java SDK](http://www.oracle.com/technetwork/java/javase/downloads/jdk8-downloads-2133151.html)
        * Download and install [Java JRE](http://www.java.com/en/)
    * For Gradle: if you are using Homebrew on Mac:
        * $ brew update
        * $ brew install gradle
    * For Postgres: if you are using Homebrew on Mac:
        * $ brew install postgres
        * $ echo "export PGDATA=/usr/local/var/postgres" >> ~/.bash_profile
        * $ echo "export PGHOST=/tmp" >> ~/.bash_profile
        * $ source ~/.bash_profile
* Open a new terminal window to start Postgres server:
    * $ postgres
* Open a new terminal window to build the database:
    * $ psql name < name.sql;
* In the top level of the cloned directory, run the following command in your terminal:
    * $ gradle run
* Open your web browser of choice to localhost:4567

## Technologies Used

Java, Spark, Junit, Velocity, Fluentlenium, Postgres, Bootstrap

### License

This software is licensed under the MIT license.

Copyright (c) 2016 Charles Carter, Cory Meyers, Blair Peterson, Will Murphy, and Michelle Brecunier

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
