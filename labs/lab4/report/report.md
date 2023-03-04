---
## Front matter
title: "Лабораторная работа №4"
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

Рассмотреть модель гармонических колебаний

## Задача

Постройте фазовый портрет гармонического осциллятора и решение уравнения гармонического осциллятора для следующих случаев 

1. Колебания гармонического осциллятора без затуханий и без действий внешней
силы $\ddot{x}+2x=0$
2. Колебания гармонического осциллятора c затуханием и без действий внешней
силы $\ddot{x}+3\dot{x}+3x=0$
3. Колебания гармонического осциллятора c затуханием и под действием внешней
силы $\ddot{x}+4\dot{x}+4x\cos{4t}$

На итнтервале $t \in [ 0;44 ]$, шаг 0.05, $x_0=1.5, y_0=1.1$

# Выполнение лабораторной работы

## Теоретические сведения

Движение грузика на пружинке, маятника, заряда в электрическом контуре, а также эволюция во времени многих систем в физике, химии, биологии и других науках при определенных предположениях можно описать одним и тем же дифференциальным уравнением, которое в теории колебаний выступает в качестве основной модели. Эта модель называется линейным гармоническим осциллятором.
Уравнение свободных колебаний гармонического осциллятора имеет следующий вид:
$$\ddot{x}+2\gamma\dot{x}+\omega_0^2=0$$

где $x$ - переменная, описывающая состояние системы (смещение грузика, заряд конденсатора и т.д.), $\gamma$ - параметр, характеризующий потери энергии (трение в механической системе, сопротивление в контуре), $\omega_0$ - собственная частота колебаний.
Это уравнение есть линейное однородное дифференциальное  уравнение второго порядка и оно является примером линейной динамической системы.

При отсутствии потерь в системе ( $\gamma=0$ ) получаем уравнение консервативного осциллятора энергия колебания которого сохраняется во времени.
$$\ddot{x}+\omega_0^2x=0$$

Для однозначной разрешимости уравнения второго порядка необходимо задать два начальных условия вида
 
$$
 \begin{cases}
	x(t_0)=x_0
	\\   
	\dot{x(t_0)}=y_0
 \end{cases}
$$

Уравнение второго порядка можно представить в виде системы двух уравнений первого порядка:
$$
 \begin{cases}
	x=y
	\\   
	y=-\omega_0^2x
 \end{cases}
$$

Начальные условия для системы примут вид:
$$
 \begin{cases}
	x(t_0)=x_0
	\\   
	y(t_0)=y_0
 \end{cases}
$$

Независимые	переменные	$x, y$	определяют	пространство,	в	котором «движется» решение. Это фазовое пространство системы, поскольку оно двумерно будем называть его фазовой плоскостью.
Значение фазовых координат $x, y$ в любой момент времени полностью определяет состояние системы. Решению уравнения движения как функции времени отвечает гладкая кривая в фазовой плоскости. Она называется фазовой траекторией. Если множество различных решений (соответствующих различным 
начальным условиям) изобразить на одной фазовой плоскости, возникает общая картина поведения системы. Такую картину, образованную набором фазовых траекторий, называют фазовым портретом.

## Ход работы

1. В системе отсутствуют потери энергии (колебания без затухания)
Получаем уравнение 
$$\ddot{x}+\omega_0^2x=0$$

Переходим к двум дифференциальным уравнениям первого порядка:
$$
 \begin{cases}
	\dot{x}=y
	\\   
	\dot{y}=-\omega_0^2x
 \end{cases}
$$

Напишем код на openmodelica[@modelica]

```
model Lab4_1
  parameter Real w=2;
  
  Real x(start=1.5);
  Real y(start=1.1);
equation
  der(x) = y;
  der(y) = -w*x;
  
  annotation(experiment(StartTime = 0, StopTime = 44, Tolerance = 1e-6, Interval = 0.05));
end Lab4_1;
```

![График решения для случая 1](image/mod1.1.png){ #fig:001 width=70% height=70% }

![Фазовый портрет для случая 1](image/mod1.2.png){ #fig:002 width=70% height=70% }

Напишем код в Julia [@ode]

```
using DifferentialEquations
using Plots

const x = 1.5
const y = 1.1

function res1(du,u,p,t)
    du[1] = u[2]
    du[2] = -2u[1]
end

condition(u,t,integrator) = 50
cb = ContinuousCallback(condition,terminate!)
u0 = [x, y]
tspan = (0.0,44.0)

prob = ODEProblem(res1,u0,tspan, callback = cb)
sol = solve(prob)
plt1 = plot(sol)

```

2.  В системе присутствуют потери энергии (колебания с затуханием)
Получаем уравнение 
$$\ddot{x}+2\gamma\dot{x}+\omega_0^2x=0$$

Переходим к двум дифференциальным уравнениям первого порядка:
$$
 \begin{cases}
	\dot{x}=y
	\\   
	\dot{y}=-2\gamma y-\omega_0^2x
 \end{cases}
$$

Напишем код на openmodelica[@modelica]

```
model Lab4_2
  parameter Real w=3;
  parameter Real g=3;
  
  Real x(start=1.5);
  Real y(start=1.1);
equation
  der(x) = y;
  der(y) = -g*y-w*x;
  
  annotation(experiment(StartTime = 0, StopTime = 44, Tolerance = 1e-6, Interval = 0.05));
end Lab4_2;
```

![График решения для случая 2](image/mod2.1.png){ #fig:004 width=70% height=70% }

![Фазовый портрет для случая 2](image/mod2.2.png){ #fig:005 width=70% height=70% }

Напишем код в Julia [@ode]

```
using DifferentialEquations
using Plots

const x = 1.5
const y = 1.1

function res2(du,u,p,t)
    du[1] = u[2]
    du[2] = -3u[2]-3u[1]
end

prob2 = ODEProblem(res2,u0,tspan, callback = cb)
sol2 = solve(prob2)
plt2 = plot(sol2)
```

1. На систему действует внешняя сила.
Получаем уравнение 
$$\ddot{x}+2\gamma\dot{x}+\omega_0^2x=F(t)$$

Переходим к двум дифференциальным уравнениям первого порядка:
$$
 \begin{cases}
	\dot{x}=y
	\\   
	\dot{y}=F(t)-2\gamma y-\omega_0^2x
 \end{cases}
$$

Напишем код на openmodelica[@modelica]

```
model Lab4
  parameter Real w=4;
  parameter Real g=4;
  
  Real x(start=1.5);
  Real y(start=1.1);
equation
  der(x) = y;
  der(y) = -g*y-w*x + sin(4*time);
  
  annotation(experiment(StartTime = 0, StopTime = 44, Tolerance = 1e-6, Interval = 0.05));

end Lab4;
```
![График решения для случая 3](image/mod3.1.png){ #fig:007 width=70% height=70% }

![Фазовый портрет для случая 3](image/mod3.2.png){ #fig:008 width=70% height=70% }

Вариант в Julia [@ode]

```
using DifferentialEquations
using Plots

const x = 1.5
const y = 1.1

function res3(du,u,p,t)
    du[1] = u[2]
    du[2] = -4u[2]-4u[1] + sin(4*t)
end

condition(u,t,integrator) = 50
cb = ContinuousCallback(condition,terminate!)
u0 = [x, y]
tspan = (0.0,44.0)

prob3 = ODEProblem(res3,u0,tspan, callback = cb)
sol3 = solve(prob3)
plt3 = plot(sol3)
```

# Выводы

Рассмотрели и построили фазовые портреты гармонических колебаний без затухания, с затуханием и при действии внешней силы.

# Список литературы{.unnumbered}

::: {#refs}
:::