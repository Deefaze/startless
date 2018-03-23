# StartLess

## Table of content

[1. installation](#1-installation)
> [1.1 Composer](#11-composer)\
> [1.2 or Download](#12-or-download)\
> [1.3 View reference page](#13-view-reference-page)

[2. Usage @ Dev](#2-usage--dev)
> [2.1 Locate main Less file](#21-locate-main-less-file)\
> [2.2 Configuration](#22-configuration)\
> [2.3 Compress CSS / Sourcemap](#23-compress-css--sourcemap)\
> [2.4 LESS Mixins](#24-less-mixins)\
> [2.5 CSS Rules](#25-css-rules)

[3. Usage @ Production](#3-usage--production)

___

## What is StartLess ?

Startless is a Less/Css starting bloc for any Html/CSS web application. Startless include base of css reset, normalization, fonts and colors theme.

## What StartLess use ?

Startless use LESS/CSS type files.

Fonts theme base on some of Google Fonts like Roboto, Lato, Ubuntu, Oswald...

___

# 1. Installation

## 1.1 Composer

Run this `composer` command in your `terminal` :
```console
composer require deefaze/startless dev-master
```

## 1.2 or Download

Go to [Deefaze/starless](https://github.com/Deefaze/startless) repo, select `master` branch and click `Clone or download` > `Download ZIP` or just [Click here](https://github.com/Deefaze/startless/archive/master.zip).

## 1.3 View reference page

The `test/index.html` cannot be called directly from `file:///` protocol, launch from your own server. 

Starless provide a script for create a PHP Server on 127.0.0.254:80.

Go to Startless root path, open a terminal (CMD on Windows) and run `win-php-server.cmd` (NB: require a valid PHP > v5.3 installation), this launch automaticaly the index in your browser. 
If not, go to [http://127.0.0.254:80/test/index.html](http://127.0.0.254:80/test/index.html)

Other terminal in your editor ? You can launch CMD into your current terminal (terminalception), run like this :
```console
dev@dev-PC MINGW64 /s/www/startless/ (master)
$ cmd /k
```
next, run `win-php-server.cmd` from CMD :
```console
Microsoft Windows [version 10]
(c) 2017 Microsoft Corporation. All rights reserved.

S:\www\startless\win-php-server.cmd
```
Return to your terminal ? run `exit` from CMD.

___
&mapstoup;  [Return to TOC](#table-of-content)
___

# 2. Usage @ Dev

## 2.1 Locate main LESS file

The main file is `src/scss/styles.less`. But this, contain only `@import` directives. `src/scss/Public/` folder is more [interesting](#25-scsspublic).

## 2.2 Configuration

`config\` contain Startless `config.less`, you need to edit this :
```less
// Theme [default, belle, onedark]
@theme-selector : 'onedark';

// Font [default, raleway, ubuntu, roboto, laosov (lato, oswald, overpass), ibm]
@font-selector  : 'ibm';
```

## 2.3 Compress CSS / Sourcemap

This is localized into `scss/styles.less` file.\
If you use a less compiler  who support first line parameter like :
```less
// out: ../css/styles.css, compress: false, sourcemap: false
```
You just need to set `compress` or `sourcemap` to `true/false`. 

## 2.4 LESS Mixins

`components/` contain Less mixins, themes, fonts, no CSS rules here ...

`components/themes/` contain all colors themes, you can add yours here.\
`components/themes.less` Startless themes core file.

`components/fonts/` contain all fonts configurations, you can add yours here.\
`components/fonts.less` Startless fonts core file.

## 2.5 CSS Rules

`public\` contain all CSS rules. Put yours here. This already contain a
basic reset and normalizer, root (`:root{}`) variables, document parameters ...

___
&mapstoup;  [Return to TOC](#table-of-content)
___

# 3. Usage @ Production

Compile `scss/styles.less` and use `css/styles.css` in your project, like :
```html
<head>
  { ... }
  <link type="text/css" rel="stylesheet" href="vendor/deefaze/startless/src/css/styles.css">
  { ... }
</head>
```
NB : On standard production, startless is not needed, you can deploy only `css/styles.css` file in your assets or configure the `out` file parameter in `styles.less` for targeting the `assets/css` folder, example :
```less
// out: ../../../../../assets/css/styles.css, compress: true, sourcemap: false
```
___
&mapstoup;  [Return to TOC](#table-of-content)
___