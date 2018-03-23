# StartLess

## Table of content

[1. installation](#)
> [1.1 Composer](#)\
> [1.2 or Download](#)

[2. Usage @ Dev](#)
> [2.1 Locate main Less file](#)\
> [2.2 Configuration](#)\
> [2.3 Compress CSS / Sourcemap](#)\
> [2.4 LESS Mixins](#)\
> [2.5 CSS Rules](#)

[3. Usage @ Production](#)
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

