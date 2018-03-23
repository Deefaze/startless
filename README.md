# StartLess

## What is StartLess ?

Startless is a Less/Css starting bloc for any Html/CSS web application. Startless include base of css reset, normalization, fonts and colors theme.

## What StartLess use ?

Startless use LESS/CSS type files.

Fonts theme base on some of Google Fonts like Roboto, Lato, Ubuntu, Oswald...

--------------------

# 1. Installation

## 1.1 Composer installation

run this `composer` command in your `terminal` :
```console
composer require deefaze/startless dev-master
```

## 1.2 Locate main CSS file

The main file is localized to `src/css/styles.css`. 
You can use `-my-*\*.less` files for your own less interfaces or rules.

## 1.3 Add in your project

Modify and compile *.less `(main is styles.less)`, and use `styles.css` like :
```html
<head>
  <link type="text/css" rel="stylesheet" href="vendor/deefaze/startless/src/css/styles.css">
</head>
```
