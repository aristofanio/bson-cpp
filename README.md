# bson-cpp

## The standalone BSON C++ implementation.

"BSON" stands for "binary JSON" - a binary storage format that is JSON inspired.

This is the C++ implementation, developed by [http://www.10gen.com/](10gen) for
[http://www.mongodb.org/](mongodb). This distribution merely rips it out of the
mongodb repository into its own.

Other BSON implementations are available for most languages at
http://bsonspec.org.

## Status: beta

Note that this is not yet ready for production. While all the majority of the code has been thoroughly tested in the mongodb distribution, this fork is not yet proved stable.

## Configure

To configure use you need install boost libs, see here [https://stackoverflow.com/questions/104322/how-do-you-install-boost-on-macos](how install Boost in MacOS). After digit this command:

    make configure LDFLAGS=-L/opt/local/lib CXXFLAGS=-std=c++11 LIBS=-lboost_system-mt


In this case Boost libs and headers was installed in /opt/local/lib and /opt/local/include.

## Building

The build system here uses autotools. It is a bit unconventional: it hides all
the autotools magic inside of build/, so all you have to do is:

    make


The top level Makefile will call configure and the generated Makefile (inside
build/). The product is build/libbsoncpp.la. You can then link against it.

## Installing

To install the library and headers in /usr/local, just run:

    sudo make install

## Usage

You want to link against the library, and then:

    #include <bson/bson.h>

Check out the headers, particularly bson.h. The project is not fully well setup
though, so you may have to include other headers for now.

## Demo

In directory bsondemo:

    g++ -o bsondemo -I/opt/local/include bsondemo.cpp
    ./bsondemo


The result:

    build bits: 64

    empty: {}
    json for x:{ name: "joe", age: 33.7 }
    Some x things: name: "joe" 33.7 0
    y: { x: "asdf", y: true, subobj: { z: 3, q: 4 } }
    subobj.z: 3
    subobj.z: 3
    x: "asdf"
    my ints: 3 4
    1 strings, first one: joe

    iter()
    x: "asdf"
    y: true
    subobj: { z: 3, q: 4 }


## License

I am not quite sure what BSON's license is. I'll check with 10gen. mongodb
carries both an Apache and a GNU-AGPL license (included in this dist).

