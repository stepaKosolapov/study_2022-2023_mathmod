using Plots 
using DifferentialEquations 

a = 0.57
b = 0.056
c = 0.59
d = 0.058

x_0 = a / b
y_0 = c / d

@show x_0
@show y_0

u_0 = [x_0, y_0] 
T = (0.0, 60.0)

function F!(du, u, p, t) 
    du[1] = -c * u[1] + d * u[1] * u[2] 
    du[2] = a * u[2] - b * u[1] * u[2] 
end 
 
prob = ODEProblem(F!, u_0, T) 
sol = solve(prob, saveat = 0.05)

const X = Float64[] 
const Y = Float64[] 

for u in sol.u 
    x, y = u 
    push!(X, x) 
    push!(Y, y) 
end 

plt = plot( 
    dpi = 300, 
    size = (800, 600), 
    title = "График зависимости численности хищников от численности жертв" 
) 
 
plot!( 
    plt, 
    Y, 
    X, 
    color = :red, 
    label = "Фазовый портрет" 
) 
 
savefig(plt, "julia_2_stat.png") 

plt_2 = plot( 
    dpi = 300, 
    size = (800, 600), 
    title = "Графики изменения численности хищников и численности жертв" 
) 

plot!( 
    plt_2, 
    sol.t, 
    X, 
    color = :blue, 
    label = "Число жертв" 
) 

plot!( 
    plt_2, 
    sol.t, 
    Y, 
    color = :purple, 
    label = "Число хищников" 
) 

savefig(plt_2, "julia_1_stat.png")
