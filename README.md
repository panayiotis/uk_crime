# UK crime dataset

This is a utility repo with a Makefile that fetches the official uk crime dataset from the
official source.
It is meant to be used as a git subtree inside another git repo.

Source: [data.police.uk/data/archive](https://data.police.uk/data/archive)

Description: [data.police.uk/about](https://data.police.uk/about)

Publisher: UK Government, Single Online Home National Digital Team

Licence: [Open Government Licence v3.0](http://www.nationalarchives.gov.uk/doc/open-government-licence/version/3/)
(compatible with the Creative Commons Attribution (CC-BY) licence).


## Fetch dataset

    make all


## Create streets.csv.gz
Combine all street data files to a single csv file
```sh
  true \
  && find . -name '*-street.csv' \
  | head -1 \
  | xargs -i head -1 {} \
  | tr '[:upper:]' '[:lower:]' \
  | sed 's/ /_/g' \
  > street.csv \
  && find . -name '*-street.csv' \
  | xargs -i -n1 sed '1d' {} \
  | pv --rate --bytes --eta --size 65m --line-mode \
  >> street.csv \
  && pigz street.csv
```
