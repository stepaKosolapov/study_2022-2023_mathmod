---
## Front matter
title: "Отчёт по лабораторной работе 1"
author: "Косолапов Степан Эдуардович"

## Generic otions
lang: ru-RU
toc-title: "Содержание"

## Bibliography
bibliography: bib/cite.bib
csl: pandoc/csl/gost-r-7-0-5-2008-numeric.csl

## Pdf output format
toc: true # Table of contents
toc-depth: 2
lof: true # List of figures
lot: true # List of tables
fontsize: 12pt
linestretch: 1.5
papersize: a4
documentclass: scrreprt
## I18n polyglossia
polyglossia-lang:
  name: russian
  options:
	- spelling=modern
	- babelshorthands=true
polyglossia-otherlangs:
  name: english
## I18n babel
babel-lang: russian
babel-otherlangs: english
## Fonts
mainfont: PT Serif
romanfont: PT Serif
sansfont: PT Sans
monofont: PT Mono
mainfontoptions: Ligatures=TeX
romanfontoptions: Ligatures=TeX
sansfontoptions: Ligatures=TeX,Scale=MatchLowercase
monofontoptions: Scale=MatchLowercase,Scale=0.9
## Biblatex
biblatex: true
biblio-style: "gost-numeric"
biblatexoptions:
  - parentracker=true
  - backend=biber
  - hyperref=auto
  - language=auto
  - autolang=other*
  - citestyle=gost-numeric
## Pandoc-crossref LaTeX customization
figureTitle: "Рис."
tableTitle: "Таблица"
listingTitle: "Листинг"
lofTitle: "Список иллюстраций"
lotTitle: "Список таблиц"
lolTitle: "Листинги"
## Misc options
indent: true
header-includes:
  - \usepackage{indentfirst}
  - \usepackage{float} # keep figures where there are in the text
  - \floatplacement{figure}{H} # keep figures where there are in the text
---

# Цель работы

Ознакомиться с git и Markdown. Сформировать рабочее окружение.

# Задание

Создайте каталоги для работы на основе документа Рабочее пространство для лабораторной работы.

# Теоретическое введение

[Методичка по git](https://esystem.rudn.ru/pluginfile.php/1971716/mod_folder/content/0/git.pdf)


[Методичка по Markdown](https://esystem.rudn.ru/pluginfile.php/1971716/mod_folder/content/0/markdown.pdf)

# Выполнение лабораторной работы

Создаем структуру каталогов (рис. @fig:000).

![Структура каталогов](./image/0.png){#fig:000 width=70%}

Создаем репозиторий на github (рис. @fig:001).

![Создали репозиторий](./image/1.png){#fig:001 width=70%}

Видим, что репозиторий создался (рис. @fig:002).

![Репозиторий в github](./image/2.png){#fig:002 width=70%}

Клонируем себе репозиторий локально (рис. @fig:003).

![Репозиторий локально](./image/3.png){#fig:003 width=70%}

Репозиторий склонировался (рис. @fig:004).

![Результат git clone](./image/4.png){#fig:004 width=70%}

Далее создаем структуру каталогов через make (рис. @fig:005).

![Создание структуры через make](./image/5.png){#fig:005 width=70%}

Устаанвливаем pandoc и mactex(texlive для OSX) (рис. @fig:006).

![Установка pandoc и latex](./image/6.png){#fig:006 width=70%}

Коммитим изменения через git (рис. @fig:007).

![Коммит изменений через git](./image/7.png){#fig:007 width=70%}

Пушим в github (рис. @fig:008).

![Git push](./image/8.png){#fig:008 width=70%}

Видим, что изменения запушились  (рис. @fig:009).

![Результат git push в github](./image/9.png){#fig:009 width=70%}


# Выводы

В ходе данной лабораторной работы мы вспомнили как работать с git и markdown, создали рабочее пространство.

# Список литературы{.unnumbered}

::: {#refs}
:::
