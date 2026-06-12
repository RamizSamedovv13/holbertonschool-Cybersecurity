#!/usr/bin/env bash

if [ -z "$1" ]; then
    echo "Usage: $0 domain"
    exit 1
fi

whois "$1" | awk '
BEGIN {
    FS=": "
}

/Registrant/ {
    if ($1 ~ /Name|Organization|Street|City|State|Province|Postal|Code|Country|Phone|Fax|Email/) {
        print "Registrant " $1 "," $2
    }
}

/Admin/ {
    if ($1 ~ /Name|Organization|Street|City|State|Province|Postal|Code|Country|Phone|Fax|Email/) {
        print "Admin " $1 "," $2
    }
}

/Tech/ {
    if ($1 ~ /Name|Organization|Street|City|State|Province|Postal|Code|Country|Phone|Fax|Email/) {
        print "Tech " $1 "," $2
    }
}
'
