using DifferentialEquations
using Plots

const x = 1
const y = 0

function res1(du,u,p,t)
    du[1] = u[2]
    du[2] = -2u[1]
end

function res2(du,u,p,t)
    du[1] = u[2]
    du[2] = -3u[1]-3u[1]
end

function res3(du,u,p,t)
    du[1] = u[2]
    du[2] = -4u[2]-4u[1] + sin(4t)
end

condition(u,t,integrator) = 50
cb = ContinuousCallback(condition,terminate!)
u0 = [x, y]
tspan = (0.0,44.0)
# case 1
prob = ODEProblem(res1,u0,tspan, callback = cb)
sol = solve(prob)
plt1 = plot(sol)

# case 2
prob2 = ODEProblem(res2,u0,tspan, callback = cb)
sol2 = solve(prob2)
plt2 = plot(sol2)

# case 3
prob3 = ODEProblem(res3,u0,tspan, callback = cb)
sol3 = solve(prob3)
plt3 = plot(sol3)

savefig(plt1, "julia1.png")
savefig(plt2, "julia2.png")
savefig(plt3, "julia3.png")