using Plots
using DifferentialEquations

"Начальные условия:"
x_0 = 39800
y_0 = 21400

u_0= [x_0, y_0]
T = (0.0, 3.0)

"Модель боевых действий 1:"
a_1 = 0.4
b_1 = 0.607
c_1 = 0.667
h_1 = 0.42

function P_1(t)
	return 2sin(3t)
end
 
function Q_1(t)
	return 2cos(6t)
end

function F_1!(du, u, p, t)
	du[1] = -a_1*u[1] - b_1*u[2] + P_1(t)
	du[2] = -c_1*u[1] - h_1*u[2] + Q_1(t)
end

prob_1 = ODEProblem(F_1!, u_0, T)
sol_1 = solve(prob_1, saveat=0.01)

plt_1 = plot(
	sol_1,
	vars = (0, 1),
	color =:green,
	label = "Численность армии страны X",
	title = "Модель боевых действий 1",
	xlabel = "Время",
	ylabel = "Численность"
)

plot!(
	sol_1,
	vars = (0, 2),
	color =:blue,
	label = "Численность армии страны Y"
)

savefig(plt_1, "julia_case_1.png")

"Модель боевых действий 2:"
a_2 = 0.337 
b_2 = 0.733
c_2 = 0.229
h_2 = 0.8

function P_2(t)
	return sin(2t) + 1
end

function Q_2(t)
	return 2cos(t)
end

function F_2!(du, u, p, t)
	du[1] = -a_2*u[1] - b_2*u[2] + P_2(t)
	du[2] = -c_2*u[1]*u[2] - h_2*u[2] + Q_2(t)
end

prob_2 = ODEProblem(F_2!, u_0, T)
sol_2 = solve(prob_2, saveat=0.01)

plt_2 = plot(
	sol_2,
	vars = (0, 1),
	color =:green,
	label = "Численность армии страны X",
	title = "Модель боевых действий №2",
	xlabel = "Время",
	ylabel = "Численность"
)

plot!(
	sol_2,
	vars = (0, 2),
	color =:blue,
	label = "Численность армии страны Y"
)
 
savefig(plt_2, "julia_case_2.png")